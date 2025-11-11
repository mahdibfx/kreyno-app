import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_phone_number_dto.freezed.dart';
part 'change_phone_number_dto.g.dart';

@freezed
abstract class ChangePhoneNumberDto with _$ChangePhoneNumberDto {
  const factory ChangePhoneNumberDto({
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'otp') required String otp,
  }) = _ChangePhoneNumberDto;

  factory ChangePhoneNumberDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePhoneNumberDtoFromJson(json);
}
