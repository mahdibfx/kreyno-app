import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/app_logo.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class AuthSliverAppBar extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onBackPressed;

  const AuthSliverAppBar({
    super.key,
    required this.title,
    required this.description,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: AuthAppBarDelegate(
        title: title,
        description: description,
        onBackPressed: onBackPressed,
      ),
      pinned: true,
    );
  }
}

class AuthAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String description;
  final VoidCallback onBackPressed;

  AuthAppBarDelegate(
      {required this.title,
      required this.description,
      required this.onBackPressed});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
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
                  child: const AppLogo(
                    animated: false,
                  ),
                ),
                HGap(AppSpacing.px32),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: AppSpacing.px4,
              children: [
                CustomText.largeTitle(
                  title,
                  color: AppColors.mainKre,
                ),
                CustomText.smallParagraphMedium(
                  description,
                  color: AppColors.textKre,
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 10 * AppSpacing.px20;

  @override
  double get minExtent => 10 * AppSpacing.px20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
