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

import 'logout_confirmation_sheet_model.dart';

class LogoutConfirmationSheet
    extends StackedView<LogoutConfirmationSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const LogoutConfirmationSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LogoutConfirmationSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      showDragHandler: false,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.redKre.withValues(alpha: .05),
                child: const CustomIcon(
                  iconPath: AppIcons.logout,
                  color: AppColors.redKre,
                ),
              ),
              RoundedButton(
                iconPath: AppIcons.multiplicationSign,
                onPressed: () {},
              ),
            ],
          ),
          VGap(AppSpacing.px20),
          const CustomText.largeTitle("Se déconnecter de Kreyno ?"),
          VGap(AppSpacing.px20),
          const CustomText.smallParagraphMedium(
            "Êtes-vous sûr de vouloir vous déconnecter ? Vous pourrez toujours vous reconnecter à tout moment.",
            maxLines: 2,
            color: AppColors.textKre,
          ),
          VGap(AppSpacing.px20 * 1.5),
          CustomButton.filled(
            text: "Oui, se déconnecter",
            onPressed: () {},
            backgroundColor: AppColors.redKre,
            foregroundColor: AppColors.white,
          ),
          VGap(AppSpacing.px12),
        ],
      ),
    );
  }

  @override
  LogoutConfirmationSheetModel viewModelBuilder(BuildContext context) =>
      LogoutConfirmationSheetModel();
}
