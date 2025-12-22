import 'package:flutter/material.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/views/my_parking_spots/widgets/empty_state.dart';
import 'package:kreyno/ui/views/my_parking_spots/widgets/parking_space_list_item.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/error_state_widget.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/refresher.dart';
import 'package:stacked/stacked.dart';

import 'my_sold_spots_model.dart';

class MySoldSpots extends StackedView<MySoldSpotsModel> {
  final DateTime? from;
  final DateTime? to;

  const MySoldSpots({super.key, this.from, this.to});

  @override
  Widget builder(
    BuildContext context,
    MySoldSpotsModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? SingleChildScrollView(
            child: Transform.translate(
              offset: Offset(0, -5.dh),
              child: Center(
                child: CustomLoadingIndicator(size: 64 * AppSpacing.px1),
              ),
            ),
          )
        : viewModel.hasError
        ? Transform.translate(
            offset: Offset(0, -5.dh),
            child: ErrorStateWidget(
              errorMessage: '${viewModel.modelError}',
              onRetryTapped: viewModel.getSoldSpots,
            ),
          )
        : viewModel.soldSpots.isEmpty
        ? Transform.translate(
            offset: Offset(0, -5.dh),
            child: ParkingSpotsEmptyState(
              title: MyParkingSpotsStrings.soldEmptyTitle,
              description: MyParkingSpotsStrings.soldEmptyDescription,
            ),
          )
        : Refresher(
            onRefresh: () => viewModel.onRefresh(from: from, to: to),
            edgeOffset: 1.dh,
            displacement: 1.dh,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!viewModel.isLoadingMore &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  viewModel.loadMoreSoldSpots(from: from, to: to);
                  return true;
                }
                return false;
              },
              child: ListView.separated(
                key: const ValueKey('sold-spots'),
                itemCount:
                    viewModel.soldSpots.length +
                    (viewModel.isLoadingMore ? 1 : 0),
                padding: EdgeInsets.only(bottom: AppSpacing.px24),
                separatorBuilder: (context, index) => VGap(10 * AppSpacing.px1),
                itemBuilder: (context, index) {
                  if (index == viewModel.soldSpots.length) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(AppSpacing.px16),
                        child: CustomLoadingIndicator(
                          size: 32 * AppSpacing.px1,
                        ),
                      ),
                    );
                  }
                  final spot = viewModel.soldSpots[index];
                  return ParkingSpaceListItem(
                    // TODO : add date from backend
                    date: spot.createdAt,
                    address: spot.address,
                    imageUrl:
                        spot.seller?.avatar?.url ??
                        AppConstants.defaultAvatarUrl,
                    hasElectricCharging: spot.electricChargeStation,
                    price: spot.price,
                  );
                },
              ),
            ),
          );
  }

  @override
  void onViewModelReady(MySoldSpotsModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getSoldSpots(from: from, to: to);
    });
    super.onViewModelReady(viewModel);
  }

  @override
  MySoldSpotsModel viewModelBuilder(BuildContext context) => MySoldSpotsModel();
}
