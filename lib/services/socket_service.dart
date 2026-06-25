import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:laravel_echo_null/laravel_echo_null.dart';
import 'package:logger/logger.dart';
import 'package:pusher_client_socket/pusher_client_socket.dart' as pusher;

/// A single active channel-level event binding.
///
/// We keep the [PusherChannel] so the exact event can later be unbound without
/// tearing down other listeners on the same channel.
class _ChannelBinding {
  /// Logical channel name (without the `private-` prefix), e.g. `user.42`.
  final String channelName;
  final String event;
  final PusherChannel channel;

  _ChannelBinding({
    required this.channelName,
    required this.event,
    required this.channel,
  });
}

/// Thin, correct wrapper around Laravel Echo + Pusher.
///
/// Design goals (the previous implementation leaked handlers and could storm):
///  * One shared connection, lazily established from the stored auth token.
///  * Bindings happen at the **channel** level (not the global client), so each
///    listener is scoped to its channel and can be individually unbound.
///  * Subscriptions are **idempotent per (channel, event)** — subscribing the
///    same event again replaces the previous callback instead of stacking it.
///    This is what makes repeated `subscribe...` calls safe.
class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  static const String _appKey = "8174546d46469a411de7f80aeed657fb";
  static const String _authEndpoint = "https://app.kreyno.fr/broadcasting/auth";
  static const String _host = "ws.kreyno.fr";

  final Logger _logger = Logger();
  final AuthService _authService = locator<AuthService>();

  Echo<pusher.PusherClient, PusherChannel>? _echo;
  bool _isConnected = false;

  /// Active bindings keyed by `"channel::event"`.
  final Map<String, _ChannelBinding> _bindings = {};

  bool get isConnected => _isConnected;

  // ───────────────────────────────────────────────────────────────────────
  // CONNECTION
  // ───────────────────────────────────────────────────────────────────────

  /// Ensures the socket is connected, establishing it on first use. Returns
  /// whether the connection is up. Safe to call repeatedly.
  Future<bool> ensureConnected() async {
    if (_isConnected && _echo != null) return true;

    if (_echo == null) {
      final token = await _authService.getAccessToken();
      if (token == null) {
        _logger.w("[Socket] No access token; cannot connect.");
        return false;
      }
      _init(token);
    }

    // Wait for the handshake to complete (up to ~8s) instead of a blind delay.
    for (var i = 0; i < 40 && !_isConnected; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
    }
    if (!_isConnected) _logger.e("[Socket] Connection timed out.");
    return _isConnected;
  }

  void _init(String token) {
    try {
      _logger.i("[Socket] Initializing…");
      _echo = Echo.pusher(
        _appKey,
        authEndPoint: _authEndpoint,
        autoConnect: false,
        host: _host,
        enableLogging: true,
        wsPort: 443,
        wssPort: 443,
        encrypted: true,
        authHeaders: () async => {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      final connector = _echo!.connector;
      connector.onConnect((_) {
        _isConnected = true;
        _logger.i("🔌 Socket connected");
      });
      connector.onDisconnect((reason) {
        _isConnected = false;
        _logger.w("🔌 Socket disconnected${reason != null ? ": $reason" : ""}");
      });
      connector.onError((error) {
        _logger.e("❌ Socket error: $error");
      });

      _echo!.connect();
    } catch (e, s) {
      _isConnected = false;
      _logger.e("[Socket] Init error: $e");
      _logger.e(s.toString());
    }
  }

  // ───────────────────────────────────────────────────────────────────────
  // SUBSCRIPTIONS
  // ───────────────────────────────────────────────────────────────────────

  /// Subscribes to [event] on the private [channel].
  ///
  /// Idempotent per (channel, event): a second call with the same pair drops
  /// the previous callback before binding the new one, so handlers never stack.
  /// [onEvent] receives the raw decoded event payload.
  Future<void> subscribePrivate({
    required String channel,
    required String event,
    required void Function(dynamic data) onEvent,
  }) async {
    if (!await ensureConnected()) return;

    final key = _key(channel, event);
    // Never stack duplicate handlers for the same event.
    _unbind(key);

    try {
      final ch = _echo!.private(channel) as PusherChannel;
      // Bind with the raw (server) event name at the channel level. Using
      // `on` avoids Echo's namespace formatting, which would mangle dotted
      // event names like `parking-place.grid-updated`.
      ch.on(event, (data) {
        try {
          onEvent(data);
        } catch (e, s) {
          _logger.e("[Socket] Handler error for $channel -> $event: $e");
          _logger.e(s.toString());
        }
      });
      _bindings[key] = _ChannelBinding(
        channelName: channel,
        event: event,
        channel: ch,
      );
      _logger.i("👂 Subscribed private-$channel -> $event");
    } catch (e, s) {
      _logger.e("[Socket] Subscribe failed for private-$channel -> $event: $e");
      _logger.e(s.toString());
    }
  }

  /// Stops listening to a single [event] on [channel], leaving the channel and
  /// any other event bindings on it intact.
  void unsubscribe({required String channel, required String event}) {
    _unbind(_key(channel, event));
  }

  /// Leaves a channel entirely: unbinds every event on it and unsubscribes.
  void leaveChannel(String channel) {
    _bindings.removeWhere((key, binding) {
      if (binding.channelName != channel) return false;
      _safeUnbind(binding);
      return true;
    });
    try {
      _echo?.leave(channel);
      _logger.i("Left channel: $channel");
    } catch (e) {
      _logger.e("[Socket] Leave error for $channel: $e");
    }
  }

  void _unbind(String key) {
    final binding = _bindings.remove(key);
    if (binding != null) _safeUnbind(binding);
  }

  void _safeUnbind(_ChannelBinding binding) {
    try {
      binding.channel.subscription.unbind(binding.event);
    } catch (e) {
      _logger.e("[Socket] Unbind error for ${binding.event}: $e");
    }
  }

  String _key(String channel, String event) => "$channel::$event";

  // ───────────────────────────────────────────────────────────────────────
  // TEARDOWN
  // ───────────────────────────────────────────────────────────────────────

  void disconnect() {
    try {
      _echo?.disconnect();
      _logger.i("[Socket] Disconnected.");
    } catch (e) {
      _logger.e("[Socket] Disconnect error: $e");
    }
    _bindings.clear();
    _isConnected = false;
    _echo = null;
  }
}
