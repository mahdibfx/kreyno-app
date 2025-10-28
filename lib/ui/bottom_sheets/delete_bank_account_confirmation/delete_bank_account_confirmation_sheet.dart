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

import 'delete_bank_account_confirmation_sheet_model.dart';

class DeleteBankAccountConfirmationSheet
    extends StackedView<DeleteBankAccountConfirmationSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DeleteBankAccountConfirmationSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteBankAccountConfirmationSheetModel viewModel,
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
            DeleteBankAccountConfirmationStrings.title,
            maxLines: 2,
          ),
          VGap(AppSpacing.px20),
          CustomText.smallParagraphMedium(
            DeleteBankAccountConfirmationStrings.description,
            maxLines: 15,
            color: AppColors.textKre,
          ),
          VGap(AppSpacing.px24),
          Container(
            decoration: BoxDecoration(
              color: AppColors.redKre.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(AppSpacing.px12),
            ),
            padding: EdgeInsets.all(10 * AppSpacing.px1),
            child: Row(
              spacing: AppSpacing.px8,
              children: [
                CustomIcon(
                  iconPath: AppIcons.warningHex,
                  color: AppColors.redKre,
                  size: AppSpacing.px20,
                ),
                Expanded(
                  child: CustomText.smallParagraphMedium(
                    DeleteBankAccountConfirmationStrings.warning,
                    maxLines: 3,
                    color: AppColors.redKre,
                  ),
                ),
              ],
            ),
          ),
          VGap(AppSpacing.px24),
          Row(
            spacing: AppSpacing.px12,
            children: [
              Flexible(
                child: CustomButton.outlined(
                  text: DeleteBankAccountConfirmationStrings.cancel,
                  onPressed: () => completer!(SheetResponse(confirmed: false)),
                ),
              ),
              Flexible(
                child: CustomButton.filled(
                  text: DeleteBankAccountConfirmationStrings.delete,
                  backgroundColor: AppColors.redKre,
                  foregroundColor: AppColors.white,
                  onPressed: () => completer!(SheetResponse(confirmed: true)),
                ),
              ),
            ],
          ),
          VGap(AppSpacing.px8),
        ],
      ),
    );
  }

  @override
  DeleteBankAccountConfirmationSheetModel viewModelBuilder(
    BuildContext context,
  ) => DeleteBankAccountConfirmationSheetModel();
}
