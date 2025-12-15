import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/car.dart' hide Image;
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'expand_vehicule_info_viewmodel.dart';

class ExpandVehiculeInfoView extends StackedView<ExpandVehiculeInfoViewModel> {
  const ExpandVehiculeInfoView({
    Key? key,
    required this.brand,
    required this.model,
    required this.image,
    required this.color,
  }) : super(key: key);
  final String brand;
  final String model;
  final String image;
  final String color;

  @override
  Widget builder(
    BuildContext context,
    ExpandVehiculeInfoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            locator<NavigationService>().back();
          },
          icon: const CustomIcon(iconPath: AppIcons.arrowLeft),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VGap(AppSpacing.px12),

                CustomText.largeTitle("$brand $model"),
                VGap(AppSpacing.px4),

                CustomText.smallParagraphMedium(
                  color,
                  color: AppColors.textKre,
                ),
                VGap(AppSpacing.px16),
              ],
            ),
          ),
          Expanded(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Image.asset("assets/images/car_default.png");
              },
              width: double.infinity,
              height: double.infinity,
              imageUrl: image,
            ),
          ),
        ],
      ),
    );
  }

  @override
  ExpandVehiculeInfoViewModel viewModelBuilder(BuildContext context) =>
      ExpandVehiculeInfoViewModel();
}
