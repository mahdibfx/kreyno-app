import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/drop_down_field.dart';
import 'package:stacked/stacked.dart';

import 'birth_date_picker_field_model.dart';

class BirthDatePickerField extends StackedView<BirthDatePickerFieldModel> {
  final String labelText;
  final Function(DateTime) onBirthdayChanged;

  const BirthDatePickerField({
    super.key,
    required this.labelText,
    required this.onBirthdayChanged,
  });

  @override
  Widget builder(
    BuildContext context,
    BirthDatePickerFieldModel viewModel,
    Widget? child,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.px12 / 2,
      children: [
        CustomText.smallParagraphMedium(labelText, color: AppColors.textKre),
        Row(
          spacing: AppSpacing.px8,
          children: [
            Expanded(
              child: DropDownField<int>(
                value: viewModel.selectedDay,
                menuWidth: 30.dw,
                items: viewModel.days.map((int day) {
                  return DropdownMenuEntry<int>(
                    value: day,
                    label: day.toString(),
                    labelWidget: CustomText.smallParagraphMedium(
                      day.toString(),
                      color: AppColors.mainKre,
                    ),
                  );
                }).toList(),
                onChanged: (value) => viewModel.setSelectedDay(value!),
              ),
            ),
            Expanded(
              child: DropDownField<int>(
                value: viewModel.selectedMonth,
                menuWidth: 50.dw,
                items: viewModel.months.map((int month) {
                  return DropdownMenuEntry<int>(
                    value: month,
                    label: viewModel.getMonthName(month),
                    labelWidget: CustomText.smallParagraphMedium(
                      viewModel.getMonthName(month),
                      color: AppColors.mainKre,
                    ),
                  );
                }).toList(),
                onChanged: (value) => viewModel.setSelectedMonth(value!),
              ),
            ),
            Expanded(
              child: DropDownField<int>(
                value: viewModel.selectedYear,
                menuWidth: 30.dw,
                items: viewModel.years.map((int year) {
                  return DropdownMenuEntry<int>(
                    value: year,
                    label: year.toString(),
                    labelWidget: CustomText.smallParagraphMedium(
                      year.toString(),
                      color: AppColors.mainKre,
                    ),
                  );
                }).toList(),
                onChanged: (value) => viewModel.setSelectedYear(value!),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void onViewModelReady(BirthDatePickerFieldModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.setOnDateChanged(onBirthdayChanged);
      viewModel.initDefaultValues();
    });
  }

  @override
  BirthDatePickerFieldModel viewModelBuilder(BuildContext context) =>
      BirthDatePickerFieldModel();
}
