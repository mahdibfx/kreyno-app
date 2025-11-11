// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stripe_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateStripeAccountDto _$CreateStripeAccountDtoFromJson(
  Map<String, dynamic> json,
) => _CreateStripeAccountDto(
  country: json['country'] as String,
  street: json['street'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  postalCode: json['postal_code'] as String,
  iban: json['iban'] as String,
  accountHolderName: json['account_holder_name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$CreateStripeAccountDtoToJson(
  _CreateStripeAccountDto instance,
) => <String, dynamic>{
  'country': instance.country,
  'street': instance.street,
  'city': instance.city,
  'state': instance.state,
  'postal_code': instance.postalCode,
  'iban': instance.iban,
  'account_holder_name': instance.accountHolderName,
  'email': instance.email,
};
