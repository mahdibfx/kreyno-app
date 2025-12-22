// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingSpot _$ParkingSpotFromJson(Map<String, dynamic> json) => _ParkingSpot(
  id: (json['id'] as num).toInt(),
  address: json['address'] as String,
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
  geoHash: json['geohash'] as String,
  price: (json['price'] as num).toDouble(),
  totalPaidPrice: (json['total_paid_price'] as num).toDouble(),
  electricChargeStation: json['electric_charge_station'] as bool,
  reserved: json['reserved'] as bool,
  seller: json['seller'] == null
      ? null
      : Seller.fromJson(json['seller'] as Map<String, dynamic>),
  validatedAt: json['validated_at'] == null
      ? null
      : DateTime.parse(json['validated_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ParkingSpotToJson(_ParkingSpot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'geohash': instance.geoHash,
      'price': instance.price,
      'total_paid_price': instance.totalPaidPrice,
      'electric_charge_station': instance.electricChargeStation,
      'reserved': instance.reserved,
      'seller': ?instance.seller?.toJson(),
      'validated_at': ?instance.validatedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

_Seller _$SellerFromJson(Map<String, dynamic> json) => _Seller(
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  car: json['car'] == null
      ? null
      : Car.fromJson(json['car'] as Map<String, dynamic>),
  avatar: avatarFromJson(json['avatar']),
);

Map<String, dynamic> _$SellerToJson(_Seller instance) => <String, dynamic>{
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'car': ?instance.car?.toJson(),
  'avatar': ?avatarToJson(instance.avatar),
};
