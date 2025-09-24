// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_exists_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserExistsDtoImpl _$$UserExistsDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserExistsDtoImpl(
      attribute: $enumDecode(_$UniqueExistenceIdEnumMap, json['attribute']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$UserExistsDtoImplToJson(_$UserExistsDtoImpl instance) =>
    <String, dynamic>{
      'attribute': _$UniqueExistenceIdEnumMap[instance.attribute]!,
      'value': instance.value,
    };

const _$UniqueExistenceIdEnumMap = {
  UniqueExistenceId.phone: 'phone',
  UniqueExistenceId.email: 'email',
  UniqueExistenceId.username: 'username',
};
