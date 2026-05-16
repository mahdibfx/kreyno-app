import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'date_picker_filter_sheet_model.dart';

// TODO: this still needs some work, we need to improve the UI and the logic.
class DatePickerFilterSheet extends StackedView<DatePickerFilterSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DatePickerFilterSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DatePickerFilterSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      showDragHandler: false,
      padding: EdgeInsets.all(AppSpacing.px16),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.largeTitle(DatePickerFilterSheetStrings.title),
              RoundedButton(
                iconPath: AppIcons.multiplicationSign,
                onPressed: () =>
                    completer?.call(SheetResponse(confirmed: false)),
              ),
            ],
          ),
          VGap(AppSpacing.px20),
          SfDateRangePicker(
            monthViewSettings: DateRangePickerMonthViewSettings(
              showTrailingAndLeadingDates: false,
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: AppTypography.smallParagraphBold.copyWith(
                  color: AppColors.textKre,
                ),
                backgroundColor: AppColors.white,
              ),
            ),
            headerHeight: 56 * AppSpacing.px1,
            headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: AppTypography.paragraph.copyWith(
                color: AppColors.mainKre,
              ),
              backgroundColor: AppColors.white,
            ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: AppTypography.smallParagraphBold.copyWith(
                color: AppColors.mainKre,
              ),
              todayTextStyle: AppTypography.smallParagraphBold.copyWith(
                color: AppColors.mainKre,
              ),
            ),
            selectionTextStyle: AppTypography.smallParagraphBold.copyWith(
              color: AppColors.mainKre,
            ),
            selectionShape: DateRangePickerSelectionShape.rectangle,
            selectionRadius: AppSpacing.px12,
            allowViewNavigation: false,
            showTodayButton: false,
            todayHighlightColor: AppColors.greenKre,
            onSelectionChanged: viewModel.setSelectedRange,
            rangeSelectionColor: AppColors.greenKre,
            selectionColor: AppColors.greenKre,
            startRangeSelectionColor: AppColors.greenKre,
            endRangeSelectionColor: AppColors.greenKre,
            selectionMode: DateRangePickerSelectionMode.range,
            backgroundColor: AppColors.white,
            rangeTextStyle: AppTypography.smallParagraphBold.copyWith(
              color: AppColors.mainKre,
            ),
          ),
          const CustomDivider(),
          VGap(AppSpacing.px16),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.px1 * 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: const Border.fromBorderSide(
                      BorderSide(color: AppColors.strokeKre),
                    ),
                  ),
                  child: viewModel.selectedStartDate != null
                      ? CustomText.smallParagraphBold(
                          DateFormat(
                            "dd/MM/yy",
                          ).format(viewModel.selectedStartDate!),
                        )
                      : CustomText.smallParagraphBold(
                          DatePickerFilterSheetStrings.startDate,
                          color: AppColors.textKre,
                        ),
                ),
              ),
              HGap(AppSpacing.px8),
              const CustomText.smallParagraphBold("-"),
              HGap(AppSpacing.px8),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.px1 * 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: const Border.fromBorderSide(
                      BorderSide(color: AppColors.strokeKre),
                    ),
                  ),
                  child: viewModel.selectedEndDate != null
                      ? CustomText.smallParagraphBold(
                          DateFormat(
                            "dd/MM/yy",
                          ).format(viewModel.selectedEndDate!),
                        )
                      : CustomText.smallParagraphBold(
                          DatePickerFilterSheetStrings.endDate,
                          color: AppColors.textKre,
                        ),
                ),
              ),
            ],
          ),
          VGap(AppSpacing.px24),
          Row(
            children: [
              CustomButton.plain(
                text: DatePickerFilterSheetStrings.reset,

                foregroundColor: AppColors.redKre,
                isDisabled: !viewModel.isFilterApplied,
                onPressed: viewModel.resetFilter,
              ),
              Expanded(
                child: SafeArea(
                  top: false,
                  child: CustomButton.filled(
                    text: DatePickerFilterSheetStrings.apply,
                    onPressed: () => completer?.call(
                      SheetResponse(
                        confirmed: true,
                        data: [
                          viewModel.selectedStartDate,
                          viewModel.selectedEndDate,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(DatePickerFilterSheetModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.initializeFilter(
      request.data[0] as DateTime?,
      request.data[1] as DateTime?,
    );
  }

  @override
  DatePickerFilterSheetModel viewModelBuilder(BuildContext context) =>
      DatePickerFilterSheetModel();
}
