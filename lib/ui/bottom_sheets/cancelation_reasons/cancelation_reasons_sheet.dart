import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_radio.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'cancelation_reasons_sheet_model.dart';

class CancelationReasonsSheet
    extends StackedView<CancelationReasonsSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CancelationReasonsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CancelationReasonsSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {},
                child: const CustomIcon(iconPath: AppIcons.arrowLeft)),
            VGap(AppSpacing.px20),
            const CustomText(
              text: "Êtes-vous sur de vouloir annuler cette réservation?",
              style: CustomTextStyle.largeTitle,
              maxLines: 2,
            ),
            VGap(AppSpacing.px4),
            const CustomText(
              text: "Sélectionnez une raison ci-dessous.",
              style: CustomTextStyle.smallParagraphMedium,
              color: AppColors.textKre,
            ),
            VGap(AppSpacing.px24),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.reasons.length,
              separatorBuilder: (context, index) => VGap(AppSpacing.px8),
              itemBuilder: (context, index) {
                return LabeledRadio(
                  label: viewModel.reasons[index]!,
                  value: viewModel.selectedReasonId == index,
                  onChanged: (d) {
                    viewModel.changeReason(index);
                  },
                );
              },
            ),
            VGap(AppSpacing.px8),
            // InputField( controller: , focusNode: focusNode, labelText: labelText, hintText: hintText, keyboardType: keyboardType)

            if (viewModel.selectedReasonId == 3)
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Saisissez votre raison d’annulation",
                  hintStyle: AppTypography.smallParagraphMedium.copyWith(
                    color: AppColors.placeholderKre,
                  ),
                  errorStyle: AppTypography.labelRegular.copyWith(
                    color: AppColors.redKre,
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.px16,
                    vertical: AppSpacing.px12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.strokeKre,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.strokeKre,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.greenKre,
                      width: 1.2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.redKre,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.redKre,
                      width: 1.2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.px12),
                    borderSide: const BorderSide(
                      color: AppColors.strokeKre,
                      width: 1.0,
                    ),
                  ),
                  counterText: '',
                ),
              ),
            VGap(AppSpacing.px24),
            CustomButton.filled(
              text: "Valider",
              backgroundColor: AppColors.redKre,
              foregroundColor: AppColors.white,
              onPressed: () {},
            )
          ]),
    );
  }

  @override
  CancelationReasonsSheetModel viewModelBuilder(BuildContext context) =>
      CancelationReasonsSheetModel();
}
