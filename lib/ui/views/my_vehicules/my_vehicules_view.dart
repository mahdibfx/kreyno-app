import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/views/my_vehicules/widgets/my_vehicle_card.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/error_state_widget.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'my_vehicules_viewmodel.dart';

class MyVehiculesView extends StackedView<MyVehiculesViewModel> {
  const MyVehiculesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyVehiculesViewModel viewModel,
    Widget? child,
  ) {
    return LoadingOverlay(
      isShown: viewModel.actionInProgress,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                CustomSliverAppBar.shrunk(
                  title: MyVehiculesStrings.title,
                  onBackPressed: viewModel.goBack,
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: AppSpacing.px16,
                    right: AppSpacing.px16,
                    bottom: 4 * AppSpacing.px20,
                    top: AppSpacing.px12,
                  ),
                  sliver: viewModel.isBusy
                      ? SliverToBoxAdapter(
                          child: SizedBox(
                            height: 70.dh,
                            child: Center(
                              child: CustomLoadingIndicator(
                                size: 64 * AppSpacing.px1,
                              ),
                            ),
                          ),
                        )
                      : viewModel.hasError
                      ? SliverToBoxAdapter(
                          child: SizedBox(
                            height: 70.dh,
                            child: Center(
                              child: ErrorStateWidget(
                                errorMessage: viewModel.modelError ?? '',
                                onRetryTapped: viewModel.getAllCars,
                              ),
                            ),
                          ),
                        )
                      : viewModel.cars.isEmpty
                      ? const SliverToBoxAdapter(child: SizedBox.shrink())
                      : SliverList.builder(
                          itemCount: viewModel.cars.length,
                          itemBuilder: (context, index) {
                            final car = viewModel.cars[index];
                            return MyVehicleCard(
                              vehicle: car,
                              canDelete: viewModel.cars.length > 1,
                              onEdit: () {},
                              onDelete: () =>
                                  viewModel.onDeleteCarTapped(car.id),
                              onSetAsPrincipal: () =>
                                  viewModel.onSetDefaultCarTapped(car.id),
                            );
                          },
                        ),
                ),
              ],
            ),
            if (!viewModel.hasError)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.px16,
                    vertical: AppSpacing.px20,
                  ),
                  child: CustomButton.filled(
                    text: MyVehiculesStrings.addNewVehicle,
                    isDisabled: viewModel.isBusy,
                    onPressed: viewModel.onAddNewVehicleTapped,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(MyVehiculesViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getAllCars();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  MyVehiculesViewModel viewModelBuilder(BuildContext context) =>
      MyVehiculesViewModel();
}
