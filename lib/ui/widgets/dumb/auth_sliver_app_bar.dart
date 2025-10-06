import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/app_logo.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class AuthSliverAppBar extends StatelessWidget {
  final String title;
  final String? description;
  final VoidCallback onBackPressed;
  final VoidCallback? onSkipPressed;

  const AuthSliverAppBar({
    super.key,
    required this.title,
    this.description,
    required this.onBackPressed,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: AuthAppBarDelegate(
        title: title,
        description: description,
        onBackPressed: onBackPressed,
        onSkipPressed: onSkipPressed,
      ),
      pinned: true,
    );
  }
}

class AuthAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String? description;
  final VoidCallback onBackPressed;
  final VoidCallback? onSkipPressed;

  AuthAppBarDelegate({
    required this.title,
    this.description,
    required this.onBackPressed,
    this.onSkipPressed,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final shrinkRatio = shrinkOffset / (maxExtent - minExtent);
    final opacity = (.9 - shrinkRatio).clamp(0.0, 1.0);

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(
        left: AppSpacing.px16,
        right: AppSpacing.px16,
        top: AppSpacing.px20,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.px20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onBackPressed,
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(
                      right: AppSpacing.px12,
                      top: AppSpacing.px12,
                      bottom: AppSpacing.px12,
                    ),
                    child: CustomIcon(
                      iconPath: AppIcons.arrowLeft,
                      size: AppSpacing.px20,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: .8,
                  alignment: Alignment.center,
                  child: const AppLogo(animated: false),
                ),
                if (onSkipPressed != null)
                  GestureDetector(
                    onTap: onSkipPressed,
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.px8),
                      child: CustomText.smallParagraphBold(
                        CommonStrings.skip,
                        color: AppColors.greenKre,
                      ),
                    ),
                  )
                else
                  HGap(AppSpacing.px32),
              ],
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: AppSpacing.px4,
                children: [
                  CustomText.largeTitle(title, color: AppColors.mainKre),
                  if (description != null)
                    CustomText.smallParagraphMedium(
                      description!,
                      color: AppColors.textKre,
                      maxLines: 2,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => (description != null ? 10 : 9) * AppSpacing.px20;

  @override
  double get minExtent => 110 * AppSpacing.px1;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
