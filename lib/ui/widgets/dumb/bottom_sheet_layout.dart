import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';

class BottomSheetLayout extends StatelessWidget {
  final Widget body;
  // TODO : Add other props based on the design
  const BottomSheetLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px16,
        vertical: AppSpacing.px16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.px20),
          topRight: Radius.circular(AppSpacing.px24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: AppSpacing.px20,
            offset: Offset(0, -5 * AppSpacing.px1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.px20,
        children: [
          Container(
            width: 2.5 * AppSpacing.px24,
            height: AppSpacing.px8,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(AppSpacing.px12),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
