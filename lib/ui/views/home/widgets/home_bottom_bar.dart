import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:stacked/stacked.dart';

class HomeBottomBar extends ViewModelWidget<HomeViewModel> {
  const HomeBottomBar({super.key, this.isButtonDisabled});
  final bool? isButtonDisabled;
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.px20),
          topRight: Radius.circular(AppSpacing.px20),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px16,
        vertical: AppSpacing.px20,
      ),
      child: Row(
        spacing: AppSpacing.px8,
        children: [
          Expanded(
            child: CustomButton.filled(
              size: CustomButtonSize.small,
              text: "Céder ma place",
              onPressed: () {},
            ),
          ),
          GestureDetector(
            onTap: viewModel.showProfileSheet,
            child: Container(
              width: 10 * AppSpacing.px4,
              height: 10 * AppSpacing.px4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.strokeKre,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/100/100"),
                ),
                borderRadius: BorderRadius.circular(AppSpacing.px12),
                color: AppColors.placeholderKre,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
