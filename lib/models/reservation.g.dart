// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reservation _$ReservationFromJson(Map<String, dynamic> json) => _Reservation(
  id: (json['id'] as num).toInt(),
  buyer: Buyer.fromJson(json['buyer'] as Map<String, dynamic>),
  parkingSpot: ParkingPlace.fromJson(
    json['parking_place'] as Map<String, dynamic>,
  ),
  status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
  observation: json['observation'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ReservationToJson(_Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyer': instance.buyer.toJson(),
      'parking_place': instance.parkingSpot.toJson(),
      'status': _$ReservationStatusEnumMap[instance.status]!,
      'observation': instance.observation,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 1,
  ReservationStatus.confirmed: 2,
  ReservationStatus.finished: 3,
  ReservationStatus.canceled: 4,
};

_Buyer _$BuyerFromJson(Map<String, dynamic> json) => _Buyer(
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  avatar: avatarFromJson(json['avatar']),
);

Map<String, dynamic> _$BuyerToJson(_Buyer instance) => <String, dynamic>{
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'avatar': ?avatarToJson(instance.avatar),
};

_ParkingPlace _$ParkingPlaceFromJson(Map<String, dynamic> json) =>
    _ParkingPlace(
      address: json['address'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      geoHash: json['geohash'] as String,
      price: (json['price'] as num).toDouble(),
      totalPaidPrice: (json['total_paid_price'] as num).toDouble(),
      electricChargeStation: json['electric_charge_station'] as bool,
      reserved: json['reserved'] as bool,
    );

Map<String, dynamic> _$ParkingPlaceToJson(_ParkingPlace instance) =>
    <String, dynamic>{
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'geohash': instance.geoHash,
      'price': instance.price,
      'total_paid_price': instance.totalPaidPrice,
      'electric_charge_station': instance.electricChargeStation,
      'reserved': instance.reserved,
    };
