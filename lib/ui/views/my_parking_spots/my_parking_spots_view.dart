import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/my_parking_spots/widgets/my_bought_spots/my_bought_spots.dart';
import 'package:kreyno/ui/views/my_parking_spots/widgets/my_sold_spots/my_sold_spots.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

import 'my_parking_spots_viewmodel.dart';
import 'widgets/tabs.dart';

class MyParkingSpotsView extends StackedView<MyParkingSpotsViewModel> {
  const MyParkingSpotsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyParkingSpotsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 48)),
          CustomSliverAppBar.shrunk(
            title: MyParkingSpotsStrings.title,
            trailingWidget: GestureDetector(
              onTap: viewModel.showFilterSheet,
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    CustomIcon(iconPath: AppIcons.sort, size: AppSpacing.px24),
                    if (viewModel.hasFilter)
                      Positioned(
                        right: 0,
                        child: Container(
                          width: AppSpacing.px8,
                          height: AppSpacing.px8,
                          decoration: const BoxDecoration(
                            color: AppColors.redKre,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            onBackPressed: viewModel.goBack,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            sliver: const MyParkingSpotsTabs(),
          ),
          SliverToBoxAdapter(child: VGap(AppSpacing.px20)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            sliver: SliverFillRemaining(
              hasScrollBody: true,
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 300),
                reverse: viewModel.reverse,
                transitionBuilder:
                    (
                      Widget child,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                        fillColor: AppColors.white,
                        child: child,
                      );
                    },
                child: viewModel.currentIndex == 0
                    ? MyBoughtSpots(
                        key: ValueKey(
                          'bought-spots-${viewModel.from}-${viewModel.to}',
                        ),
                        from: viewModel.from,
                        to: viewModel.to,
                      )
                    : MySoldSpots(
                        key: ValueKey(
                          'sold-spots-${viewModel.from}-${viewModel.to}',
                        ),
                        from: viewModel.from,
                        to: viewModel.to,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  MyParkingSpotsViewModel viewModelBuilder(BuildContext context) =>
      MyParkingSpotsViewModel();
}
