import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyParkingSpotsViewModel extends IndexTrackingViewModel {
  final _logger = getLogger('MyParkingSpotsViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  DateTime? _from;
  DateTime? _to;

  DateTime? get from => _from;
  DateTime? get to => _to;

  bool get hasFilter => _from != null || _to != null;

  void goBack() {
    _navigationService.back();
  }

  void showFilterSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.datePickerFilter,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
      data: [_from, _to],
    );

    if (response != null && response.confirmed == true) {
      // TODO Handle filter
      _from = response.data[0] as DateTime?;
      _to = response.data[1] as DateTime?;
      rebuildUi();
    }
  }
}
