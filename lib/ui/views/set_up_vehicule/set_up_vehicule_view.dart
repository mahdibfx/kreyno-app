import 'package:flutter/material.dart';
import 'package:kreyno/services/validation_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/set_up_vehicule/set_up_vehicule_view.form.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_switch.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/license_plate_input_field.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/vehicule_image_uploader.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_type_drop_down/vehicule_type_drop_down.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'set_up_vehicule_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'brand',
      validator: ValidationService.vehiculeBrandValidator,
    ),
    FormTextField(
      name: 'model',
      validator: ValidationService.vehiculeModelValidator,
    ),
    FormTextField(
      name: 'color',
      validator: ValidationService.vehiculeColorValidator,
    ),
    FormTextField(
      name: 'co2Emission',
      validator: ValidationService.vehiculeCo2EmissionValidator,
    ),
  ],
)
class SetUpVehiculeView extends StackedView<SetUpVehiculeViewModel>
    with $SetUpVehiculeView {
  const SetUpVehiculeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SetUpVehiculeViewModel viewModel,
    Widget? child,
  ) {
    return LoadingOverlay(
      isShown: viewModel.isBusy,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: CustomScrollView(
            slivers: [
              AuthSliverAppBar(
                title: SetUpVehiculeStrings.title,
                description: SetUpVehiculeStrings.description,
                onBackPressed: viewModel.goBack,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText.smallParagraphMedium(
                            SetUpVehiculeStrings.frenchLicensePlate,
                          ),
                          CustomSwitch(
                            value: viewModel.isFrenchLicensePlate,
                            onChanged: viewModel.setIsFrenchLicensePlate,
                          ),
                        ],
                      ),
                      VGap(AppSpacing.px16),
                      const Divider(color: AppColors.strokeKre, height: .0),
                      VGap(AppSpacing.px24),
                      LicensePlateInputField(
                        controller: viewModel.licensePlateController,
                        frenchLicensePlate: viewModel.isFrenchLicensePlate,
                        errorText: viewModel.licensePlateError,
                        onLicensePlateCompleted:
                            viewModel.onLicensePlateCompleted,
                      ),
                      if (viewModel.isFrenchLicensePlate) ...[
                        VGap(AppSpacing.px24),
                        CustomText.smallParagraphMedium(
                          SetUpVehiculeStrings.autoFill,
                          color: AppColors.textKre,
                          maxLines: 5,
                        ),
                      ],
                      VGap(AppSpacing.px24),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppSpacing.px16,
                        children: [
                          VehiculeTypeDropDown(
                            onChanged: viewModel.setVehicleType,
                          ),
                          InputField(
                            controller: brandController,
                            focusNode: brandFocusNode,
                            labelText: SetUpVehiculeStrings.vehicleBrand,
                            hintText:
                                SetUpVehiculeStrings.vehicleBrandPlaceholder,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            errorText: viewModel.hasBrand
                                ? viewModel.brandValidationMessage
                                : null,
                          ),
                          InputField(
                            controller: modelController,
                            focusNode: modelFocusNode,
                            labelText: SetUpVehiculeStrings.vehicleModel,
                            hintText:
                                SetUpVehiculeStrings.vehicleModelPlaceholder,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            errorText: viewModel.hasModel
                                ? viewModel.modelValidationMessage
                                : null,
                          ),
                          InputField(
                            controller: colorController,
                            focusNode: colorFocusNode,
                            labelText: SetUpVehiculeStrings.color,
                            hintText: SetUpVehiculeStrings.colorPlaceholder,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            errorText: viewModel.hasColor
                                ? viewModel.colorValidationMessage
                                : null,
                          ),
                          InputField(
                            controller: co2EmissionController,
                            focusNode: co2EmissionFocusNode,
                            labelText: SetUpVehiculeStrings.co2Emission,
                            hintText:
                                SetUpVehiculeStrings.co2EmissionPlaceholder,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            errorText: viewModel.hasCo2Emission
                                ? viewModel.co2EmissionValidationMessage
                                : null,
                          ),
                        ],
                      ),
                      VGap(AppSpacing.px24),
                      const Divider(color: AppColors.strokeKre, height: .0),
                      VGap(AppSpacing.px24),
                      VehiculeImageUploader(
                        onImageUploadSuccess: viewModel.onImageUploadSuccess,
                        onImageUploadFailure: viewModel.onImageUploadFailure,
                        onImageUploading: viewModel.onImageUploading,
                        onImageDeleteSuccess: viewModel.onImageDeleteSuccess,
                        onImageDeleteFailure: viewModel.onImageDeleteFailure,
                      ),
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
                          onPressed: viewModel.onContinueTapped,
                          isDisabled: !viewModel.isFormValid,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SetUpVehiculeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SetUpVehiculeViewModel viewModel) {
    disposeForm();
    viewModel.licensePlateController.dispose();
    super.onDispose(viewModel);
  }

  @override
  SetUpVehiculeViewModel viewModelBuilder(BuildContext context) =>
      SetUpVehiculeViewModel();
}
