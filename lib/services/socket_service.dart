import 'package:laravel_echo_null/laravel_echo_null.dart';
import 'package:logger/logger.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  Echo? _echo;
  bool _isConnected = false;

  String? _authToken;
  String? _userId;

  final Logger _logger = Logger();

  bool get isConnected => _isConnected;
  Echo? get echo => _echo;

  // ------------------------------------------------------------
  // INITIALIZE & CONNECT
  // ------------------------------------------------------------
  void initialize({required String authToken, required String userId}) {
    if (_isConnected && _echo != null) {
      _logger.i("Socket already initialized.");
      return;
    }

    _authToken = authToken;
    _userId = userId;

    try {
      _logger.i("Initializing WebSocket...");

      _echo = Echo.pusher(
        "8174546d46469a411de7f80aeed657fb",
        authEndPoint: "https://ws.kreyno.fr/broadcasting/auth",
        autoConnect: false,
        host: "ws.kreyno.fr",
        wsPort: 443,
        wssPort: 443,
        encrypted: true,
        authHeaders: () async {
          return {
            "Authorization": "Bearer $_authToken",
            "Accept": "application/json",
          };
        },
      );

      // Attach connector event handlers
      _attachConnectorHandlers();

      _echo!.connect();
    } catch (e, stack) {
      _logger.e("Socket initialization error: $e");
      _logger.e(stack.toString());
      _isConnected = false;
    }
  }

  // ------------------------------------------------------------
  // CONNECTOR HANDLERS (THE REAL SOURCE OF TRUTH)
  // ------------------------------------------------------------
  void _attachConnectorHandlers() {
    final connector = _echo!.connector;

    connector.onConnect((data) {
      _isConnected = true;
      _logger.i("🔌 CONNECTED");
      _logger.d("Handshake: $data");
    });

    connector.onDisconnect((reason) {
      _isConnected = false;
      _logger.w("🔌 DISCONNECTED");
      if (reason != null) _logger.w("Reason: $reason");
    });

    connector.onError((error) {
      _isConnected = false;
      _logger.e("❌ ERROR: $error");
    });
  }

  // ------------------------------------------------------------
  // DISCONNECT
  // ------------------------------------------------------------
  void disconnect() {
    try {
      _echo?.disconnect();
      _logger.i("Socket disconnected.");
    } catch (e) {
      _logger.e("Disconnect error: $e");
    }

    _isConnected = false;
    _echo = null;
    _authToken = null;
    _userId = null;
  }

  // ------------------------------------------------------------
  // PRIVATE CHANNEL
  // ------------------------------------------------------------

  void listenToPrivateChannel({
    required String channel,
    required String event,
    required Function(dynamic) onEvent,
    Function(dynamic)? onError,
  }) {
    if (_echo == null) {
      _logger.e("Echo is null — cannot subscribe.");
      return;
    }

    try {
      _echo!.listen(channel, event, onEvent);
      _logger.i("Subscribed to private-$channel -> $event");
    } catch (e) {
      _logger.e("Failed to subscribe to private-$channel: $e");
      if (onError != null) onError(e);
    }
  }

  // ------------------------------------------------------------
  // PUBLIC CHANNEL
  // ------------------------------------------------------------
  void listenToPublicChannel({
    required String channel,
    required String event,
    required Function(dynamic) onEvent,
  }) {
    if (_echo == null) {
      _logger.e("Echo is null — cannot subscribe.");
      return;
    }

    try {
      _echo!.listen(channel, event, onEvent);
      _logger.i("Subscribed to $channel -> $event");
    } catch (e) {
      _logger.e("Failed to subscribe to $channel: $e");
    }
  }

  // ------------------------------------------------------------
  // LEAVE CHANNEL
  // ------------------------------------------------------------
  void leaveChannel(String channel, {bool isPrivate = true}) {
    if (_echo == null) return;

    try {
      final name = isPrivate ? 'private-$channel' : channel;
      _echo!.leave(name);
      _logger.i("Left channel: $name");
    } catch (e) {
      _logger.e("Leaving channel failed: $e");
    }
  }

  // ------------------------------------------------------------
  // DEBUG
  // ------------------------------------------------------------
  void debugStatus() {
    _logger.i("Connected: $_isConnected");
    _logger.i("Echo instance: ${_echo != null}");
    _logger.i("Token set: ${_authToken != null}");
    _logger.i("User ID: $_userId");
  }
}
