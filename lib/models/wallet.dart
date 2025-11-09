import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    @JsonKey(name: 'balance') required double balance,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'iban') required String? bankAccountNumber,
    @JsonKey(name: 'validated_account') required bool validatedAccount,
    @JsonKey(name: 'transfer_capability') required bool transferCapability,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}
