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

  void initialize({required String authToken, required String userId}) {
    _logger.i("[SOCKET] 🚀 initialize() called");

    if (_isConnected && _echo != null) {
      _logger.w("[SOCKET] ⚠️ Already connected, skipping initialization");
      return;
    }

    _authToken = authToken;
    _userId = userId;

    _logger.d("[SOCKET] 🔐 Full token: $authToken");

    try {
      _logger.i("[SOCKET] 🌐 WebSocket URL: wss://kreyno.fr");

      _echo = Echo.socket(
        "wss://ws.kreyno.fr",
        autoConnect: false,

        authHeaders: () async {
          final headers = {
            'Authorization': 'Bearer $authToken',
            'Accept': 'application/json',
          };

          _logger.d("[SOCKET] 📋 Headers: $headers");
          return headers;
        },
      );

      _logger.i("[SOCKET] 🔗 Attempting to connect...");

      _echo!.connect();
      _isConnected = true;

      _logger.i("[SOCKET] ✅ Connect() called - Connection initiated");

      // Add a delay to check connection status
      Future.delayed(const Duration(seconds: 3), () {
        _logger.i("[SOCKET] 📊 Connection status check after 3s:");
        _logger.i("[SOCKET] isConnected flag: $_isConnected");
      });
    } catch (e, stackTrace) {
      _logger.e("[SOCKET] ❌ ERROR during initialization:");
      _logger.e("[SOCKET] Error: $e");
      _logger.e("[SOCKET] StackTrace: $stackTrace");
      _isConnected = false;
    }
  }

  void disconnect() {
    _logger.w("[SOCKET] 🔌 disconnect() called");

    try {
      _echo?.disconnect();
      _logger.i("[SOCKET] ✅ Disconnect() executed");
    } catch (e) {
      _logger.e("[SOCKET] ❌ Error during disconnect: $e");
    }

    _isConnected = false;
    _authToken = null;
    _userId = null;

    _logger.w("[SOCKET] 🧹 Cleanup complete");
    _logger.w("[SOCKET] isConnected: $_isConnected");
  }

  dynamic private(String channel) {
    _logger.i("[SOCKET] 📡 private() called");
    _logger.i("[SOCKET] Channel: $channel");
    _logger.i("[SOCKET] Full channel name will be: private-$channel");

    if (_echo == null) {
      _logger.e("[SOCKET] ❌ ERROR: Echo instance is null!");
      _logger.e("[SOCKET] ❌ Cannot subscribe to channel");
      _logger.e("[SOCKET] 💡 Did you call initialize() first?");
      return null;
    }

    if (!_isConnected) {
      _logger.w("[SOCKET] ⚠️ WARNING: Not connected, subscription may fail");
    }

    try {
      _logger.i("[SOCKET] 🔄 Calling _echo.private('$channel')...");
      final channelInstance = _echo!.private(channel);
      _logger.i("[SOCKET] ✅ Channel instance created");
      _logger.i(
        "[SOCKET] 💡 Remember to call .listen(event, callback) on this",
      );
      _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      return channelInstance;
    } catch (e, stackTrace) {
      _logger.e("[SOCKET] ❌ ERROR subscribing to channel:");
      _logger.e("[SOCKET] Error: $e");
      _logger.e("[SOCKET] StackTrace: $stackTrace");
      _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      return null;
    }
  }

  void listenToPrivateChannel({
    required String channel,
    required String event,
    required Function(dynamic) onEvent,
    Function(dynamic)? onError,
  }) {
    _logger.i("[SOCKET] 🎧 listenToPrivateChannel() called");
    _logger.i("[SOCKET] 📡 Channel: $channel");
    _logger.i("[SOCKET] 🎯 Event: $event");
    _logger.i("[SOCKET] 🔐 Full channel: private-$channel");

    if (_echo == null) {
      _logger.e("[SOCKET] ❌ ERROR: Echo instance is null!");
      _logger.e("[SOCKET] 💡 Call initialize() before subscribing");
      return;
    }

    if (!_isConnected) {
      _logger.w("[SOCKET] ⚠️ WARNING: Not connected yet");
      _logger.w("[SOCKET] 💡 Subscription may fail or delay");
    }

    try {
      _logger.i("[SOCKET] 🔄 Subscribing to private channel...");

      _echo!.private(channel).listen(event, (data) {
        _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        _logger.i("[SOCKET] 📨 EVENT RECEIVED!");
        _logger.i("[SOCKET] 📡 Channel: private-$channel");
        _logger.i("[SOCKET] 🎯 Event: $event");
        _logger.i("[SOCKET] 📦 Data type: ${data.runtimeType}");
        _logger.d("[SOCKET] 📄 Data content: $data");
        _logger.i("[SOCKET] 🔄 Calling callback...");

        try {
          onEvent(data);
          _logger.i("[SOCKET] ✅ Callback executed successfully");
        } catch (e, stackTrace) {
          _logger.e("[SOCKET] ❌ ERROR in callback:");
          _logger.e("[SOCKET] Error: $e");
          _logger.e("[SOCKET] StackTrace: $stackTrace");
        }

        _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      });

      _logger.i("[SOCKET] ✅ Successfully set up listener");
      _logger.i(
        "[SOCKET] ⏳ Waiting for '$event' events on 'private-$channel'...",
      );

      // Add error handler if provided
      if (onError != null) {
        _echo!.private(channel).error((error) {
          _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
          _logger.e("[SOCKET] ❌ SUBSCRIPTION ERROR!");
          _logger.e("[SOCKET] 📡 Channel: private-$channel");
          _logger.e("[SOCKET] 🎯 Event: $event");
          _logger.e("[SOCKET] ❌ Error: $error");
          onError(error);
          _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        });
        _logger.i("[SOCKET] ✅ Error handler attached");
      }

      _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    } catch (e, stackTrace) {
      _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      _logger.e("[SOCKET] ❌ CRITICAL ERROR in listenToPrivateChannel:");
      _logger.e("[SOCKET] Channel: $channel");
      _logger.e("[SOCKET] Event: $event");
      _logger.e("[SOCKET] Error: $e");
      _logger.e("[SOCKET] StackTrace: $stackTrace");
      _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    }
  }

  void listenToPublicChannel({
    required String channel,
    required String event,
    required Function(dynamic) onEvent,
  }) {
    _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    _logger.i("[SOCKET] 🎧 listenToPublicChannel() called");
    _logger.i("[SOCKET] 📡 Channel: $channel");
    _logger.i("[SOCKET] 🎯 Event: $event");

    if (_echo == null) {
      _logger.e("[SOCKET] ❌ ERROR: Echo instance is null!");
      _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      return;
    }

    try {
      _logger.i("[SOCKET] 🔄 Subscribing to public channel...");

      _echo!.channel(channel).listen(event, (data) {
        _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        _logger.i("[SOCKET] 📨 PUBLIC EVENT RECEIVED!");
        _logger.i("[SOCKET] 📡 Channel: $channel");
        _logger.i("[SOCKET] 🎯 Event: $event");
        _logger.d("[SOCKET] 📄 Data: $data");

        try {
          onEvent(data);
          _logger.i("[SOCKET] ✅ Callback executed");
        } catch (e) {
          _logger.e("[SOCKET] ❌ Error in callback: $e");
        }

        _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      });

      _logger.i("[SOCKET] ✅ Public listener set up successfully");
      _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    } catch (e, stackTrace) {
      _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      _logger.e("[SOCKET] ❌ ERROR in listenToPublicChannel:");
      _logger.e("[SOCKET] Error: $e");
      _logger.e("[SOCKET] StackTrace: $stackTrace");
      _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    }
  }

  void leaveChannel(String channel, {bool isPrivate = true}) {
    _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    _logger.i("[SOCKET] 🚪 leaveChannel() called");
    _logger.i("[SOCKET] 📡 Channel: $channel");
    _logger.i("[SOCKET] 🔐 Private: $isPrivate");

    if (_echo == null) {
      _logger.w("[SOCKET] ⚠️ Echo instance is null, nothing to leave");
      _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      return;
    }

    try {
      final fullChannel = isPrivate ? 'private-$channel' : channel;
      _echo!.leave(fullChannel);
      _logger.i("[SOCKET] ✅ Left channel: $fullChannel");
      _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    } catch (e) {
      _logger.e("[SOCKET] ❌ Error leaving channel: $e");
      _logger.e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    }
  }

  void debugStatus() {
    _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    _logger.i("[SOCKET] 🔍 DEBUG STATUS");
    _logger.i("[SOCKET] isConnected flag: $_isConnected");
    _logger.i("[SOCKET] Echo instance exists: ${_echo != null}");
    _logger.i("[SOCKET] Auth token exists: ${_authToken != null}");
    _logger.i("[SOCKET] Auth token length: ${_authToken?.length ?? 0}");
    _logger.i("[SOCKET] User ID: $_userId");
    _logger.i("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  }
}
