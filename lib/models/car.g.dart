// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarImpl _$$CarImplFromJson(Map<String, dynamic> json) => _$CarImpl(
      vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['car_type']),
      brand: json['brand'] as String,
      model: json['model'] as String,
      color: json['color'] as String,
      registrationNumber: json['registration_number'] as String,
      co2Emission: json['co2_emission'] as String,
      isSelected: json['is_selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
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
