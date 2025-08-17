import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
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
            LabeledRadio(
                label: "J’ai changé mes plans", value: true, onChanged: (d) {}),
            VGap(AppSpacing.px8),
            LabeledRadio(
                label: "Le/la client(e) prends trop de temps pour arriver",
                value: false,
                onChanged: (d) {}),
            VGap(AppSpacing.px8),
            LabeledRadio(
                label: "Le/la client(e) est trop loin",
                value: false,
                onChanged: (d) {}),
            VGap(AppSpacing.px8),
            LabeledRadio(
                label: "Autre (a spécifier)", value: false, onChanged: (d) {}),
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
