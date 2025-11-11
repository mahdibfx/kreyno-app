import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';

class Refresher extends StatelessWidget {
  final bool enableRefresh;
  final Future<void> Function() onRefresh;
  final double? edgeOffset;
  final double? displacement;
  final Widget child;

  const Refresher({
    super.key,
    required this.onRefresh,
    required this.child,
    this.enableRefresh = true,
    this.edgeOffset,
    this.displacement,
  });

  @override
  Widget build(BuildContext context) {
    return enableRefresh
        ? RefreshIndicator(
            onRefresh: onRefresh,
            color: AppColors.greenKre,
            backgroundColor: AppColors.white,
            edgeOffset: edgeOffset ?? 60 * AppSpacing.px1,
            displacement: displacement ?? 40 * AppSpacing.px1,
            child: child,
          )
        : child;
  }
}
