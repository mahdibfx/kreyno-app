// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingPlaceImpl _$$ParkingPlaceImplFromJson(Map<String, dynamic> json) =>
    _$ParkingPlaceImpl(
      address: json['address'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      geohash: json['geohash'] as String,
      price: (json['price'] as num).toDouble(),
      totalPaidPrice: (json['total_paid_price'] as num).toDouble(),
      reserved: json['reserved'] as bool,
    );

Map<String, dynamic> _$$ParkingPlaceImplToJson(_$ParkingPlaceImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'geohash': instance.geohash,
      'price': instance.price,
      'total_paid_price': instance.totalPaidPrice,
      'reserved': instance.reserved,
    };
