import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/gender.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
abstract class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'username') required String userName,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'gender') required Gender gender,
    @JsonKey(
      name: 'birth_date',
      toJson: _birthDateToJson,
      fromJson: _birthDateFromJson,
    )
    required DateTime birthDate,
    // @JsonKey(name: 'address', includeIfNull: false) String? address,
    @JsonKey(name: 'otp') required String otp,
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);
}

String _birthDateToJson(DateTime date) {
  return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

DateTime _birthDateFromJson(String dateStr) {
  return DateTime.parse(dateStr);
}
