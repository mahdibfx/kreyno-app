// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Card _$CardFromJson(Map<String, dynamic> json) => _Card(
  id: json['id'] as String,
  brand: json['brand'] as String,
  last4: json['last_four'] as String,
  expMonth: (json['exp_month'] as num).toInt(),
  expYear: (json['exp_year'] as num).toInt(),
  isDefault: json['is_default'] as bool? ?? false,
);

Map<String, dynamic> _$CardToJson(_Card instance) => <String, dynamic>{
  'id': instance.id,
  'brand': instance.brand,
  'last_four': instance.last4,
  'exp_month': instance.expMonth,
  'exp_year': instance.expYear,
  'is_default': instance.isDefault,
};
