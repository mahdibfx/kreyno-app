// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  address: json['address'] as String?,
  birthDate: DateTime.parse(json['birth_date'] as String),
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  hasVehicle: json['has_car'] as bool,
  isSelling: json['has_open_parking_place'] as bool,
  isBuying: json['has_open_reservation'] as bool,
  avatar: avatarFromJson(json['avatar']),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'email': instance.email,
  'address': ?instance.address,
  'birth_date': instance.birthDate.toIso8601String(),
  'gender': _$GenderEnumMap[instance.gender]!,
  'has_car': instance.hasVehicle,
  'has_open_parking_place': instance.isSelling,
  'has_open_reservation': instance.isBuying,
  'avatar': ?avatarToJson(instance.avatar),
  'created_at': instance.createdAt.toIso8601String(),
};

const _$GenderEnumMap = {Gender.male: 1, Gender.female: 2};
