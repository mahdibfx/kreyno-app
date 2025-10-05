import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
abstract class Card with _$Card {
  const factory Card({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "brand") required String brand,
    @JsonKey(name: "last_four") required String last4,
    @JsonKey(name: "exp_month") required int expMonth,
    @JsonKey(name: "exp_year") required int expYear,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
