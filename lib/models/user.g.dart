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
  selectedCar: json['selected_car'] == null
      ? null
      : SelectedCar.fromJson(json['selected_car'] as Map<String, dynamic>),
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
  'selected_car': ?instance.selectedCar?.toJson(),
  'avatar': ?avatarToJson(instance.avatar),
  'created_at': instance.createdAt.toIso8601String(),
};

const _$GenderEnumMap = {Gender.male: 1, Gender.female: 2};

_SelectedCar _$SelectedCarFromJson(Map<String, dynamic> json) => _SelectedCar(
  brand: json['brand'] as String,
  model: json['model'] as String,
  color: json['color'] as String,
  registrationNumber: json['registration_number'] as String,
  image: json['image'] == null
      ? null
      : Image.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SelectedCarToJson(_SelectedCar instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'registration_number': instance.registrationNumber,
      'image': ?instance.image?.toJson(),
    };
