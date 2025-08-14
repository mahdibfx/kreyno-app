import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_dto.freezed.dart';
part 'send_otp_dto.g.dart';

@freezed
abstract class SendOtpDto with _$SendOtpDto {
  const factory SendOtpDto({
    @JsonKey(name: 'phone') required String phoneNumber,
  }) = _SendOtpDto;

  factory SendOtpDto.fromJson(Map<String, dynamic> json) =>
      _$SendOtpDtoFromJson(json);
}
