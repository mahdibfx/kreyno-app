import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/my_vehicules/widgets/my_vehicule_card.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'my_vehicules_viewmodel.dart';

class MyVehiculesView extends StackedView<MyVehiculesViewModel> {
  const MyVehiculesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyVehiculesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.px24,
          vertical: AppSpacing.px20,
        ).copyWith(bottom: AppSpacing.px32),
        child: CustomButton.filled(
          onPressed: () {
            locator<NavigationService>().navigateToAddVehiculeView();
          },
          text: "Ajouter un nouveau véhicule",
        ),
      ),
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'Mes véhicules'),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) => MyVehiculeCard(
              isPrincipal: index == viewModel.principlaCarId,
              onTapOnMenu: (result) {
                viewModel.onMenuTap(result, index);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  MyVehiculesViewModel viewModelBuilder(BuildContext context) =>
      MyVehiculesViewModel();
}
