// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateProfileDtoImpl _$$UpdateProfileDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProfileDtoImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$UpdateProfileDtoImplToJson(
        _$UpdateProfileDtoImpl instance) =>
    <String, dynamic>{
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.email case final value?) 'email': value,
      if (_$GenderEnumMap[instance.gender] case final value?) 'gender': value,
      if (instance.birthDate?.toIso8601String() case final value?)
        'birth_date': value,
      if (instance.address case final value?) 'address': value,
    };

const _$GenderEnumMap = {
  Gender.male: 1,
  Gender.female: 2,
};
