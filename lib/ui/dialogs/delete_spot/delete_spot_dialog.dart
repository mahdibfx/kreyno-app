import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'delete_spot_dialog_model.dart';

const double _graphicSize = 60;

class DeleteSpotDialog extends StackedView<DeleteSpotDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteSpotDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteSpotDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Supprimer cette place ?",
                        style: CustomTextStyle.paragraph,
                      ),
                      CustomText(
                        text:
                            "Cette place sera retirée et ne sera plus proposée aux utilisateurs.",
                        maxLines: 2,
                        style: CustomTextStyle.smallParagraphMedium,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    completer(DialogResponse(confirmed: false));
                  },
                  child: const CustomIcon(
                    iconPath: AppIcons.multiplicationSign,
                    color: AppColors.textKre,
                  ),
                )
              ],
            ),
            VGap(AppSpacing.px16),
            Row(
              children: [
                Expanded(
                  child: CustomButton.outlined(
                    text: "Annuler",
                    onPressed: () {
                      completer(DialogResponse(confirmed: false));
                    },
                  ),
                ),
                HGap(AppSpacing.px12),
                Expanded(
                  child: CustomButton.filled(
                    backgroundColor: AppColors.redKre,
                    text: "Supprimer",
                    foregroundColor: AppColors.white,
                    onPressed: () {
                      completer(DialogResponse(confirmed: true));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  DeleteSpotDialogModel viewModelBuilder(BuildContext context) =>
      DeleteSpotDialogModel();
}
