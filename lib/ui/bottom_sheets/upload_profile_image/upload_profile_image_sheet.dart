import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'upload_profile_image_sheet_model.dart';

class UploadProfileImageSheet
    extends StackedView<UploadProfileImageSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const UploadProfileImageSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadProfileImageSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      showDragHandler: false,
      padding: EdgeInsets.only(
        top: AppSpacing.px16,
        bottom: AppSpacing.px12,
        left: AppSpacing.px16,
        right: AppSpacing.px16,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
  void onViewModelReady(UploadProfileImageSheetModel viewModel) {
    viewModel.setCompleter(completer);
    super.onViewModelReady(viewModel);
  }

  @override
  UploadProfileImageSheetModel viewModelBuilder(BuildContext context) =>
      UploadProfileImageSheetModel();
}
