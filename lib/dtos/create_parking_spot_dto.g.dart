// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_parking_spot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateParkingSpotDto _$CreateParkingSpotDtoFromJson(
  Map<String, dynamic> json,
) => _CreateParkingSpotDto(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  address: json['address'] as String,
  price: (json['price'] as num).toDouble(),
  electricChargeStation: json['electric_charge_station'] as bool,
);

Map<String, dynamic> _$CreateParkingSpotDtoToJson(
  _CreateParkingSpotDto instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'address': instance.address,
  'price': instance.price,
  'electric_charge_station': instance.electricChargeStation,
};
