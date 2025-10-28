import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/my_parking_spots/my_parking_spots_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

class MyParkingSpotsTabs extends ViewModelWidget<MyParkingSpotsViewModel> {
  const MyParkingSpotsTabs({super.key});

  @override
  Widget build(BuildContext context, MyParkingSpotsViewModel viewModel) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MyParkingSpotsTabsDelegate(
        selectedIndex: viewModel.currentIndex,
        setIndex: viewModel.setIndex,
      ),
    );
  }
}

class MyParkingSpotsTabsDelegate extends SliverPersistentHeaderDelegate {
  final int selectedIndex;
  final Function(int) setIndex;

  const MyParkingSpotsTabsDelegate({
    required this.selectedIndex,
    required this.setIndex,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.white,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.px4),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setIndex(0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(
                      alpha: selectedIndex == 0 ? 1.0 : .0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.px20,
                    vertical: AppSpacing.px1 * 10,
                  ),
                  child: CustomText.smallParagraphBold(
                    MyParkingSpotsStrings.boughtSpotsTab,
                    textAlign: TextAlign.center,
                    color: selectedIndex == 0
                        ? AppColors.mainKre
                        : AppColors.textKre,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setIndex(1),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 1
                        ? AppColors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.px20,
                    vertical: AppSpacing.px1 * 10,
                  ),
                  child: CustomText.smallParagraphBold(
                    MyParkingSpotsStrings.soldSpotsTab,
                    textAlign: TextAlign.center,
                    color: selectedIndex == 1
                        ? AppColors.mainKre
                        : AppColors.textKre,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 48 * AppSpacing.px1;

  @override
  double get minExtent => 48 * AppSpacing.px1;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
