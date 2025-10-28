import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum WalletHistoryCategory {
  @JsonValue(1)
  earn,
  @JsonValue(2)
  withdraw,
}
