import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
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
  final String? initialCountryCode;
  final String? initialCountryDialCode;
  final Function({
    required String countryCode,
    required String countryDialCode,
    required String phoneNumber,
  })?
  onChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.hintText,
    this.errorText,
    this.maxLength,
    this.disabled = false,
    this.initialCountryCode,
    this.initialCountryDialCode,
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
      maxLength: maxLength,
      onChanged: (value) {
        viewModel.setPhoneNumber(value);
        onChanged?.call(
          countryDialCode: viewModel.countryDialCode,
          countryCode: viewModel.countryCode,
          phoneNumber: value,
        );
      },
      prefixWidget: GestureDetector(
        onTap: disabled ? null : viewModel.onCountryCodeTapped,
        child: Container(
          height: 46 * AppSpacing.px1,
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px12),
          decoration: BoxDecoration(
            color: errorText != null
                ? AppColors.borderError.withValues(alpha: .1)
                : (disabled ? AppColors.disabledKre : AppColors.white),
            borderRadius: BorderRadius.circular(AppSpacing.px12),
            border: Border.all(
              color: errorText != null ? AppColors.redKre : AppColors.strokeKre,
              width: 1.0,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: AppSpacing.px8,
              children: [
                CustomText.smallParagraphMedium(
                  '${viewModel.countryCode} ${viewModel.countryDialCode}',
                  color: disabled ? AppColors.textKre : AppColors.mainKre,
                ),
                CustomIcon(
                  iconPath: AppIcons.altArrowDown,
                  size: AppSpacing.px20,
                  color: disabled ? AppColors.textKre : AppColors.mainKre,
                ),
              ],
            ),
          ),
        ),
      ),
      errorText: errorText,
    );
  }

  @override
  PhoneInputFieldModel viewModelBuilder(BuildContext context) =>
      PhoneInputFieldModel();

  @override
  void onViewModelReady(PhoneInputFieldModel viewModel) {
    viewModel.initialize(
      onChanged,
      initialCountryCode: initialCountryCode,
      initialCountryDialCode: initialCountryDialCode,
    );
    super.onViewModelReady(viewModel);
  }
}
