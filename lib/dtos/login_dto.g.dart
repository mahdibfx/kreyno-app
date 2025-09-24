// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => _LoginDto(
  phone: json['phone'] as String,
  otp: json['otp'] as String,
  deviceId: json['device_id'] as String,
);

Map<String, dynamic> _$LoginDtoToJson(_LoginDto instance) => <String, dynamic>{
  'phone': instance.phone,
  'otp': instance.otp,
  'device_id': instance.deviceId,
};
