import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/chat_message.dart';
import 'package:kreyno/services/api/api_chat_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class ChatService with ListenableServiceMixin {
  final _apiChatService = ApiChatService(locator<DioService>().dio);
  final _wsService = SocketService();
  final _logger = Logger();
  ChatMessage? _message;

  ChatMessage? get message => _message;

  ChatService() {
    listenToReactiveValues([_message]);
  }

  Future<Either<String, ChatMessage>> sendMessage(
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

  Future<void> listenToMessageReceiver(int reservationId) async {
    await _wsService.subscribePrivate(
      channel: 'reservation.$reservationId.chat',
      event: 'chat-message',
      onEvent: (data) {
        try {
          // Parse the incoming chat message and notify listeners.
          _message = ChatMessage.fromJson(
            Map<String, dynamic>.from(data as Map),
          );
          notifyListeners();
        } catch (e, stackTrace) {
          // Swallow parse errors so a single malformed payload doesn't tear
          // down the channel listener.
          _logger.e("Error parsing chat message: $e");
          _logger.e(stackTrace.toString());
        }
      },
    );
  }

  dispose(int reservationId) {
    _wsService.leaveChannel('reservation.$reservationId.chat');
  }
}
