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
  accountNumber: json['account_number'] as String,
  routingNumber: json['routing_number'] as String,
  accountHolderName: json['account_holder_name'] as String,
);

Map<String, dynamic> _$CreateStripeAccountDtoToJson(
  _CreateStripeAccountDto instance,
) => <String, dynamic>{
  'country': instance.country,
  'street': instance.street,
  'city': instance.city,
  'state': instance.state,
  'postal_code': instance.postalCode,
  'account_number': instance.accountNumber,
  'routing_number': instance.routingNumber,
  'account_holder_name': instance.accountHolderName,
};
