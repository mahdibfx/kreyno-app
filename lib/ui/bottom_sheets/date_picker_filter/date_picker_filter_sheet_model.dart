import 'package:easy_localization/easy_localization.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerFilterSheetModel extends BaseViewModel {
  String formattedStartDate = '';
  String formattedEndDate = '';

  changedRange(DateRangePickerSelectionChangedArgs dateRangeArgs) {
    formattedStartDate = DateFormat(
      "dd/MM/yy",
    ).format(dateRangeArgs.value.startDate);
    formattedEndDate = DateFormat(
      "dd/MM/yy",
    ).format(dateRangeArgs.value.endDate);
    notifyListeners();
  }
}
