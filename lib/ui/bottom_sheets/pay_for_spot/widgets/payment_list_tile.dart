import 'package:flutter/material.dart' hide Card;
import 'package:kreyno/models/card.dart';
import 'package:kreyno/ui/common/app_colors.dart';
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
        border: Border.all(color: AppColors.textKre.withValues(alpha: .25)),
      ),
      child: Row(
        children: [
          // Image.asset(AppImages.visa),
          HGap(AppSpacing.px12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.labelRegular(
                card.brand.toUpperCase(),
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
