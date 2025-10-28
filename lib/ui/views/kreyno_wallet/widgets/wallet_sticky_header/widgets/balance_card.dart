import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final String currency;
  final String? partiallyVisibleBankAccountNumber;
  final bool isShrunk;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onRetry;

  bool get _isError => errorMessage != null;
  bool get _isLoading => isLoading;

  const BalanceCard.success({
    super.key,
    required this.balance,
    this.currency = '€',
    this.partiallyVisibleBankAccountNumber,
    this.isShrunk = false,
  }) : isLoading = false,
       errorMessage = null,
       onRetry = null;

  const BalanceCard.loading({super.key, this.isShrunk = false})
    : balance = 0.0,
      currency = '€',
      partiallyVisibleBankAccountNumber = null,
      isLoading = true,
      errorMessage = null,
      onRetry = null;

  const BalanceCard.error({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.isShrunk = false,
  }) : balance = 0.0,
       currency = '€',
       partiallyVisibleBankAccountNumber = null,
       isLoading = false,
       assert(
         errorMessage != null && onRetry != null,
         'errorMessage and onRetry must be provided for error state',
       );

  Widget _buildExpandedErrorStateContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText.paragraph(
          WalletStrings.unableToLoad,
          color: AppColors.white,
        ),
        VGap(AppSpacing.px4),
        CustomText.labelMedium(
          "${errorMessage}",
          maxLines: 3,
          textAlign: TextAlign.center,
          color: AppColors.textKre,
        ),
        VGap(AppSpacing.px12),
        GestureDetector(
          onTap: onRetry,
          child: Container(
            padding: EdgeInsets.only(bottom: 6 * AppSpacing.px1),
            color: Colors.transparent,
            child: CustomText.smallParagraphBold(
              CommonStrings.retry,
              textDecoration: TextDecoration.underline,
              textDecorationColor: AppColors.white,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedLoadingStateContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText.smallParagraphMedium(
          WalletStrings.yourBalance,
          color: AppColors.placeholderKre,
        ),
        VGap(AppSpacing.px4),
        Opacity(
          opacity: 0.2,
          child: Container(
            width: 192 * AppSpacing.px1,
            height: 44 * AppSpacing.px1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.white.withValues(alpha: 0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(AppSpacing.px4),
            ),
          ),
        ),
        VGap(AppSpacing.px12),
        Opacity(
          opacity: 0.2,
          child: Container(
            width: 163 * AppSpacing.px1,
            height: 18 * AppSpacing.px1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.white.withValues(alpha: 0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(AppSpacing.px4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedSuccessStateContent(String symbol) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText.smallParagraphMedium(
          WalletStrings.yourBalance,
          color: AppColors.placeholderKre,
        ),
        VGap(AppSpacing.px1),
        CustomText.largeTitle(
          "$balance$symbol",
          fontSize: 44 * AppSpacing.px1,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        VGap(AppSpacing.px12),
        if (partiallyVisibleBankAccountNumber != null)
          CustomText.labelMedium(
            partiallyVisibleBankAccountNumber!,
            color: AppColors.placeholderKre,
          )
        else
          VGap(AppSpacing.px4),
      ],
    );
  }

  Widget _buildShrunkSuccessStateContent(String symbol) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText.smallParagraphMedium(
          WalletStrings.yourBalance,
          color: AppColors.textKre,
        ),
        CustomText.paragraph("$balance$symbol", color: AppColors.mainKre),
      ],
    );
  }

  Widget _buildShrunkLoadingStateContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 174 * AppSpacing.px1,
          height: AppSpacing.px20,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFEDEDED), Color(0xFFF2F2F2)],
            ),
            borderRadius: BorderRadius.circular(AppSpacing.px4),
          ),
        ),
        CustomLoadingIndicator(size: 23 * AppSpacing.px1),
      ],
    );
  }

  Widget _buildShrunkErrorStateContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.px4,
          children: [
            CustomIcon(
              iconPath: AppIcons.alert,
              size: AppSpacing.px20,
              color: AppColors.textKre,
            ),
            CustomText.smallParagraphMedium(
              WalletStrings.unableToLoad,
              color: AppColors.textKre,
            ),
          ],
        ),
        GestureDetector(
          onTap: onRetry,
          child: CustomText.paragraph(
            CommonStrings.retry,
            color: AppColors.mainKre,
            textDecoration: TextDecoration.underline,
            textDecorationColor: AppColors.mainKre,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final symbol = currency.toUpperCase().trim() == 'EUR' ? '€' : currency;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return Align(
          alignment: Alignment.topCenter,
          child: SizeTransition(
            sizeFactor: animation,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: isShrunk
          ? Container(
              key: const ValueKey('shrunk'),
              padding: EdgeInsets.all(10 * AppSpacing.px1),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(AppSpacing.px12),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: AppColors.strokeKre.withValues(alpha: 0.25),
                    width: 1.0,
                  ),
                ),
              ),
              child: _isLoading
                  ? _buildShrunkLoadingStateContent()
                  : _isError
                  ? _buildShrunkErrorStateContent()
                  : _buildShrunkSuccessStateContent(symbol),
            )
          : Container(
              key: const ValueKey('expanded'),
              padding: EdgeInsets.all(AppSpacing.px4),
              height: 156 * AppSpacing.px1,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSpacing.px12),
                border: Border.all(color: AppColors.strokeKre, width: 1.0),
              ),
              child: Container(
                padding: EdgeInsets.all(10 * AppSpacing.px1),
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppImages.bgCard),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(AppSpacing.px8),
                ),
                child: _isLoading
                    ? _buildExpandedLoadingStateContent()
                    : _isError
                    ? _buildExpandedErrorStateContent()
                    : _buildExpandedSuccessStateContent(symbol),
              ),
            ),
    );
  }
}
