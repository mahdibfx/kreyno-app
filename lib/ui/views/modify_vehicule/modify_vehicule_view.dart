import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_switch.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/license_plate_input_field.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_type_drop_down/vehicule_type_drop_down.dart';
import 'package:stacked/stacked.dart';

import 'modify_vehicule_viewmodel.dart';

class ModifyVehiculeView extends StackedView<ModifyVehiculeViewModel> {
  const ModifyVehiculeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ModifyVehiculeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(title: ""),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VGap(AppSpacing.px12),
                    const CustomText.largeTitle("Modifier ce véhicule"),
                    VGap(AppSpacing.px4),
                    const CustomText.smallParagraphMedium(
                      "Modifiez le type ou l’image de votre véhicule. ",
                      color: AppColors.textKre,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     CustomText.smallParagraphMedium(
                    //       SetUpVehiculeStrings.frenchLicensePlate,
                    //     ),
                    //     CustomSwitch(
                    //       value: viewModel.,
                    //       onChanged: (v) {
                    //         viewModel.changePlateType();
                    //       },
                    //     ),
                    //   ],
                    // ),
                    VGap(AppSpacing.px16),
                    const Divider(color: AppColors.strokeKre, height: .0),
                    VGap(AppSpacing.px24),
                    LicensePlateInputField(
                      frenchLicensePlate: true,
                      onLicensePlateChanged: (licensePlate) {},
                    ),
                    VGap(AppSpacing.px24),
                    CustomText.smallParagraphMedium(
                      SetUpVehiculeStrings.autoFill,
                      color: AppColors.textKre,
                      maxLines: 5,
                    ),
                    VGap(AppSpacing.px24),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSpacing.px16,
                      children: [
                        VehiculeTypeDropDown(
                          onChanged: (selectedVehicleType) {},
                        ),
                        const CustomText.smallParagraphMedium(
                          "Image de votre vehicule",
                          color: AppColors.textKre,
                        ),
                        ClipRRect(
                          child: DottedBorder(
                            radius: const Radius.circular(24),
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            dashPattern: const [9, 10],
                            color: AppColors.placeholderKre,
                            child: Container(
                              height: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: DottedBorder(
                                  padding: const EdgeInsets.all(18),
                                  dashPattern: const [9, 10],
                                  color: AppColors.placeholderKre,
                                  borderType: BorderType.Circle,
                                  child: const CustomIcon(
                                    iconPath: AppIcons.upload,
                                    size: 20,
                                    color: AppColors.placeholderKre,
                                  )),
                            ),
                          ),
                        ),
                        InputField(
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                          labelText: SetUpVehiculeStrings.vehicleBrand,
                          hintText:
                              SetUpVehiculeStrings.vehicleBrandPlaceholder,
                          keyboardType: TextInputType.name,
                        ),
                        InputField(
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                          labelText: SetUpVehiculeStrings.vehicleModel,
                          hintText:
                              SetUpVehiculeStrings.vehicleModelPlaceholder,
                          keyboardType: TextInputType.name,
                        ),
                        InputField(
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                          labelText: SetUpVehiculeStrings.color,
                          hintText: SetUpVehiculeStrings.colorPlaceholder,
                          keyboardType: TextInputType.name,
                        ),
                        InputField(
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                          labelText: SetUpVehiculeStrings.co2Emission,
                          hintText: SetUpVehiculeStrings.co2EmissionPlaceholder,
                          keyboardType: TextInputType.name,
                        ),
                      ],
                    ),
                    VGap(AppSpacing.px24),
                    const Divider(color: AppColors.strokeKre, height: .0),
                    VGap(AppSpacing.px24),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSpacing.px16,
                    right: AppSpacing.px16,
                    bottom: AppSpacing.px20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton.filled(
                        text: CommonStrings.continueLabel,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  ModifyVehiculeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ModifyVehiculeViewModel();
}
