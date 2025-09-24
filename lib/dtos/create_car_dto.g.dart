// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCarDtoImpl _$$CreateCarDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateCarDtoImpl(
      vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['car_type']),
      brand: json['brand'] as String,
      model: json['model'] as String,
      color: json['color'] as String,
      registrationNumber: json['registration_number'] as String,
      co2Emission: json['co2_emission'] as String,
      isSelected: json['is_selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreateCarDtoImplToJson(_$CreateCarDtoImpl instance) =>
    <String, dynamic>{
      'car_type': _$VehicleTypeEnumMap[instance.vehicleType]!,
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'registration_number': instance.registrationNumber,
      'co2_emission': instance.co2Emission,
      'is_selected': instance.isSelected,
    };

const _$VehicleTypeEnumMap = {
  VehicleType.gasoline: 1,
  VehicleType.electric: 2,
  VehicleType.scooter: 3,
};
