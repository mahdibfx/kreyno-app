import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:stacked/stacked.dart';

import 'phone_input_field_model.dart';

class PhoneInputField extends StackedView<PhoneInputFieldModel> {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final String hintText;
  final String? errorText;
  final int? maxLength;
  final bool disabled;
  final Function(String countryCode, String phoneNumber)? onChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.hintText,
    this.errorText,
    this.maxLength,
    this.disabled = false,
    this.onChanged,
  });

  @override
  Widget builder(
    BuildContext context,
    PhoneInputFieldModel viewModel,
    Widget? child,
  ) {
    return InputField(
      controller: controller,
      focusNode: focusNode,
      labelText: labelText,
      hintText: hintText,
      keyboardType: TextInputType.phone,
      disabled: disabled,
      onChanged: (value) {
        onChanged?.call(viewModel.countryCode, value);
      },
      prefixWidget: GestureDetector(
        onTap: viewModel.onCountryCodeTapped,
        child: Container(
          height: 46 * AppSpacing.px1,
          width: 60 * AppSpacing.px1,
          decoration: BoxDecoration(
            color: disabled ? AppColors.disabledFillKre : AppColors.white,
            borderRadius: BorderRadius.circular(AppSpacing.px12),
            border: Border.all(
              color: AppColors.strokeKre,
              width: 1.0,
            ),
          ),
          child: Center(
            child: Transform.translate(
              offset: Offset(-AppSpacing.px4 / 2, 0),
              child: CustomText.smallParagraphMedium(
                viewModel.countryCode,
                color: AppColors.mainKre,
              ),
            ),
          ),
        ),
      ),
      // disabled: true,
    );
  }

  @override
  PhoneInputFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      PhoneInputFieldModel();
}
