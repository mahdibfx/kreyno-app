import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'destructive_dialog_model.dart';

class DestructiveDialog extends StackedView<DestructiveDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DestructiveDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DestructiveDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      insetPadding: EdgeInsets.all(AppSpacing.px24),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.strokeKre),
        borderRadius: BorderRadius.circular(AppSpacing.px12),
      ),
      shadowColor: Colors.black.withValues(alpha: .1),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.px16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.px16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.px4,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpacing.px4,
                    children: [
                      CustomText.paragraph(
                        request.title ?? "common.title".tr(),
                        maxLines: 2,
                      ),
                      CustomText.smallParagraphMedium(
                        request.description ?? "common.description".tr(),
                        color: AppColors.textKre,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => completer(DialogResponse(confirmed: false)),
                  child: Container(
                    color: Colors.transparent,
                    child: CustomIcon(
                      iconPath: AppIcons.multiplicationSign,
                      size: AppSpacing.px24,
                      color: AppColors.textKre,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: AppSpacing.px12,
              children: [
                Flexible(
                  child: CustomButton.outlined(
                    text: request.secondaryButtonTitle ?? "common.cancel".tr(),
                    onPressed: () =>
                        completer(DialogResponse(confirmed: false)),
                  ),
                ),
                Flexible(
                  child: CustomButton.filled(
                    text: request.mainButtonTitle ?? "common.delete".tr(),
                    backgroundColor: AppColors.redKre,
                    foregroundColor: AppColors.white,
                    onPressed: () => completer(DialogResponse(confirmed: true)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  DestructiveDialogModel viewModelBuilder(BuildContext context) =>
      DestructiveDialogModel();
}
