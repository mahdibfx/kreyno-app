// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_car_by_registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCarByRegistrationResponseImpl _$$GetCarByRegistrationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCarByRegistrationResponseImpl(
      brand: json['brand'] as String,
      model: json['model'] as String,
      color: json['color'] as String,
      registrationNumber: json['registration_number'] as String,
      co2Emission: json['co2_emission'] as String,
    );

Map<String, dynamic> _$$GetCarByRegistrationResponseImplToJson(
        _$GetCarByRegistrationResponseImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'registration_number': instance.registrationNumber,
      'co2_emission': instance.co2Emission,
    };
