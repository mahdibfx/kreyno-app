// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingPlace _$ParkingPlaceFromJson(Map<String, dynamic> json) =>
    _ParkingPlace(
      id: json['id'] as String,
      address: json['address'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      geohash: json['geohash'] as String,
      price: (json['price'] as num).toDouble(),
      totalPaidPrice: (json['total_paid_price'] as num).toDouble(),
      electricChargeStation: json['electric_charge_station'] as bool,
      reserved: json['reserved'] as bool,
      seller: Seller.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParkingPlaceToJson(_ParkingPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'geohash': instance.geohash,
      'price': instance.price,
      'total_paid_price': instance.totalPaidPrice,
      'electric_charge_station': instance.electricChargeStation,
      'reserved': instance.reserved,
      'seller': instance.seller.toJson(),
    };

_Seller _$SellerFromJson(Map<String, dynamic> json) => _Seller(
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SellerToJson(_Seller instance) => <String, dynamic>{
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'avatar': instance.avatar.toJson(),
};

_Avatar _$AvatarFromJson(Map<String, dynamic> json) =>
    _Avatar(id: json['id'] as String, url: json['url'] as String);

Map<String, dynamic> _$AvatarToJson(_Avatar instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
};
