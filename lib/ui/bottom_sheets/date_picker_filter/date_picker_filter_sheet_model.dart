import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerFilterSheetModel extends BaseViewModel {
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  DateTime? get selectedStartDate => _selectedStartDate;
  DateTime? get selectedEndDate => _selectedEndDate;

  bool get isFilterApplied =>
      selectedStartDate != null || selectedEndDate != null;

  void initializeFilter(DateTime? initialStartDate, DateTime? initialEndDate) {
    _selectedStartDate = initialStartDate;
    _selectedEndDate = initialEndDate;
    rebuildUi();
  }

  void setSelectedRange(DateRangePickerSelectionChangedArgs dateRangeArgs) {
    if (dateRangeArgs.value.startDate == dateRangeArgs.value.endDate) {
      _selectedStartDate = dateRangeArgs.value.startDate;
    } else {
      _selectedStartDate = dateRangeArgs.value.startDate;
      _selectedEndDate = dateRangeArgs.value.endDate;
    }
    rebuildUi();
  }

  void resetFilter() {
    _selectedStartDate = null;
    _selectedEndDate = null;
    rebuildUi();
  }
}
