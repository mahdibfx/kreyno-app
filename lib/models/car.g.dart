// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Car _$CarFromJson(Map<String, dynamic> json) => _Car(
  id: (json['id'] as num?)?.toInt() ?? 0,
  vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['car_type'] ?? 1),
  brand: json['brand'] as String,
  model: json['model'] as String,
  color: json['color'] as String,
  registrationNumber: json['registration_number'] as String,
  co2Emission: (json['co2_emission'] as num?)?.toDouble() ?? 0,
  isSelected: json['is_selected'] as bool? ?? false,
  image: _imageFromJson(json['image']),
);

Map<String, dynamic> _$CarToJson(_Car instance) => <String, dynamic>{
  'id': instance.id,
  'car_type': _$VehicleTypeEnumMap[instance.vehicleType]!,
  'brand': instance.brand,
  'model': instance.model,
  'color': instance.color,
  'registration_number': instance.registrationNumber,
  'co2_emission': instance.co2Emission,
  'is_selected': instance.isSelected,
  'image': ?_imageToJson(instance.image),
};

const _$VehicleTypeEnumMap = {
  VehicleType.fuel: 1,
  VehicleType.electric: 2,
  VehicleType.motorcycle: 3,
};

_Image _$ImageFromJson(Map<String, dynamic> json) =>
    _Image(id: (json['id'] as num).toInt(), url: json['url'] as String);

Map<String, dynamic> _$ImageToJson(_Image instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
};
