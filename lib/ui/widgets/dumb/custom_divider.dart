import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.height = 1});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: AppColors.strokeKre,
    );
  }
}
