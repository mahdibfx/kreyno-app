import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_filter_sheet_model.dart';

class HomeFilterSheet extends StackedView<HomeFilterSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const HomeFilterSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeFilterSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText.largeTitle("Filtres"),
              RoundedButton(
                iconPath: AppIcons.multiplicationSign,
                onPressed: () {},
              ),
            ],
          ),
          VGap(AppSpacing.px20),
          const CustomDivider(),
          VGap(AppSpacing.px20),
          const CustomText.paragraph(
            "Type de place",
            fontWeight: FontWeight.bold,
          ),
          VGap(AppSpacing.px12),
          Column(
            children: [
              LabeledCheckbox(
                label: "Toutes les places",
                value: true,
                onChanged: (d) {},
              ),
              VGap(AppSpacing.px4),
              LabeledCheckbox(
                label: "Uniquement avec borne de recharge",
                value: false,
                onChanged: (d) {},
              ),
              VGap(AppSpacing.px4),
              LabeledCheckbox(
                label: "Sans borne de recharge",
                value: false,
                onChanged: (d) {},
              ),
            ],
          ),
          VGap(AppSpacing.px12),
          const CustomDivider(),
          VGap(AppSpacing.px12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.paragraph("Rayon de recherche"),
              CustomText.smallParagraphBold("3 min", color: AppColors.greenKre),
            ],
          ),
          VGap(AppSpacing.px12),
          SizedBox(
            width: double.infinity,
            child: Slider(
              value: 0.5,
              onChanged: (d) {},
              activeColor: AppColors.greenKre,
              thumbColor: AppColors.white,
            ),
          ),
          VGap(AppSpacing.px12),
          Row(
            children: [
              CustomButton.plain(
                text: "Réinitialiser",
                onPressed: () {},
                foregroundColor: AppColors.redKre,
              ),
              HGap(AppSpacing.px8),
              Expanded(
                child: CustomButton.filled(text: "Appliquer", onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  HomeFilterSheetModel viewModelBuilder(BuildContext context) =>
      HomeFilterSheetModel();
}
