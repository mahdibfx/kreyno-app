import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
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
            onTap: () {
              locator<NavigationService>().back();
            },
            child: const CustomIcon(iconPath: AppIcons.arrowLeft),
          ),
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
          ...List.generate(
            viewModel.observations.length,
            (index) => Column(
              children: [
                LabeledRadio(
                  label: viewModel.observations[index],
                  value:
                      !viewModel.isOtherSelected &&
                      viewModel.observation == viewModel.observations[index],
                  onChanged: (d) {
                    viewModel.observation = viewModel.observations[index];
                    viewModel.isOtherSelected = false;
                    viewModel.rebuildUi();
                  },
                ),
                VGap(AppSpacing.px8),
              ],
            ),
          ),

          LabeledRadio(
            label: "Autre (a spécifier)",
            value: viewModel.isOtherSelected,
            onChanged: (d) {
              viewModel.isOtherSelected = true;
              viewModel.observation = "";
              viewModel.rebuildUi();
            },
          ),
          VGap(AppSpacing.px8),
          if (viewModel.isOtherSelected)
            InputField(
              controller: viewModel.otherTextController,
              focusNode: FocusNode(),
              hintText: "Saisissez votre raison d’annulation",
              keyboardType: TextInputType.text,
              onChanged: (value) {
                viewModel.observation = value;
                viewModel.rebuildUi();
              },
              maxLines: 4,
            ),
          VGap(AppSpacing.px24),
          VGap(AppSpacing.px24),
          SafeArea(
            top: false,
            bottom: true,
            child: CustomButton.filled(
              text: "Valider",
              backgroundColor: AppColors.redKre,
              foregroundColor: AppColors.white,
              onPressed: () {
                viewModel.cancelOrder(request.data);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  CancelationReasonsSheetModel viewModelBuilder(BuildContext context) =>
      CancelationReasonsSheetModel();
}
