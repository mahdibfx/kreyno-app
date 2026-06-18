import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/choose_selling_place_location/choose_selling_place_location_view.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:logger/logger.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'create_spot_sheet_model.dart';

class CreateSpotSheet extends StackedView<CreateSpotSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CreateSpotSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateSpotSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "createSpot.title".tr(),
                style: CustomTextStyle.largeTitle,
              ),
              RoundedButton(
                iconPath: AppIcons.multiplicationSign,
                onPressed: () {
                  locator<NavigationService>().back();
                },
              ),
            ],
          ),
          VGap(AppSpacing.px20),
          InputField(
            disabled: false,
            readOnly: true,
            onTap: viewModel.choosePlaceInputClicked,
            controller: viewModel.placeController,
            showOptionalLabel: false,
            focusNode: viewModel.placeFocusNode,
            labelText: "createSpot.placeLabel".tr(),
            hintText: "createSpot.spotNameHint".tr(),
            keyboardType: TextInputType.text,
          ),
          VGap(AppSpacing.px8),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (viewModel.isLocationEnabled) {
                    Logger().i("Use my position clicked");
                    viewModel.useMyPosition();
                  }
                },
                child: Opacity(
                  opacity: viewModel.isLocationEnabled ? 1 : 0.3,
                  child: Row(
                    children: [
                      const CustomIcon(iconPath: AppIcons.locationUser),
                      HGap(AppSpacing.px1 * 10),
                      CustomText(
                        text: "createSpot.useMyPosition".tr(),
                        style: CustomTextStyle.smallParagraphMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: () {
                  if (!viewModel.isLocationEnabled) {
                    viewModel.onEnableButtonClicked();
                  }
                },
                child: Opacity(
                  opacity: viewModel.isLocationEnabled ? 0.3 : 1,
                  child: CustomText(
                    text: "createSpot.spotDescriptionHint".tr(),
                    style: CustomTextStyle.smallParagraphBold,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          VGap(AppSpacing.px1 * 26.5),
          const CustomDivider(),
          VGap(AppSpacing.px16),
          InputField(
            disabled: true,
            textInputAction: TextInputAction.done,
            controller: viewModel.priceController,
            focusNode: viewModel.priceFocusNode,

            labelText: "createSpot.choosePrice".tr(),
            showOptionalLabel: false,
            onChanged: (f) {
              viewModel.rebuildUi();
            },
            hintText: "2.5€",
            trailingIcon: Container(
              padding: const EdgeInsets.all(10),
              child: const CustomIcon(
                iconPath: AppIcons.euro,
                size: 10,
                color: AppColors.textKre,
              ),
            ),
            keyboardType: TextInputType.number,
          ),

          VGap(AppSpacing.px8),
          const CustomText.smallParagraphMedium(
            "Tarif unique de 2€ jusqu'au 31 août 2026",
            color: AppColors.textKre,
          ),
          // Row(
          //   children: [
          //     const CustomIcon(
          //       iconPath: AppIcons.energy,
          //       color: AppColors.greenKre,
          //     ),
          //     HGap(AppSpacing.px4),
          //     CustomText(
          //       text: "createSpot.electricCharging".tr(),
          //       style: CustomTextStyle.smallParagraphMedium,
          //       color: AppColors.textKre,
          //     ),
          //   ],
          // ),
          // VGap(AppSpacing.px8),
          // Row(
          //   children: [
          //     Expanded(
          //       child: LabeledCheckbox(
          //         label: "createSpot.possible".tr(),
          //         value: viewModel.bornDisponible,
          //         onChanged: (d) {
          //           viewModel.changedBorneValue(true);
          //         },
          //       ),
          //     ),
          //     Expanded(
          //       child: LabeledCheckbox(
          //         label: "createSpot.notPossible".tr(),
          //         value: !viewModel.bornDisponible,
          //         onChanged: (d) {
          //           viewModel.changedBorneValue(false);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          VGap(AppSpacing.px24),
          SafeArea(
            top: false,
            bottom: Platform.isAndroid,
            child: CustomButton.filled(
              isDisabled: !viewModel.validateCreateSpotButton(),
              text: "createSpot.validate".tr(),
              onPressed: () {
                viewModel.priceFocusNode.unfocus();
                viewModel.letMyPlaceButtonClicked();
              },
            ),
          ),
          VGap(AppSpacing.px8),
        ],
      ),
      showDragHandler: false,
    );
  }

  @override
  void onViewModelReady(CreateSpotSheetModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.checkIfLocationEnabled();
  }

  @override
  CreateSpotSheetModel viewModelBuilder(BuildContext context) =>
      CreateSpotSheetModel();
}
