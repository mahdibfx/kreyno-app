import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/drop_down_field.dart';
import 'package:kreyno/ui/widgets/smart/date_picker_field/birth_date_picker_field.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'birth_date_picker_field_model.dart';

@FormView(
  fields: [
    FormTextField(name: 'selectedDay'),
    FormTextField(name: 'selectedMonth'),
    FormTextField(name: 'selectedYear'),
  ],
)
class BirthDatePickerField extends StackedView<BirthDatePickerFieldModel>
    with $BirthDatePickerField {
  final String labelText;
  final Function(DateTime) onBirthdayChanged;
  final DateTime? initialDate;

  const BirthDatePickerField({
    super.key,
    required this.labelText,
    required this.onBirthdayChanged,
    this.initialDate,
  });

  @override
  Widget builder(
    BuildContext context,
    BirthDatePickerFieldModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      top: false,
      child: Column(
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
      ),
    );
  }

  @override
  void onViewModelReady(BirthDatePickerFieldModel viewModel) {
    syncFormWithViewModel(viewModel);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.setOnDateChanged(onBirthdayChanged);
      viewModel.initDefaultValues(initialDate: initialDate);
    });
  }

  @override
  void onDispose(BirthDatePickerFieldModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  BirthDatePickerFieldModel viewModelBuilder(BuildContext context) =>
      BirthDatePickerFieldModel();
}
