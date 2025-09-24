import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_on_payment_card_dto.freezed.dart';
part 'action_on_payment_card_dto.g.dart';

@freezed
abstract class ActionOnPaymentCardDto with _$ActionOnPaymentCardDto {
  const factory ActionOnPaymentCardDto({
    @JsonKey(name: "payment_method") required String paymentMethodId,
  }) = _ActionOnPaymentCardDto;

  factory ActionOnPaymentCardDto.fromJson(Map<String, dynamic> json) =>
      _$ActionOnPaymentCardDtoFromJson(json);
}
