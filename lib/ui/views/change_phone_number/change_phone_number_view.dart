import 'package:flutter/material.dart';
import 'package:kreyno/services/validation_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/change_phone_number/change_phone_number_view.form.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:kreyno/ui/widgets/smart/phone_input_field/phone_input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'change_phone_number_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'phoneNumber',
      validator: ValidationService.phoneValidator,
    ),
  ],
)
class ChangePhoneNumberView extends StackedView<ChangePhoneNumberViewModel>
    with $ChangePhoneNumberView {
  const ChangePhoneNumberView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangePhoneNumberViewModel viewModel,
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
              CustomSliverAppBar(
                title: ChangePhoneNumberStrings.title,
                description: ChangePhoneNumberStrings.description,
                onBackPressed: viewModel.goBack,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      VGap(AppSpacing.px20),
                      PhoneInputField(
                        controller: phoneNumberController,
                        focusNode: phoneNumberFocusNode,
                        labelText: ChangePhoneNumberStrings.phoneNumber,
                        hintText: "",
                        onChanged: viewModel.onPhoneNumberChanged,
                        errorText: viewModel.hasPhoneNumber
                            ? viewModel.phoneNumberValidationMessage
                            : null,
                        maxLength: 9,
                        trailingIcon: viewModel.checkingPhoneNumberTaken
                            ? Transform.scale(
                                scale: .8,
                                child: CustomLoadingIndicator(
                                  size: AppSpacing.px1,
                                ),
                              )
                            : viewModel.phoneNumberAllowed
                            ? Icon(
                                Icons.check_circle,
                                color: AppColors.greenKre,
                                size: AppSpacing.px20,
                              )
                            : null,
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
                          text: ChangePhoneNumberStrings.buttonLabel,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            viewModel.onCtaTapped();
                          },
                          isDisabled:
                              viewModel.hasPhoneNumberValidationMessage ||
                              !viewModel.phoneNumberAllowed ||
                              !viewModel.hasPhoneNumber,
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
  void onViewModelReady(ChangePhoneNumberViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (phoneNumberFocusNode.canRequestFocus) {
        phoneNumberFocusNode.requestFocus();
      }
    });
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(ChangePhoneNumberViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  ChangePhoneNumberViewModel viewModelBuilder(BuildContext context) =>
      ChangePhoneNumberViewModel();
}
