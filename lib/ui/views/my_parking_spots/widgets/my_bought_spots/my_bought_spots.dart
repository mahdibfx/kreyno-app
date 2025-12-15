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

import 'my_bought_spots_model.dart';

class MyBoughtSpots extends StackedView<MyBoughtSpotsModel> {
  final DateTime? from;
  final DateTime? to;

  const MyBoughtSpots({super.key, this.from, this.to});

  @override
  Widget builder(
    BuildContext context,
    MyBoughtSpotsModel viewModel,
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
              onRetryTapped: () => viewModel.getBoughtSpots(from: from, to: to),
            ),
          )
        : viewModel.boughtSpots.isEmpty
        ? Transform.translate(
            offset: Offset(0, -5.dh),
            child: ParkingSpotsEmptyState(
              title: MyParkingSpotsStrings.boughtEmptyTitle,
              description: MyParkingSpotsStrings.boughtEmptyDescription,
            ),
          )
        : Refresher(
            onRefresh: () => viewModel.onRefresh(from: from, to: to),
            edgeOffset: 1.dh,
            displacement: 1.dh,
            child: ListView.separated(
              key: const ValueKey('bought-spots'),
              itemCount: viewModel.boughtSpots.length,
              padding: EdgeInsets.only(bottom: AppSpacing.px24),
              separatorBuilder: (context, index) => VGap(10 * AppSpacing.px1),
              itemBuilder: (context, index) {
                final reservation = viewModel.boughtSpots[index];
                return ParkingSpaceListItem(
                  // TODO : add date from backend
                  date: reservation.createdAt,
                  address: reservation.parkingPlace.address,
                  imageUrl:
                      reservation.buyer.avatar?.url ??
                      AppConstants.defaultAvatarUrl,
                  hasElectricCharging:
                      false, // ParkingPlace doesn't have electric charging info
                  price: reservation.parkingPlace.totalPaidPrice,
                );
              },
            ),
          );
  }

  @override
  void onViewModelReady(MyBoughtSpotsModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getBoughtSpots(from: from, to: to);
    });
    super.onViewModelReady(viewModel);
  }

  @override
  MyBoughtSpotsModel viewModelBuilder(BuildContext context) =>
      MyBoughtSpotsModel();
}
