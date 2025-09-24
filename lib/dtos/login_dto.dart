import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
abstract class LoginDto with _$LoginDto {
  const factory LoginDto({
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'otp') required String otp,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _LoginDto;

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}
