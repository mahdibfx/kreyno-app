import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'location_disclosure_sheet_model.dart';

/// Prominent disclosure shown before requesting the location permission.
///
/// Required by Google Play: the user must be told what location data is
/// collected and why (including background use) before the runtime permission
/// prompt, with an affirmative action to continue. Confirming returns
/// `SheetResponse(confirmed: true)`; declining/closing returns
/// `SheetResponse(confirmed: false)`.
class LocationDisclosureSheet
    extends StackedView<LocationDisclosureSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const LocationDisclosureSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LocationDisclosureSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      showDragHandler: false,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25 * AppSpacing.px1,
                backgroundColor: AppColors.greenKre.withValues(alpha: .15),
                child: CustomIcon(
                  iconPath: AppIcons.locationUser,
                  color: AppColors.mainKre,
                  size: AppSpacing.px24,
                ),
              ),
              RoundedButton(
                iconPath: AppIcons.multiplicationSign,
                onPressed: () => completer!(SheetResponse(confirmed: false)),
              ),
            ],
          ),
          VGap(AppSpacing.px20),
          CustomText.largeTitle("locationDisclosure.title".tr(), maxLines: 2),
          VGap(AppSpacing.px16),
          CustomText.smallParagraphMedium(
            "locationDisclosure.description".tr(),
            maxLines: 8,
            color: AppColors.textKre,
          ),
          VGap(30 * AppSpacing.px1),
          CustomButton.filled(
            text: "locationDisclosure.agree".tr(),
            onPressed: () => completer!(SheetResponse(confirmed: true)),
          ),
          VGap(AppSpacing.px8),
          CustomButton.outlined(
            text: "locationDisclosure.notNow".tr(),
            onPressed: () => completer!(SheetResponse(confirmed: false)),
          ),
        ],
      ),
    );
  }

  @override
  LocationDisclosureSheetModel viewModelBuilder(BuildContext context) =>
      LocationDisclosureSheetModel();
}
