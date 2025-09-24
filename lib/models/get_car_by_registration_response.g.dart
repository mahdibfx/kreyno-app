// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_car_by_registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetCarByRegistrationResponse _$GetCarByRegistrationResponseFromJson(
  Map<String, dynamic> json,
) => _GetCarByRegistrationResponse(
  brand: json['brand'] as String,
  model: json['model'] as String,
  color: json['color'] as String,
  registrationNumber: json['registration_number'] as String,
  co2Emission: json['co2_emission'] as String,
);

Map<String, dynamic> _$GetCarByRegistrationResponseToJson(
  _GetCarByRegistrationResponse instance,
) => <String, dynamic>{
  'brand': instance.brand,
  'model': instance.model,
  'color': instance.color,
  'registration_number': instance.registrationNumber,
  'co2_emission': instance.co2Emission,
};
