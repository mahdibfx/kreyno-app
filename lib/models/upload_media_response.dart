import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_media_response.freezed.dart';
part 'upload_media_response.g.dart';

@freezed
abstract class UploadMediaResponse with _$UploadMediaResponse {
  const factory UploadMediaResponse({
    @JsonKey(name: 'uuid') required String uuid,
  }) = _UploadMediaResponse;

  factory UploadMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadMediaResponseFromJson(json);
}
