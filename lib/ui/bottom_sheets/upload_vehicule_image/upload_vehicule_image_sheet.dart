import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'upload_vehicule_image_sheet_model.dart';

class UploadVehiculeImageSheet
    extends StackedView<UploadVehiculeImageSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const UploadVehiculeImageSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  void onViewModelReady(UploadVehiculeImageSheetModel viewModel) {
    viewModel.setCompleter(completer);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    UploadVehiculeImageSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: PickVehiculeImageStrings.hintTitle,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.mainKre,
              ),
              children: [
                TextSpan(
                  text: PickVehiculeImageStrings.hintDescription,
                  style: AppTypography.labelRegular.copyWith(
                    color: AppColors.textKre,
                  ),
                ),
              ],
            ),
          ),
          VGap(AppSpacing.px12),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: double.infinity,
                height: 150 * AppSpacing.px1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.px12),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.carSample),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: AppSpacing.px4,
                  bottom: AppSpacing.px4,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.px8,
                  vertical: 6 * AppSpacing.px1,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.px8),
                ),
                child: CustomText.labelMedium(
                  PickVehiculeImageStrings.recommendedImage,
                ),
              ),
            ],
          ),
          VGap(AppSpacing.px24),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText.largeTitle(
                  PickVehiculeImageStrings.title,
                  color: AppColors.mainKre,
                ),
                VGap(4 * AppSpacing.px1),
                CustomText.smallParagraphMedium(
                  PickVehiculeImageStrings.description,
                  color: AppColors.textKre,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          VGap(AppSpacing.px20),
          CustomButton.outlined(
            icon: AppIcons.camera,
            text: CommonStrings.takePicture,
            onPressed: () => viewModel.pickImage(fromGallery: false),
          ),
          VGap(AppSpacing.px8),
          CustomButton.outlined(
            icon: AppIcons.image,
            text: CommonStrings.pickFromGallery,
            onPressed: () => viewModel.pickImage(fromGallery: true),
          ),
          VGap(AppSpacing.px12),
        ],
      ),
    );
  }

  @override
  UploadVehiculeImageSheetModel viewModelBuilder(BuildContext context) =>
      UploadVehiculeImageSheetModel();
}
