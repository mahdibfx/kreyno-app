// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletHistory _$WalletHistoryFromJson(Map<String, dynamic> json) =>
    _WalletHistory(
      id: (json['id'] as num).toInt(),
      category: $enumDecode(_$WalletHistoryCategoryEnumMap, json['category']),
      amount: (json['amount'] as num).toDouble(),
      detail: json['detail'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$WalletHistoryToJson(_WalletHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': _$WalletHistoryCategoryEnumMap[instance.category]!,
      'amount': instance.amount,
      'detail': ?instance.detail,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$WalletHistoryCategoryEnumMap = {
  WalletHistoryCategory.earn: 1,
  WalletHistoryCategory.withdraw: 2,
};
