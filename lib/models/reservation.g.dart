// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      id: json['id'] as String,
      buyer: Buyer.fromJson(json['buyer'] as Map<String, dynamic>),
      parkingPlace:
          ParkingPlace.fromJson(json['parking_place'] as Map<String, dynamic>),
      status: json['status'] as String?,
      observation: json['observation'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyer': instance.buyer.toJson(),
      'parking_place': instance.parkingPlace.toJson(),
      if (instance.status case final value?) 'status': value,
      if (instance.observation case final value?) 'observation': value,
      'created_at': instance.createdAt.toIso8601String(),
    };

_$BuyerImpl _$$BuyerImplFromJson(Map<String, dynamic> json) => _$BuyerImpl(
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BuyerImplToJson(_$BuyerImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'avatar': instance.avatar.toJson(),
    };

_$AvatarImpl _$$AvatarImplFromJson(Map<String, dynamic> json) => _$AvatarImpl(
      id: json['id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$AvatarImplToJson(_$AvatarImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
