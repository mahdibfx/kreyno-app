import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/views/choose_selling_place_location/widgets/smart/my_new_mark_label.dart';
import 'package:stacked/stacked.dart';

import 'choose_selling_place_location_viewmodel.dart';

class ChooseSellingPlaceLocationView
    extends StackedView<ChooseSellingPlaceLocationViewModel> {
  const ChooseSellingPlaceLocationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChooseSellingPlaceLocationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                viewModel.center.latitude,
                viewModel.center.longitude,
              ),
              zoom: 12,
            ),
            onMapCreated: viewModel.onMapCreated,
            zoomControlsEnabled: false,

            onCameraMove: (position) {
              viewModel.setAddress(position.target);
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.mapPin, width: 42, height: 73),
              ],
            ),
          ),

          const MyNewMarkLabel(),
        ],
      ),
    );
  }

  @override
  ChooseSellingPlaceLocationViewModel viewModelBuilder(BuildContext context) =>
      ChooseSellingPlaceLocationViewModel();
}
