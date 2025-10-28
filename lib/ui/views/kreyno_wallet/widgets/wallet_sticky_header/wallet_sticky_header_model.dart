import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/wallet.dart';
import 'package:kreyno/services/wallet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WalletStickyHeaderModel extends BaseViewModel {
  final _logger = getLogger('WalletStickyHeaderModel');
  final _walletService = locator<WalletService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final Function(bool success) onPayoutSuccess;
  WalletStickyHeaderModel({required this.onPayoutSuccess});

  Wallet? _wallet;
  Wallet? get wallet => _wallet;

  bool get hasBankAccount => _wallet?.bankAccountNumber != null;

  double get balance => _wallet?.balance ?? 0.0;

  String get currency => _wallet?.currency ?? '€';

  String? get partiallyVisibleBankAccountNumber {
    final bankAccount = _wallet?.bankAccountNumber;
    if (bankAccount == null) return null;

    // Format: **** **** **** **** **** ***0 9437
    if (bankAccount.length >= 4) {
      final lastFour = bankAccount.substring(bankAccount.length - 4);
      return '**** **** **** **** **** ***$lastFour';
    }
    return bankAccount;
  }

  Future<void> fetchWallet() async {
    setError(null);
    setBusy(true);
    try {
      final response = await _walletService.getWallet();
      await response.match(
        (error) async {
          setError(error);
          _logger.e('Failed to fetch wallet: $error');
        },
        (wallet) async {
          _wallet = wallet;
          rebuildUi();
        },
      );
    } finally {
      setBusy(false);
    }
  }

  void onAddBankAccountTapped() async {
    // TODO : make sure AddBankAccountView returns a Wallet object in case the bank account creation is successful
    final Wallet? updatedWallet = await _navigationService
        .navigateToAddBankAccountView();
    if (updatedWallet != null) {
      _wallet = updatedWallet;
      rebuildUi();
    }
  }

  void onRemoveBankAccountTapped() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.deleteBankAccountConfirmation,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );
    if (response != null && response.confirmed == true) {
      // TODO Handle delete bank account
    }
  }

  void onPayoutTapped() async {
    // TODO : make sure PayoutView returns a boolean in case the payout is successful
    final bool? success = await _navigationService.navigateToPayoutView();
    if (success != null) {
      onPayoutSuccess(success);
    }
  }
}
