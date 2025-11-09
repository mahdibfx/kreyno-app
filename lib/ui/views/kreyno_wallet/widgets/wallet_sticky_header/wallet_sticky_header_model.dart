import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/wallet.dart';
import 'package:kreyno/services/stripe_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/url_launcher_service.dart';
import 'package:kreyno/services/wallet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WalletStickyHeaderModel extends BaseViewModel {
  final _logger = getLogger('WalletStickyHeaderModel');
  final _walletService = locator<WalletService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _stripeService = locator<StripeService>();
  final _toastService = locator<ToastService>();
  final _urlLauncherService = locator<UrlLauncherService>();

  final Function(bool success) onPayoutSuccess;
  WalletStickyHeaderModel({required this.onPayoutSuccess});

  Wallet? _wallet;
  Wallet? get wallet => _wallet;

  bool get hasBankAccount => _wallet?.bankAccountNumber != null;
  bool get isBankAccountVerified => _wallet?.validatedAccount ?? false;
  bool get isBankAccountTransferCapable => _wallet?.transferCapability ?? false;

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

  bool _verifyingBankAccount = false;
  bool get verifyingBankAccount => _verifyingBankAccount;

  void setVerifyingBankAccount(bool value) {
    _verifyingBankAccount = value;
    rebuildUi();
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

  void onVerifyBankAccountTapped() async {
    setVerifyingBankAccount(true);
    try {
      final response = await _stripeService.getStripeConnectOnboardingLink();
      await response.match(
        (error) async {
          _logger.e('Failed to get stripe connect onboarding link: $error');
          _toastService.showError(title: error);
        },
        (data) async {
          _logger.i('Stripe connect onboarding link: ${data.url}');
          final launchResult = await _urlLauncherService.launchUrl(data.url);
          await launchResult.match(
            (error) async {
              _logger.e('Failed to launch onboarding link: $error');
              _toastService.showError(title: error);
            },
            (_) async {
              _logger.i('Successfully launched onboarding link');
              // TODO: update state after the onboarding is completed based on what the designer provides
            },
          );
        },
      );
    } finally {
      setVerifyingBankAccount(false);
    }
  }

  void onAddBankAccountTapped() async {
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
