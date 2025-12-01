import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/chat_message.dart';
import 'package:kreyno/services/api/api_chat_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class ChatService with ListenableServiceMixin {
  final _apiChatService = ApiChatService(locator<DioService>().dio);
  final _wsService = SocketService();
  final _authService = locator<AuthService>();
  final _logger = Logger();
  ChatMessage? _message;

  ChatMessage? get message => _message;

  ChatService() {
    listenToReactiveValues([_message]);
  }

  Future<Either<String, dynamic>> sendMessage(
    int reservationId,
    String message,
  ) {
    return _apiChatService.sendMessage(reservationId, {
      "message": message,
    }).toEither();
  }

  Future<Either<String, List<ChatMessage>>> getChatHistory(int reservationId) {
    return _apiChatService.getChatHistory(reservationId).toEither();
  }

  listenToMessageReceiver(int reservationId) async {
    try {
      // Check if socket is initialized
      if (!_wsService.isConnected) {
        final token = await _authService.getAccessToken();

        if (token == null) {
          _logger.w("No access token available");
          return;
        }

        _wsService.initialize(authToken: token, userId: "0");

        // Wait for connection to establish
        await Future.delayed(const Duration(seconds: 2));
      }
      // await Future.delayed(const Duration(seconds: 2));
      // _message = ChatMessage(
      //   senderId: locator<UserService>().currentUser!.id,
      //   body: "hhh",
      //   timestamp: DateTime.now().toIso8601String(),
      // );
      // notifyListeners();
      // return;

      // Verify echo is available after initialization
      if (!_wsService.isConnected) {
        _logger.e("Pusher still null after initialization");
        return;
      }

      // Subscribe to the private channel
      _wsService.listenToPrivateChannel(
        channel: 'reservation.$reservationId.chat',
        event: 'chat-message',
        onEvent: (event) {
          try {
            // Parse the reservation

            // Update the reservation
            _message = ChatMessage.fromJson(event);
            notifyListeners();
          } catch (e, stackTrace) {
            rethrow;
            _logger.e("Error parsing reservation: $e");
            _logger.e(stackTrace.toString());
          }
        },
        onError: (error) {
          _logger.e("Reservation channel error: $error");
        },
      );
    } catch (e, stackTrace) {
      _logger.e("Error setting up reservation listener: $e");
      _logger.e(stackTrace.toString());
    }
  }

  dispose(int reservationId) {
    _wsService.leaveChannel('reservation.$reservationId.chat');
  }
}
