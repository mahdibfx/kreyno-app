import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'delete_account_confirmation_sheet_model.dart';

class DeleteAccountConfirmationSheet
    extends StackedView<DeleteAccountConfirmationSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DeleteAccountConfirmationSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteAccountConfirmationSheetModel viewModel,
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
                backgroundColor: AppColors.redKre.withValues(alpha: .05),
                child: CustomIcon(
                  iconPath: AppIcons.dangerTriangle,
                  color: AppColors.redKre,
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
          CustomText.largeTitle(
            DeleteAccountConfirmationStrings.title,
            maxLines: 2,
          ),
          VGap(AppSpacing.px20),
          CustomText.smallParagraphMedium(
            DeleteAccountConfirmationStrings.description,
            maxLines: 15,
            color: AppColors.textKre,
          ),
          VGap(30 * AppSpacing.px1),
          CustomButton.filled(
            size: CustomButtonSize.small,
            text: DeleteAccountConfirmationStrings.buttonLabel,
            onPressed: () => completer!(SheetResponse(confirmed: true)),
            backgroundColor: AppColors.redKre,
            foregroundColor: AppColors.white,
          ),
        ],
      ),
    );
  }

  @override
  DeleteAccountConfirmationSheetModel viewModelBuilder(BuildContext context) =>
      DeleteAccountConfirmationSheetModel();
}
