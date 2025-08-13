// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_exists_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserExistsDto _$UserExistsDtoFromJson(Map<String, dynamic> json) =>
    _UserExistsDto(
      attribute: $enumDecode(_$UniqueExistenceIdEnumMap, json['attribute']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$UserExistsDtoToJson(_UserExistsDto instance) =>
    <String, dynamic>{
      'attribute': _$UniqueExistenceIdEnumMap[instance.attribute]!,
      'value': instance.value,
    };

const _$UniqueExistenceIdEnumMap = {
  UniqueExistenceId.phone: 'phone',
  UniqueExistenceId.email: 'email',
  UniqueExistenceId.username: 'username',
};
