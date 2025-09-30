import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/upload_media_response.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_media_service.g.dart';

@RestApi()
abstract class ApiMediaService {
  factory ApiMediaService(Dio dio) = _ApiMediaService;

  @POST(ApiEndpoints.store)
  @MultiPart()
  Future<ApiResponse<UploadMediaResponse>> uploadFile(
    @Part(name: 'file') File file,
  );

  @DELETE(ApiEndpoints.removeUpload)
  Future<ApiResponse<List<Object>>> removeUpload(@Path('uuid') String uuid);

  @DELETE(ApiEndpoints.deleteUpload)
  Future<ApiResponse<List<Object>>> deleteUpload(@Path('id') String id);
}
