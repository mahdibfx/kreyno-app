import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/payout/payout_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class DialPad extends ViewModelWidget<PayoutViewModel> {
  const DialPad({super.key});

  @override
  Widget build(BuildContext context, PayoutViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton.filled(
          size: CustomButtonSize.large,
          text: 'Confirmer',
          onPressed: () {},
        ),
        VGap(AppSpacing.px24),
        Row(
          spacing: AppSpacing.px12,
          children: [
            Expanded(
              child: DialPadButton.withLabel(
                label: "1",
                onPressed: () => viewModel.setAmount('1'),
              ),
            ),
            Expanded(
              child: DialPadButton.withLabel(
                label: "2",
                onPressed: () => viewModel.setAmount('2'),
              ),
            ),
            Expanded(
              child: DialPadButton.withLabel(
                label: "3",
                onPressed: () => viewModel.setAmount('3'),
              ),
            ),
          ],
        ),
        VGap(AppSpacing.px12),
        Row(
          spacing: AppSpacing.px12,
          children: [
            Expanded(
              child: DialPadButton.withLabel(
                label: "4",
                onPressed: () => viewModel.setAmount('4'),
              ),
            ),
            Expanded(
              child: DialPadButton.withLabel(
                label: "5",
                onPressed: () => viewModel.setAmount('5'),
              ),
            ),
            Expanded(
              child: DialPadButton.withLabel(
                label: "6",
                onPressed: () => viewModel.setAmount('6'),
              ),
            ),
          ],
        ),
        VGap(AppSpacing.px12),
        Row(
          spacing: AppSpacing.px12,
          children: [
            Expanded(
              child: DialPadButton.withLabel(
                label: "7",
                onPressed: () => viewModel.setAmount('7'),
              ),
            ),
            Expanded(
              child: DialPadButton.withLabel(
                label: "8",
                onPressed: () => viewModel.setAmount('8'),
              ),
            ),
            Expanded(
              child: DialPadButton.withLabel(
                label: "9",
                onPressed: () => viewModel.setAmount('9'),
              ),
            ),
          ],
        ),
        VGap(AppSpacing.px12),
        Row(
          spacing: AppSpacing.px12,
          children: [
            Expanded(
              child: DialPadButton.withLabel(
                label: ".",
                onPressed: () => viewModel.setAmount('.'),
              ),
            ),
            Expanded(
              child: DialPadButton.withLabel(
                label: "0",
                onPressed: () => viewModel.setAmount('0'),
              ),
            ),
            Expanded(
              child: DialPadButton.withIcon(
                icon: AppIcons.backDialPad,
                onPressed: () => viewModel.deleteLastDigit(),
                onLongPress: () => viewModel.deleteAllDigits(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DialPadButton extends StatelessWidget {
  final String? label;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final String? icon;

  const DialPadButton.withLabel({
    super.key,
    required this.label,
    required this.onPressed,
    this.onLongPress,
  }) : icon = null;

  const DialPadButton.withIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.onLongPress,
  }) : label = null;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFFFAFAFA),
        foregroundColor: AppColors.mainKre,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.px12),
        ),
        padding: EdgeInsets.all(AppSpacing.px8),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: AppColors.strokeKre.withValues(alpha: 0.25),
          width: 1,
        ),
        fixedSize: Size(double.maxFinite, 64 * AppSpacing.px1),
      ),
      child: Center(
        child: label != null
            ? CustomText.largeTitle(label!)
            : CustomIcon(iconPath: icon!, size: AppSpacing.px20),
      ),
    );
  }
}
