import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/signup/signup_view.form.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/smart/phone_input_field/phone_input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'userName'),
  FormTextField(name: 'address'),
  FormTextField(name: 'birthday'),
])
class SignupView extends StackedView<SignupViewModel> with $SignupView {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            AuthSliverAppBar(
              title: SignupStrings.title,
              onBackPressed: viewModel.goBack,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: AppSpacing.px16,
                  children: [
                    PhoneInputField(
                      controller: phoneNumberController,
                      focusNode: phoneNumberFocusNode,
                      labelText: SignupStrings.phoneNumber,
                      hintText: SignupStrings.phoneNumberPlaceholder,
                      disabled: true,
                    ),
                    Row(
                      spacing: AppSpacing.px12,
                      children: [
                        Expanded(
                          child: InputField(
                            controller: firstNameController,
                            focusNode: firstNameFocusNode,
                            labelText: SignupStrings.firstName,
                            hintText: SignupStrings.firstNamePlaceholder,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            controller: lastNameController,
                            focusNode: lastNameFocusNode,
                            labelText: SignupStrings.lastName,
                            hintText: SignupStrings.lastNamePlaceholder,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                    InputField(
                      controller: userNameController,
                      focusNode: userNameFocusNode,
                      labelText: SignupStrings.userName,
                      hintText: SignupStrings.userNamePlaceholder,
                      keyboardType: TextInputType.name,
                    ),
                    InputField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      labelText: SignupStrings.email,
                      hintText: SignupStrings.emailPlaceholder,
                      keyboardType: TextInputType.name,
                    ),
                    InputField(
                      controller: addressController,
                      focusNode: addressFocusNode,
                      labelText: SignupStrings.address,
                      hintText: SignupStrings.addressPlaceholder,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                    // FIXME: This is a temporary input field for birthday until it's designed
                    InputField(
                      controller: birthdayController,
                      focusNode: birthdayFocusNode,
                      labelText: SignupStrings.birthday,
                      hintText: SignupStrings.birthday,
                      keyboardType: TextInputType.name,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: AppSpacing.px12 / 2,
                      children: [
                        CustomText.smallParagraphMedium(
                          SignupStrings.gender,
                          color: AppColors.textKre,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: LabeledCheckbox(
                                label: SignupStrings.male,
                                value: viewModel.isMale,
                                onChanged: (_) => viewModel.setIsMale(true),
                              ),
                            ),
                            Flexible(
                              child: LabeledCheckbox(
                                label: SignupStrings.female,
                                value: !viewModel.isMale,
                                onChanged: (_) => viewModel.setIsMale(false),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
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
                        onPressed: viewModel.showOtpSheet,
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
  void onViewModelReady(SignupViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SignupViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
