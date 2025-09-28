// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateCarDtoImpl _$$UpdateCarDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateCarDtoImpl(
      vehicleType: $enumDecodeNullable(_$VehicleTypeEnumMap, json['car_type']),
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      color: json['color'] as String?,
      registrationNumber: json['registration_number'] as String?,
      co2Emission: json['co2_emission'] as String?,
      isSelected: json['is_selected'] as bool?,
    );

Map<String, dynamic> _$$UpdateCarDtoImplToJson(_$UpdateCarDtoImpl instance) =>
    <String, dynamic>{
      if (_$VehicleTypeEnumMap[instance.vehicleType] case final value?)
        'car_type': value,
      if (instance.brand case final value?) 'brand': value,
      if (instance.model case final value?) 'model': value,
      if (instance.color case final value?) 'color': value,
      if (instance.registrationNumber case final value?)
        'registration_number': value,
      if (instance.co2Emission case final value?) 'co2_emission': value,
      if (instance.isSelected case final value?) 'is_selected': value,
    };

const _$VehicleTypeEnumMap = {
  VehicleType.gasoline: 1,
  VehicleType.electric: 2,
  VehicleType.scooter: 3,
};
