import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/chat_message.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_chat_service.g.dart';

@RestApi()
abstract class ApiChatService {
  factory ApiChatService(Dio dio) = _ApiChatService;

  @POST(ApiEndpoints.reservationChatsSend)
  Future<ApiResponse<ChatMessage>> sendMessage(
    @Path('id') int id,
    @Body() Map<String, String> body,
  );

  @GET(ApiEndpoints.reservationChatsHistory)
  Future<ApiResponse<List<ChatMessage>>> getChatHistory(@Path('id') int id);
}
