// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reservation _$ReservationFromJson(Map<String, dynamic> json) => _Reservation(
  id: json['id'] as String,
  buyer: Buyer.fromJson(json['buyer'] as Map<String, dynamic>),
  parkingPlace: ParkingPlace.fromJson(
    json['parking_place'] as Map<String, dynamic>,
  ),
  status: json['status'] as String?,
  observation: json['observation'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ReservationToJson(_Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyer': instance.buyer.toJson(),
      'parking_place': instance.parkingPlace.toJson(),
      'status': ?instance.status,
      'observation': ?instance.observation,
      'created_at': instance.createdAt.toIso8601String(),
    };

_Buyer _$BuyerFromJson(Map<String, dynamic> json) => _Buyer(
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BuyerToJson(_Buyer instance) => <String, dynamic>{
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
