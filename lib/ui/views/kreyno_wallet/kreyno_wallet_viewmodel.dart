import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/wallet_history.dart';
import 'package:kreyno/services/wallet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class KreynoWalletViewModel extends BaseViewModel {
  final _logger = getLogger('KreynoWalletViewModel');
  final _navigationService = locator<NavigationService>();
  final _walletService = locator<WalletService>();
  final _bottomSheetService = locator<BottomSheetService>();

  DateTime? _from;
  DateTime? _to;

  DateTime? get from => _from;
  DateTime? get to => _to;

  bool get hasFilter => _from != null || _to != null;

  Map<String, List<WalletHistory>> _transactionsByMonth = {};
  Map<String, List<WalletHistory>> get transactionsByMonth =>
      _transactionsByMonth;

  List<String> get sortedMonthKeys => _transactionsByMonth.keys.toList();

  bool get hasTransactions => _transactionsByMonth.isNotEmpty;

  void goBack() {
    _navigationService.back();
  }

  Future<void> fetchTransactions() async {
    setError(null);
    setBusy(true);
    try {
      final response = await _walletService.getWalletHistory(
        from: _from,
        to: _to,
      );
      await response.match(
        (error) async {
          setError(error);
          _logger.e('Failed to fetch transactions: $error');
        },
        (transactionData) async {
          _transactionsByMonth = transactionData.transactionsByMonth;
          rebuildUi();
        },
      );
    } finally {
      setBusy(false);
    }
  }

  List<WalletHistory> getTransactionsForMonth(String monthKey) {
    return _transactionsByMonth[monthKey] ?? [];
  }

  void showFilterSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.datePickerFilter,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
      data: [_from, _to],
    );

    if (response != null && response.confirmed == true) {
      _from = response.data[0] as DateTime?;
      _to = response.data[1] as DateTime?;
      rebuildUi();
      fetchTransactions();
    }
  }
}
