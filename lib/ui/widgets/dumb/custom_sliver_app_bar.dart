import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? trailingWidget;
  final VoidCallback onBackPressed;
  final bool isShrunk;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.description,
    this.trailingWidget,
    required this.onBackPressed,
  }) : isShrunk = false;

  const CustomSliverAppBar.shrunk({
    super.key,
    required this.title,
    this.trailingWidget,
    required this.onBackPressed,
  }) : isShrunk = true,
       description = null;

  @override
  Widget build(BuildContext context) {
    // The status-bar inset must be reserved by the delegate's extents (which
    // have no BuildContext), otherwise the toolbar row overflows the header's
    // fixed height on notch / Dynamic Island devices and its lower part stops
    // receiving taps.
    final topInset = MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      delegate: isShrunk
          ? CustomSliverAppBarDelegate.shrunk(
              title: title,
              trailingWidget: trailingWidget,
              onBackPressed: onBackPressed,
              topInset: topInset,
            )
          : CustomSliverAppBarDelegate(
              title: title,
              description: description,
              trailingWidget: trailingWidget,
              onBackPressed: onBackPressed,
              topInset: topInset,
            ),
      pinned: true,
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String? description;
  final Widget? trailingWidget;
  final VoidCallback onBackPressed;
  final bool isShrunk;
  final double topInset;

  CustomSliverAppBarDelegate({
    required this.title,
    this.description,
    required this.trailingWidget,
    required this.onBackPressed,
    required this.topInset,
  }) : isShrunk = false;

  CustomSliverAppBarDelegate.shrunk({
    required this.title,
    required this.trailingWidget,
    required this.onBackPressed,
    required this.topInset,
  }) : isShrunk = true,
       description = null;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final shrinkRatio = shrinkOffset / (maxExtent - minExtent);
    final largeTitleOpacity = (.9 - shrinkRatio).clamp(0.0, 1.0);
    final smallTitleOpacity = (shrinkRatio - 0.1).clamp(0.0, 1.0);

    return Container(
      color: AppColors.white,
      // Reserve the status-bar inset here (instead of SafeArea) so it is also
      // accounted for in minExtent/maxExtent and the row never overflows.
      padding: EdgeInsets.only(
        left: AppSpacing.px16,
        right: AppSpacing.px16,
        top: topInset + AppSpacing.px12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.px20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
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
              AnimatedOpacity(
                opacity: smallTitleOpacity,
                duration: Duration.zero,
                child: CustomText.paragraph(title, color: AppColors.mainKre),
              ),

              trailingWidget ?? HGap(AppSpacing.px32),
            ],
          ),
          if (!isShrunk)
            AnimatedOpacity(
              opacity: largeTitleOpacity,
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
    );
  }

  // Collapsed toolbar height, excluding the status-bar inset:
  // top breathing (px12) + back-button row (px12 + px20 + px12) + comfortable
  // slack so the row never overflows the header.
  double get _toolbarHeight => 19 * AppSpacing.px4;

  @override
  double get minExtent => topInset + _toolbarHeight;

  @override
  double get maxExtent => isShrunk
      ? minExtent
      : minExtent + (description != null ? 22 : 17) * AppSpacing.px4;

  @override
  bool shouldRebuild(covariant CustomSliverAppBarDelegate oldDelegate) =>
      oldDelegate.title != title ||
      oldDelegate.description != description ||
      oldDelegate.trailingWidget != trailingWidget ||
      oldDelegate.topInset != topInset;
}
