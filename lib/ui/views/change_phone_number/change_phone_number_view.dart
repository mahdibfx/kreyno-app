import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/change_phone_number/change_phone_number_view.form.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:kreyno/ui/widgets/smart/phone_input_field/phone_input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'change_phone_number_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber'),
])
class ChangePhoneNumberView extends StackedView<ChangePhoneNumberViewModel>
    with $ChangePhoneNumberView {
  const ChangePhoneNumberView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangePhoneNumberViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: MyAppBar(title: "Changer mon numéro"),
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText.largeTitle("Changer mon numéro"),
                    SizedBox(height: AppSpacing.px4),
                    const CustomText.smallParagraphMedium(
                      "Pour changer votre numéro de téléphone, un code OTP de vérification vous sera envoyé.",
                      maxLines: 2,
                      color: AppColors.textKre,
                    ),
                    SizedBox(
                      height: AppSpacing.px20,
                    )
                  ],
                ),
              ),
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
                      onChanged: (countryCode, phoneNumber) {},
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
      ),
    );
  }

  @override
  ChangePhoneNumberViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePhoneNumberViewModel();
}
