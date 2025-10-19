// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) => _RegisterDto(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  userName: json['username'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  birthDate: _birthDateFromJson(json['birth_date'] as String),
  otp: json['otp'] as String,
  deviceId: json['device_id'] as String,
);

Map<String, dynamic> _$RegisterDtoToJson(_RegisterDto instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.userName,
      'phone': instance.phone,
      'email': instance.email,
      'gender': _$GenderEnumMap[instance.gender]!,
      'birth_date': _birthDateToJson(instance.birthDate),
      'otp': instance.otp,
      'device_id': instance.deviceId,
    };

const _$GenderEnumMap = {Gender.male: 1, Gender.female: 2};
