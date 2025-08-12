import 'package:flutter/material.dart';
import 'package:kreyno/services/validation_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/signin/signin_view.form.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/smart/phone_input_field/phone_input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signin_viewmodel.dart';

@FormView(fields: [
  FormTextField(
      name: 'phoneNumber', validator: ValidationService.phoneValidator),
])
class SigninView extends StackedView<SigninViewModel> with $SigninView {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            AuthSliverAppBar(
              title: SigninStrings.title,
              description: SigninStrings.description,
              onBackPressed: viewModel.goBack,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    PhoneInputField(
                      controller: phoneNumberController,
                      focusNode: phoneNumberFocusNode,
                      labelText: SigninStrings.phoneNumber,
                      hintText: SigninStrings.phoneNumberPlaceholder,
                      onChanged: viewModel.onPhoneNumberChanged,
                      errorText: viewModel.hasPhoneNumber
                          ? viewModel.phoneNumberValidationMessage
                          : null,
                      maxLength: 10,
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
                        text: SigninStrings.buttonLabel,
                        onPressed: viewModel.showOtpSheet,
                        isDisabled: viewModel.hasPhoneNumberValidationMessage,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SigninViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (phoneNumberFocusNode.canRequestFocus) {
        phoneNumberFocusNode.requestFocus();
      }
    });
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SigninViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  SigninViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SigninViewModel();
}
