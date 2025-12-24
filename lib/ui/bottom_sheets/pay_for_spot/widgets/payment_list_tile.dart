import 'package:flutter/material.dart' hide Card;
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class PaymentMethodListTile extends StatelessWidget {
  const PaymentMethodListTile({
    super.key,
    required this.card,
    required this.isSelected,
  });
  final Card card;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px1 * 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? AppColors.greenKre
              : AppColors.textKre.withValues(alpha: .25),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: AppSpacing.px32 * 1.1,
            width: AppSpacing.px32 * 2,
            decoration: const BoxDecoration(
              color: AppColors.strokeKre,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.fromBorderSide(
                BorderSide(color: AppColors.textKre),
              ),
            ),
            child: Image.asset(
              card.brand == "visa"
                  ? "assets/images/visa.png"
                  : card.brand == "mastercard"
                  ? "assets/images/master card.png"
                  : "assets/images/kreyno_logo_icon.png",
            ),
          ),
          // Image.asset(
          //   card.brand == "visa"
          //       ? "assets/images/visa.png"
          //       : "assets/images/master card.png",
          // ),
          HGap(AppSpacing.px12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.labelRegular(
                locator<UserService>().currentUser?.firstName ??
                    " ${locator<UserService>().currentUser!.lastName}" ??
                    "",
                color: AppColors.textKre,
              ),
              CustomText.labelRegular("**** ${card.last4}"),
            ],
          ),
          const Expanded(child: SizedBox()),
          CircleAvatar(
            radius: AppSpacing.px8 + 1,
            backgroundColor: isSelected
                ? AppColors.greenKre
                : Colors.transparent,
            child: isSelected
                ? const Icon(Icons.done, color: Colors.white, size: 14)
                : null,
          ),
        ],
      ),
    );
  }
}
