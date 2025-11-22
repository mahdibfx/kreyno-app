import 'package:laravel_echo_null/laravel_echo_null.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  factory SocketService() {
    return _instance;
  }

  SocketService._internal();

  Echo? _echo;
  bool _isConnected = false;
  String? _authToken;
  String? _userId;

  bool get isConnected => _isConnected;
  Echo? get echo => _echo;

  /// Initialize and connect to WebSocket
  void initialize({
    required String authToken,
    required String userId,
    String? pusherAppKey,
    String? authEndpoint,
  }) {
    if (_isConnected) {
      print('WebSocket already connected');
      return;
    }

    _authToken = authToken;
    _userId = userId;

    _echo = Echo.socket(
      "wss://ws.kreyno.net/'}",
      autoConnect: false,

      authHeaders: () async => {
        'Authorization': 'Bearer $authToken',
        'Accept': 'application/json',
      },
    );

    _echo!.connect();
    _isConnected = true;
    print('WebSocket connected for user: $userId');
  }

  /// Disconnect from WebSocket
  void disconnect() {
    if (_echo != null) {
      _echo!.disconnect();
      _isConnected = false;
      _authToken = null;
      _userId = null;
      print('WebSocket disconnected');
    }
  }

  /// Reconnect with existing credentials
  void reconnect() {
    if (_authToken != null && _userId != null) {
      disconnect();
      initialize(authToken: _authToken!, userId: _userId!);
    }
  }

  /// Subscribe to a private channel
  dynamic private(String channel) {
    if (!_isConnected || _echo == null) {
      throw Exception('WebSocket not connected. Call initialize() first.');
    }
    return _echo!.private(channel);
  }

  /// Subscribe to a public channel
  dynamic channel(String channel) {
    if (!_isConnected || _echo == null) {
      throw Exception('WebSocket not connected. Call initialize() first.');
    }
    return _echo!.channel(channel);
  }

  /// Leave a channel
  void leave(String channel) {
    _echo?.leave(channel);
  }
}
