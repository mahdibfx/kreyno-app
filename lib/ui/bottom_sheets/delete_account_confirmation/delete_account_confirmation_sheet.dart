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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.redKre.withValues(alpha: .05),
                  child: const CustomIcon(
                    iconPath: AppIcons.dangerTriangle,
                    color: AppColors.redKre,
                  ),
                ),
                RoundedButton(
                    iconPath: AppIcons.multiplicationSign, onPressed: () {})
              ],
            ),
            VGap(AppSpacing.px20),
            const CustomText.largeTitle("Êtes-vous sûr ?"),
            VGap(AppSpacing.px20),
            const CustomText.smallParagraphMedium(
              "En supprimant votre compte, toutes vos informations, y compris vos parkings, paiements et véhicules ajoutés, seront définitivement effacées de Kreyno.",
              maxLines: 4,
              color: AppColors.textKre,
            ),
            VGap(AppSpacing.px20 * 1.5),
            CustomButton.filled(
              text: "Supprimer le compte",
              onPressed: () {},
              backgroundColor: AppColors.redKre,
              foregroundColor: AppColors.white,
            ),
            VGap(AppSpacing.px12),
          ],
        ));
  }

  @override
  DeleteAccountConfirmationSheetModel viewModelBuilder(BuildContext context) =>
      DeleteAccountConfirmationSheetModel();
}
