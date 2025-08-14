import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_stripe_account_dto.freezed.dart';
part 'create_stripe_account_dto.g.dart';

@freezed
abstract class CreateStripeAccountDto with _$CreateStripeAccountDto {
  const factory CreateStripeAccountDto({
    @JsonKey(name: "country") required String country,
    @JsonKey(name: "street") required String street,
    @JsonKey(name: "city") required String city,
    @JsonKey(name: "state") required String state,
    @JsonKey(name: "postal_code") required String postalCode,
    @JsonKey(name: "account_number") required String accountNumber,
    @JsonKey(name: "routing_number") required String routingNumber,
    @JsonKey(name: "account_holder_name") required String accountHolderName,
  }) = _CreateStripeAccountDto;

  factory CreateStripeAccountDto.fromJson(Map<String, dynamic> json) =>
      _$CreateStripeAccountDtoFromJson(json);
}
