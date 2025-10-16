import 'package:stacked/stacked.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/smart/date_picker_field/birth_date_picker_field.form.dart';

class BirthDatePickerFieldModel extends FormViewModel {
  DateTime today = DateTime.now();

  Function(DateTime)? onDateChanged;

  static const int minimumDrivingAge = 18;

  int get selectedYear => int.tryParse(selectedYearValue ?? '') ?? 1990;
  int get selectedMonth => int.tryParse(selectedMonthValue ?? '') ?? 1;
  int get selectedDay => int.tryParse(selectedDayValue ?? '') ?? 1;

  List<int> get years {
    int currentYear = today.year;
    int minYear = currentYear - 100;
    int maxYear = currentYear - minimumDrivingAge;

    if (today.month == 1 && today.day == 1) {
      maxYear = currentYear - minimumDrivingAge - 1;
    }

    return List.generate(maxYear - minYear + 1, (index) => minYear + index);
  }

  List<int> get months {
    int currentYear = today.year;
    int maxValidYear = currentYear - minimumDrivingAge;

    if (selectedYear == maxValidYear) {
      return List.generate(today.month, (index) => index + 1);
    }

    return List.generate(12, (index) => index + 1);
  }

  List<int> get days {
    int currentYear = today.year;
    int maxValidYear = currentYear - minimumDrivingAge;
    int daysInMonth = DateTime(selectedYear, selectedMonth + 1, 0).day;

    if (selectedYear == maxValidYear && selectedMonth == today.month) {
      int maxDay = today.day;
      int validDays = maxDay > daysInMonth ? daysInMonth : maxDay;
      return List.generate(validDays, (index) => index + 1);
    }

    return List.generate(daysInMonth, (index) => index + 1);
  }

  DateTime get selectedDate {
    return DateTime(selectedYear, selectedMonth, selectedDay);
  }

  String getMonthName(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return CommonStrings.january;
      case 2:
        return CommonStrings.february;
      case 3:
        return CommonStrings.march;
      case 4:
        return CommonStrings.april;
      case 5:
        return CommonStrings.may;
      case 6:
        return CommonStrings.june;
      case 7:
        return CommonStrings.july;
      case 8:
        return CommonStrings.august;
      case 9:
        return CommonStrings.september;
      case 10:
        return CommonStrings.october;
      case 11:
        return CommonStrings.november;
      case 12:
        return CommonStrings.december;
      default:
        return monthNumber.toString();
    }
  }

  void setOnDateChanged(Function(DateTime) callback) {
    onDateChanged = callback;
  }

  initDefaultValues({DateTime? initialDate}) {
    // Use initialDate if provided, otherwise fall back to default (18 years ago)
    DateTime defaultBirthDate =
        initialDate ??
        DateTime(today.year - minimumDrivingAge, today.month, today.day);
    selectedYearValue = defaultBirthDate.year.toString();
    selectedMonthValue = defaultBirthDate.month.toString();
    selectedDayValue = defaultBirthDate.day.toString();
    rebuildUi();
    _notifyDateChanged(); // Notify parent of initial date
  }

  void setSelectedYear(int year) {
    selectedYearValue = year.toString();

    if (!months.contains(selectedMonth)) {
      selectedMonthValue = months.last.toString();
    }

    if (!days.contains(selectedDay)) {
      selectedDayValue = days.last.toString();
    }

    rebuildUi();
    _notifyDateChanged();
  }

  void setSelectedMonth(int month) {
    selectedMonthValue = month.toString();

    if (!days.contains(selectedDay)) {
      selectedDayValue = days.last.toString();
    }

    rebuildUi();
    _notifyDateChanged();
  }

  void setSelectedDay(int day) {
    selectedDayValue = day.toString();
    rebuildUi();
    _notifyDateChanged();
  }

  void _notifyDateChanged() {
    if (onDateChanged != null) {
      onDateChanged!(selectedDate);
    }
  }
}
