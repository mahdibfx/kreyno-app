import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'choose_picture_source_sheet_model.dart';

class ChoosePictureSourceSheet
    extends StackedView<ChoosePictureSourceSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ChoosePictureSourceSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChoosePictureSourceSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      body: Column(
        children: [
          CustomButton.outlined(
            icon: AppIcons.camera,
            text: "Prendre une photo",
            onPressed: () {
              completer!(SheetResponse(confirmed: true, data: "camera"));
            },
          ),
          VGap(AppSpacing.px8),
          CustomButton.outlined(
            icon: AppIcons.image,
            text: "Choisir depuis la gallerie",
            onPressed: () {
              completer!(SheetResponse(confirmed: true, data: "gallery"));
            },
          ),
        ],
      ),
    );
  }

  @override
  ChoosePictureSourceSheetModel viewModelBuilder(BuildContext context) =>
      ChoosePictureSourceSheetModel();
}
