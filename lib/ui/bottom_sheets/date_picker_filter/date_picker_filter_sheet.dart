import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
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
        padding: EdgeInsets.all(AppSpacing.px24),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText.largeTitle("Filtre par date"),
                RoundedButton(
                    iconPath: AppIcons.multiplicationSign,
                    onPressed: () {
                      locator<NavigationService>().back();
                    })
              ],
            ),
            VGap(AppSpacing.px20),
            SfDateRangePicker(
              monthCellStyle: const DateRangePickerMonthCellStyle(
                textStyle: TextStyle(
                    fontFamily: "Satoshi", fontWeight: FontWeight.bold),
              ),
              selectionTextStyle: const TextStyle(
                  fontFamily: "Satoshi", fontWeight: FontWeight.bold),
              allowViewNavigation: false,
              showNavigationArrow: true,
              showTodayButton: false,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs
                  dateRangePickerSelectionChangedArgs) {
                viewModel.changedRange(dateRangePickerSelectionChangedArgs);
              },
              headerHeight: 60,
              headerStyle: const DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      fontFamily: "Satoshi", fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white),
              rangeSelectionColor: AppColors.greenKre,
              selectionColor: AppColors.greenKre,
              startRangeSelectionColor: AppColors.greenKre,
              endRangeSelectionColor: AppColors.greenKre,
              selectionMode: DateRangePickerSelectionMode.range,
              backgroundColor: AppColors.white,
              rangeTextStyle: const TextStyle(
                  fontFamily: "Satoshi", fontWeight: FontWeight.bold),
            ),
            const CustomDivider(),
            VGap(AppSpacing.px16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: AppSpacing.px1 * 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: const Border.fromBorderSide(
                            BorderSide(color: AppColors.strokeKre))),
                    child: CustomText.smallParagraphBold(
                        viewModel.formattedStartDate),
                  ),
                ),
                HGap(AppSpacing.px8),
                const CustomText.smallParagraphBold("-"),
                HGap(AppSpacing.px8),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: AppSpacing.px1 * 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: const Border.fromBorderSide(
                            BorderSide(color: AppColors.strokeKre))),
                    child: CustomText.smallParagraphBold(
                        viewModel.formattedEndDate),
                  ),
                )
              ],
            ),
            VGap(AppSpacing.px24),
            Row(
              children: [
                CustomButton.plain(
                  text: "Réinitialiser",
                  onPressed: () {},
                  foregroundColor: AppColors.redKre,
                ),
                Expanded(
                    child: CustomButton.filled(
                        onPressed: () {}, text: "Appliquer"))
              ],
            )
          ],
        ));
  }

  @override
  DatePickerFilterSheetModel viewModelBuilder(BuildContext context) =>
      DatePickerFilterSheetModel();
}
