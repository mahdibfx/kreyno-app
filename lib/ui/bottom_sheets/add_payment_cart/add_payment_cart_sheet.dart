import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_payment_cart_sheet_model.dart';

class AddPaymentCartSheet extends StackedView<AddPaymentCartSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddPaymentCartSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddPaymentCartSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  locator<NavigationService>().back();
                },
                child: const CustomIcon(iconPath: AppIcons.arrowLeft)),
            const CustomText.paragraph("Ajouter une carte"),
            const Opacity(
                opacity: 0,
                child: CustomIcon(iconPath: AppIcons.multiplicationSign))
          ],
        ),
        VGap(AppSpacing.px24),
        InputField(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            labelText: "Nom sur la carte",
            hintText: "Entrez le nom",
            keyboardType: TextInputType.text),
        VGap(AppSpacing.px16),
        InputField(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            labelText: "Numero de la carte",
            hintText: "XXXX XXXX XXXX XXXX",
            keyboardType: TextInputType.text),
        VGap(AppSpacing.px16),
        Row(
          children: [
            Expanded(
              child: InputField(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  labelText: "Expiration",
                  hintText: "mm/aaaa",
                  keyboardType: TextInputType.text),
            ),
            HGap(AppSpacing.px12),
            Expanded(
              child: InputField(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  labelText: "CVV",
                  hintText: "CVV",
                  keyboardType: TextInputType.text),
            ),
          ],
        ),
        VGap(AppSpacing.px16),
        Column(
          children: [
            LabeledCheckbox(
                label: "Définir en tant que carte principale",
                value: true,
                onChanged: (d) {}),
            VGap(AppSpacing.px8),
            LabeledCheckbox(
                label:
                    "J’ai lu et approuvé les termes et les conditions d’utilisations.",
                value: true,
                onChanged: (d) {})
          ],
        ),
        VGap(AppSpacing.px16),
        CustomButton.filled(text: "Enregistrer cette carte", onPressed: () {}),
        VGap(AppSpacing.px16),
      ],
    ));
  }

  @override
  AddPaymentCartSheetModel viewModelBuilder(BuildContext context) =>
      AddPaymentCartSheetModel();
}
