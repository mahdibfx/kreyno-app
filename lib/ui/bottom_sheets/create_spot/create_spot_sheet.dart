import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Céder ma place",
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
            controller: TextEditingController(),
            focusNode: FocusNode(),
            labelText: "Emplacement",
            hintText: "Au Gustave",
            keyboardType: TextInputType.text,
          ),
          VGap(AppSpacing.px8),
          Row(
            children: [
              const CustomIcon(iconPath: AppIcons.locationUser),
              HGap(AppSpacing.px1 * 10),
              const CustomText(
                text: "Utiliser ma position actuelle",
                style: CustomTextStyle.smallParagraphMedium,
              ),
              const Expanded(child: SizedBox()),
              const CustomText(
                text: "Activer",
                style: CustomTextStyle.smallParagraphBold,
                textDecoration: TextDecoration.underline,
              ),
            ],
          ),
          VGap(AppSpacing.px1 * 26.5),
          const CustomDivider(),
          VGap(AppSpacing.px16),
          InputField(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            labelText: "Choisissez un prix",
            hintText: "Recommmendé: 2€ ∼ 7€",
            suffixWidget: Container(
              padding: const EdgeInsets.all(10),
              child: const CustomIcon(
                iconPath: AppIcons.euro,
                size: 10,
                color: AppColors.textKre,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          VGap(AppSpacing.px16),
          Row(
            children: [
              const CustomIcon(
                iconPath: AppIcons.energy,
                color: AppColors.greenKre,
              ),
              HGap(AppSpacing.px4),
              const CustomText(
                text: "Borne de recharge électrique",
                style: CustomTextStyle.smallParagraphMedium,
                color: AppColors.textKre,
              ),
            ],
          ),
          VGap(AppSpacing.px8),
          Row(
            children: [
              Expanded(
                child: LabeledCheckbox(
                  label: "Disponible",
                  value: true,
                  onChanged: (d) {},
                ),
              ),
              Expanded(
                child: LabeledCheckbox(
                  label: "Non Disponible",
                  value: false,
                  onChanged: (d) {},
                ),
              ),
            ],
          ),
          VGap(AppSpacing.px24),
          CustomButton.filled(text: "Céder ma place", onPressed: () {}),
          VGap(AppSpacing.px8),
        ],
      ),
      showDragHandler: false,
    );
  }

  @override
  CreateSpotSheetModel viewModelBuilder(BuildContext context) =>
      CreateSpotSheetModel();
}
