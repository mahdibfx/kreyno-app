import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/wallet_history_category.dart';

part 'wallet_history.freezed.dart';
part 'wallet_history.g.dart';

@freezed
abstract class WalletHistory with _$WalletHistory {
  const factory WalletHistory({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'category') required WalletHistoryCategory category,
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'detail') required String? detail,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _WalletHistory;

  factory WalletHistory.fromJson(Map<String, dynamic> json) =>
      _$WalletHistoryFromJson(json);
}
