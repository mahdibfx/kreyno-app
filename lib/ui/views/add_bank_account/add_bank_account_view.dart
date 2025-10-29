import 'package:flutter/material.dart';
import 'package:kreyno/services/validation_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/add_bank_account/add_bank_account_view.form.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_bank_account_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'lastName',
      validator: ValidationService.lastNameValidator,
    ),
    FormTextField(
      name: 'firstName',
      validator: ValidationService.firstNameValidator,
    ),
    FormTextField(name: 'email', validator: ValidationService.emailValidator),
    FormTextField(name: 'iban', validator: ValidationService.ibanValidator),
    FormTextField(
      name: 'confirmIban',
      validator: ValidationService.ibanValidator,
    ),
    FormTextField(name: 'city', validator: ValidationService.emptyValidator),
    FormTextField(name: 'region', validator: ValidationService.emptyValidator),
    FormTextField(name: 'country', validator: ValidationService.emptyValidator),
    FormTextField(name: 'address', validator: ValidationService.emptyValidator),
    FormTextField(
      name: 'postalCode',
      validator: ValidationService.emptyValidator,
    ),
  ],
)
class AddBankAccountView extends StackedView<AddBankAccountViewModel>
    with $AddBankAccountView {
  const AddBankAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddBankAccountViewModel viewModel,
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
                title: AddBankAccountStrings.title,
                description: AddBankAccountStrings.description,
                onBackPressed: viewModel.goBack,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VGap(AppSpacing.px20),
                      const CustomDivider(),
                      VGap(AppSpacing.px20),
                      if (viewModel.hasError) ...[
                        Container(
                          padding: EdgeInsets.all(10 * AppSpacing.px1),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.redKre.withValues(alpha: .05),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.px12,
                            ),
                          ),
                          child: CustomText.labelMedium(
                            viewModel.modelError ??
                                AddBankAccountStrings.errorOccurred,
                            maxLines: 20,
                            color: AppColors.redKre,
                            lineHeight: 1.7 * AppSpacing.px1,
                          ),
                        ),
                        VGap(AppSpacing.px20),
                      ],
                      CustomText.paragraph(
                        AddBankAccountStrings.accountDetails,
                        color: AppColors.mainKre,
                      ),
                      VGap(AppSpacing.px16),
                      Row(
                        spacing: AppSpacing.px12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InputField(
                              controller: lastNameController,
                              focusNode: lastNameFocusNode,
                              labelText: AddBankAccountStrings.lastName,
                              hintText:
                                  AddBankAccountStrings.lastNamePlaceholder,
                              keyboardType: TextInputType.name,
                              showOptionalLabel: false,
                              errorText: viewModel.hasLastName
                                  ? viewModel.lastNameValidationMessage
                                  : null,
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              controller: firstNameController,
                              focusNode: firstNameFocusNode,
                              labelText: AddBankAccountStrings.firstName,
                              hintText:
                                  AddBankAccountStrings.firstNamePlaceholder,
                              keyboardType: TextInputType.name,
                              showOptionalLabel: false,
                              errorText: viewModel.hasFirstName
                                  ? viewModel.firstNameValidationMessage
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      VGap(6 * AppSpacing.px1),
                      CustomText.labelMedium(
                        AddBankAccountStrings.accountHolderNameHint,
                        color: AppColors.textKre,
                        maxLines: 3,
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: ibanController,
                        focusNode: ibanFocusNode,
                        labelText: AddBankAccountStrings.iban,
                        hintText: AddBankAccountStrings.ibanPlaceholder,
                        keyboardType: TextInputType.name,
                        showOptionalLabel: false,
                        errorText: viewModel.hasIban
                            ? viewModel.ibanValidationMessage
                            : null,
                      ),
                      if ((viewModel.ibanValidationMessage?.trim().isEmpty ??
                              true) ||
                          !viewModel.hasIban) ...[
                        VGap(6 * AppSpacing.px1),
                        CustomText.labelMedium(
                          AddBankAccountStrings.ibanHint,
                          color: AppColors.textKre,
                          maxLines: 3,
                        ),
                      ],
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: confirmIbanController,
                        focusNode: confirmIbanFocusNode,
                        labelText: AddBankAccountStrings.confirmIban,
                        hintText: AddBankAccountStrings.confirmIbanPlaceholder,
                        keyboardType: TextInputType.name,
                        showOptionalLabel: false,
                        onChanged: viewModel.onConfirmIbanChanged,
                        errorText: viewModel.hasConfirmIban
                            ? viewModel.confirmIbanValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        labelText: AddBankAccountStrings.email,
                        hintText: AddBankAccountStrings.emailPlaceholder,
                        keyboardType: TextInputType.emailAddress,
                        showOptionalLabel: false,
                        errorText: viewModel.hasEmail
                            ? viewModel.emailValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px24),
                      CustomText.paragraph(
                        AddBankAccountStrings.accountHolderAddress,
                        color: AppColors.mainKre,
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: cityController,
                        focusNode: cityFocusNode,
                        labelText: AddBankAccountStrings.city,
                        hintText: AddBankAccountStrings.cityPlaceholder,
                        keyboardType: TextInputType.name,
                        showOptionalLabel: false,
                        errorText: viewModel.hasCity
                            ? viewModel.cityValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: regionController,
                        focusNode: regionFocusNode,
                        labelText: AddBankAccountStrings.region,
                        hintText: AddBankAccountStrings.regionPlaceholder,
                        keyboardType: TextInputType.name,
                        showOptionalLabel: false,
                        errorText: viewModel.hasRegion
                            ? viewModel.regionValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px16),
                      GestureDetector(
                        onTap: viewModel.onCountryTapped,
                        child: Container(
                          color: Colors.transparent,
                          child: IgnorePointer(
                            ignoring: true,
                            child: InputField(
                              controller: countryController,
                              focusNode: countryFocusNode,
                              labelText: AddBankAccountStrings.country,
                              hintText:
                                  AddBankAccountStrings.countryPlaceholder,
                              keyboardType: TextInputType.name,
                              showOptionalLabel: false,
                              trailingIcon: Transform.scale(
                                scale: .5,
                                alignment: Alignment.center,
                                child: const CustomIcon(
                                  iconPath: AppIcons.altArrowDown,
                                  color: AppColors.mainKre,
                                ),
                              ),
                              errorText: viewModel.hasCountry
                                  ? viewModel.countryValidationMessage
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: addressController,
                        focusNode: addressFocusNode,
                        labelText: AddBankAccountStrings.address,
                        hintText: AddBankAccountStrings.addressPlaceholder,
                        keyboardType: TextInputType.name,
                        showOptionalLabel: false,
                        errorText: viewModel.hasAddress
                            ? viewModel.addressValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: postalCodeController,
                        focusNode: postalCodeFocusNode,
                        labelText: AddBankAccountStrings.postalCode,
                        hintText: AddBankAccountStrings.postalCodePlaceholder,
                        keyboardType: TextInputType.name,
                        showOptionalLabel: false,
                        errorText: viewModel.hasPostalCode
                            ? viewModel.postalCodeValidationMessage
                            : null,
                      ),
                      VGap(AppSpacing.px4),
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
                          text: AddBankAccountStrings.validateButton,
                          onPressed: () {},
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
  void onViewModelReady(AddBankAccountViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initializeForm();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(AddBankAccountViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  AddBankAccountViewModel viewModelBuilder(BuildContext context) =>
      AddBankAccountViewModel();
}
