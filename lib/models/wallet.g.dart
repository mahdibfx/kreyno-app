// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Wallet _$WalletFromJson(Map<String, dynamic> json) => _Wallet(
  balance: (json['balance'] as num).toDouble(),
  currency: json['currency'] as String,
  bankAccountNumber: json['iban'] as String?,
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$WalletToJson(_Wallet instance) => <String, dynamic>{
  'balance': instance.balance,
  'currency': instance.currency,
  'iban': ?instance.bankAccountNumber,
  'updated_at': instance.updatedAt.toIso8601String(),
};
