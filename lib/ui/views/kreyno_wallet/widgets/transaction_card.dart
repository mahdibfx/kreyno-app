import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/enums/wallet_history_category.dart';
import 'package:kreyno/models/wallet_history.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class TransactionCard extends StatelessWidget {
  final WalletHistory transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.px12),
        border: Border.all(color: AppColors.strokeKre.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              spacing: AppSpacing.px8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 44 * AppSpacing.px1,
                  height: 44 * AppSpacing.px1,
                  decoration: BoxDecoration(
                    color: transaction.category == WalletHistoryCategory.earn
                        ? AppColors.greenKre.withValues(alpha: 0.07)
                        : AppColors.redKre.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(AppSpacing.px8),
                  ),
                  child: Center(
                    child: CustomIcon(
                      iconPath:
                          transaction.category == WalletHistoryCategory.earn
                          ? AppIcons.parking
                          : AppIcons.cardReceive,
                      color: transaction.category == WalletHistoryCategory.earn
                          ? AppColors.greenKre
                          : AppColors.redKre,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText.paragraph(
                        '${transaction.category == WalletHistoryCategory.earn ? WalletStrings.sale : WalletStrings.withdrawal} #${transaction.id}',
                      ),
                      CustomText.smallParagraphMedium(
                        DateFormat(
                          'dd-MM-yyyy · HH:mm',
                        ).format(transaction.createdAt),
                        color: AppColors.textKre,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomText.paragraph(
            '${transaction.category == WalletHistoryCategory.earn ? '+' : '-'} ${transaction.amount.toStringAsFixed(1)} €',
            color: transaction.category == WalletHistoryCategory.earn
                ? AppColors.greenKre
                : AppColors.redKre,
          ),
        ],
      ),
    );
  }
}
