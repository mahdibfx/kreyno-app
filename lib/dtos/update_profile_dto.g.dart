// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileDto _$UpdateProfileDtoFromJson(Map<String, dynamic> json) =>
    _UpdateProfileDto(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UpdateProfileDtoToJson(_UpdateProfileDto instance) =>
    <String, dynamic>{
      'first_name': ?instance.firstName,
      'last_name': ?instance.lastName,
      'email': ?instance.email,
      'gender': ?_$GenderEnumMap[instance.gender],
      'birth_date': ?instance.birthDate?.toIso8601String(),
      'address': ?instance.address,
    };

const _$GenderEnumMap = {Gender.male: 1, Gender.female: 2};
