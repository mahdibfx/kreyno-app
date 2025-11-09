// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Wallet _$WalletFromJson(Map<String, dynamic> json) => _Wallet(
  balance: (json['balance'] as num).toDouble(),
  currency: json['currency'] as String,
  bankAccountNumber: json['iban'] as String?,
  validatedAccount: json['validated_account'] as bool,
  transferCapability: json['transfer_capability'] as bool,
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$WalletToJson(_Wallet instance) => <String, dynamic>{
  'balance': instance.balance,
  'currency': instance.currency,
  'iban': ?instance.bankAccountNumber,
  'validated_account': instance.validatedAccount,
  'transfer_capability': instance.transferCapability,
  'updated_at': instance.updatedAt.toIso8601String(),
};
