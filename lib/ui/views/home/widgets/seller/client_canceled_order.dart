import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/widgets/seller/let_my_place_bottombar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class ClientCanceledOrder extends StatelessWidget {
  const ClientCanceledOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppSpacing.px12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(AppSpacing.px1 * 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.redKre.withValues(alpha: .15),
                        ),
                        child: const CustomIcon(
                          iconPath: AppIcons.alert,
                          color: AppColors.redKre,
                        ),
                      ),
                      HGap(AppSpacing.px8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Réservation annulée par le client",
                            style: CustomTextStyle.smallParagraphBold,
                          ),
                          CustomText(
                            text: "Votre place est de nouveau disponible.",
                            style: CustomTextStyle.labelMedium,
                            color: AppColors.textKre,
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      const CustomIcon(
                        iconPath: AppIcons.multiplicationSign,
                        color: AppColors.textKre,
                      ),
                    ],
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: 4,
                      width: constraints.maxWidth - 90,
                      color: Colors.red,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const LetMyPlaceBottombar(),
      ],
    );
  }
}
