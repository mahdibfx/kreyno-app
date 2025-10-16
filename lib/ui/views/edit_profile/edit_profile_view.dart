import 'package:flutter/material.dart';
import 'package:kreyno/services/validation_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/edit_profile/edit_profile_view.form.dart';
import 'package:kreyno/ui/views/edit_profile/widgets/profile_image_updater/profile_image_updater.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:kreyno/ui/widgets/smart/date_picker_field/birth_date_picker_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_profile_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'firstName',
      validator: ValidationService.firstNameValidator,
    ),
    FormTextField(
      name: 'lastName',
      validator: ValidationService.lastNameValidator,
    ),
    FormTextField(name: 'email', validator: ValidationService.emailValidator),
    FormTextField(
      name: 'userName',
      validator: ValidationService.emptyValidator,
    ),
  ],
)
class EditProfileView extends StackedView<EditProfileViewModel>
    with $EditProfileView {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel,
    Widget? child,
  ) {
    print('hasChanges: ${viewModel.hasChanges}');
    print('isFormValid: ${viewModel.isFormValid}');
    return LoadingOverlay(
      isShown: viewModel.isBusy,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: CustomScrollView(
            slivers: [
              CustomSliverAppBar.shrunk(
                title: "Informations personnelles",
                onBackPressed: viewModel.goBack,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // spacing: AppSpacing.px16,
                    children: [
                      VGap(AppSpacing.px20),
                      const ProfileImageUpdater(),
                      VGap(AppSpacing.px24),
                      InputField(
                        controller: userNameController,
                        focusNode: userNameFocusNode,
                        labelText: SignupStrings.userName,
                        hintText: SignupStrings.userNamePlaceholder,
                        keyboardType: TextInputType.name,
                        disabled: true,
                        showOptionalLabel: false,
                        isRequired: false,
                        errorText: viewModel.hasUserName
                            ? viewModel.userNameValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px16),
                      Row(
                        spacing: AppSpacing.px12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InputField(
                              showOptionalLabel: false,
                              isRequired: false,
                              controller: firstNameController,
                              focusNode: firstNameFocusNode,
                              labelText: SignupStrings.firstName,
                              hintText: SignupStrings.firstNamePlaceholder,
                              keyboardType: TextInputType.name,
                              errorText: viewModel.hasFirstName
                                  ? viewModel.firstNameValidationMessage
                                  : null,
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              showOptionalLabel: false,
                              isRequired: false,
                              controller: lastNameController,
                              focusNode: lastNameFocusNode,
                              labelText: SignupStrings.lastName,
                              hintText: SignupStrings.lastNamePlaceholder,
                              keyboardType: TextInputType.name,
                              errorText: viewModel.hasLastName
                                  ? viewModel.lastNameValidationMessage
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        showOptionalLabel: false,
                        isRequired: false,
                        controller: emailController,
                        focusNode: emailFocusNode,
                        labelText: SignupStrings.email,
                        hintText: SignupStrings.emailPlaceholder,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: viewModel.onEmailChanged,
                        trailingIcon: viewModel.checkingEmailTaken
                            ? Transform.scale(
                                scale: .8,
                                child: CustomLoadingIndicator(
                                  size: AppSpacing.px1,
                                ),
                              )
                            : viewModel.emailAllowed
                            ? Icon(
                                Icons.check_circle,
                                color: AppColors.greenKre,
                                size: AppSpacing.px20,
                              )
                            : null,
                        errorText: viewModel.hasEmail
                            ? viewModel.emailValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px16),
                      BirthDatePickerField(
                        labelText: SignupStrings.birthday,
                        onBirthdayChanged: viewModel.onBirthdayChanged,
                        initialDate: viewModel.currentUser?.birthDate,
                      ),
                      VGap(AppSpacing.px16),
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
                          text: 'Enregistrer les modifications',
                          onPressed: viewModel.saveProfile,
                          isDisabled:
                              !viewModel.isFormValid || !viewModel.hasChanges,
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
  void onViewModelReady(EditProfileViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = viewModel.currentUser;
      if (user != null) {
        firstNameController.text = user.firstName;
        lastNameController.text = user.lastName;
        userNameController.text = user.username;
        emailController.text = user.email;
      }
      viewModel.initializeForm();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(EditProfileViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  EditProfileViewModel viewModelBuilder(BuildContext context) =>
      EditProfileViewModel();
}
