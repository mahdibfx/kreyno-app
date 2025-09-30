// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateCarDto _$UpdateCarDtoFromJson(Map<String, dynamic> json) =>
    _UpdateCarDto(
      vehicleType: $enumDecodeNullable(_$VehicleTypeEnumMap, json['car_type']),
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      color: json['color'] as String?,
      registrationNumber: json['registration_number'] as String?,
      co2Emission: json['co2_emission'] as String?,
      isSelected: json['is_selected'] as bool?,
    );

Map<String, dynamic> _$UpdateCarDtoToJson(_UpdateCarDto instance) =>
    <String, dynamic>{
      'car_type': ?_$VehicleTypeEnumMap[instance.vehicleType],
      'brand': ?instance.brand,
      'model': ?instance.model,
      'color': ?instance.color,
      'registration_number': ?instance.registrationNumber,
      'co2_emission': ?instance.co2Emission,
      'is_selected': ?instance.isSelected,
    };

const _$VehicleTypeEnumMap = {
  VehicleType.fuel: 1,
  VehicleType.electric: 2,
  VehicleType.motorcycle: 3,
};
