import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked_services/stacked_services.dart';

class MyAppBar extends PreferredSize {
  final String title;
  final List<Widget>? actions;
  MyAppBar({super.key, required this.title, this.actions})
    : super(
        preferredSize: Size(5, AppSpacing.px1 * 62),
        child: AppBar(
          actions: actions,
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.greenKre.withValues(alpha: .2),
          leading: IconButton(
            onPressed: () {
              locator<NavigationService>().back();
            },
            icon: const CustomIcon(iconPath: AppIcons.arrowLeft),
          ),
          title: CustomText.paragraph(title),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
