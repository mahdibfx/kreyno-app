import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/signin/signin_view.form.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signin_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber'),
])
class SigninView extends StackedView<SigninViewModel> with $SigninView {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
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
                  InputField(
                    controller: phoneNumberController,
                    focusNode: phoneNumberFocusNode,
                    labelText: SigninStrings.phoneNumber,
                    hintText: SigninStrings.phoneNumberPlaceholder,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {},
                    prefixWidget: Container(
                      height: 46,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppSpacing.px12),
                        border: Border.all(
                          color: AppColors.strokeKre,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Transform.translate(
                          offset: Offset(-AppSpacing.px4 / 2, 0),
                          child: const CustomText.smallParagraphMedium(
                            '+33',
                            color: AppColors.mainKre,
                          ),
                        ),
                      ),
                    ),
                    // disabled: true,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(SigninViewModel viewModel) {
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
