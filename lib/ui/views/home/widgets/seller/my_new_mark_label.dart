import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';

class MyNewMarkLabel extends StatelessWidget {
  const MyNewMarkLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                RoundedButton(
                  iconPath: AppIcons.arrowLeft,
                  onPressed: () {},
                  shape: BoxShape.rectangle,
                ),
                HGap(AppSpacing.px8),
                Expanded(
                    child: TextFormField(
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppSpacing.px1 * 14,
                      fontFamily: "Satoshi"),
                  decoration: InputDecoration(
                      hintText: 'Search ..',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      isDense: true,
                      filled: true,
                      fillColor: AppColors.white),
                ))
              ],
            ),
          ),
        ),
        const ChoosePlaceBottomBar()
      ],
    );
  }
}

class ChoosePlaceBottomBar extends StatelessWidget {
  const ChoosePlaceBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: AppSpacing.px24),
          child: Align(
            alignment: Alignment.centerRight,
            child: RoundedButton(
                shape: BoxShape.rectangle,
                iconPath: AppIcons.gpsOn,
                onPressed: () {}),
          ),
        ),
        VGap(AppSpacing.px24),
        Container(
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.px20,
            vertical: AppSpacing.px20,
          ),
          child: Column(
            children: [
              const CustomText(
                text: "Choisissez un emplacement",
                style: CustomTextStyle.title,
              ),
              VGap(AppSpacing.px4),
              const CustomText(
                text: "58-64 Rue de l'Université, 75007 Paris, France",
                style: CustomTextStyle.smallParagraphMedium,
                color: AppColors.textKre,
              ),
              VGap(AppSpacing.px24),
              CustomButton.filled(
                text: "Choisir",
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
