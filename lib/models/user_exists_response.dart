import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_exists_response.freezed.dart';
part 'user_exists_response.g.dart';

@freezed
abstract class UserExistsResponse with _$UserExistsResponse {
  const factory UserExistsResponse({
    @JsonKey(name: 'exists') required bool exists,
  }) = _UserExistsResponse;

  factory UserExistsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserExistsResponseFromJson(json);
}
