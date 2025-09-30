import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class LicensePlateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text
        .replaceAll(RegExp(r'[^A-Za-z0-9]'), '')
        .toUpperCase();

    if (text.length > 7) {
      text = text.substring(0, 7);
    }

    String formatted = '';

    for (int i = 0; i < text.length; i++) {
      if (i == 2 || i == 5) {
        formatted += ' - ';
      }
      formatted += text[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class LicensePlateInputField extends StatelessWidget {
  final bool frenchLicensePlate;
  final Function(String) onLicensePlateCompleted;
  final Function(String)? onSubmit;
  final String? errorText;
  final TextEditingController? controller;

  const LicensePlateInputField({
    super.key,
    this.frenchLicensePlate = true,
    required this.onLicensePlateCompleted,
    this.onSubmit,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: AppSpacing.px16),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(AppSpacing.px12),
            border: Border.all(color: AppColors.strokeKre),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.px8,
            children: [
              CustomText.smallParagraphMedium(
                SetUpVehiculeStrings.licensePlate,
                color: AppColors.textKre,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                padding: EdgeInsets.all(2 * AppSpacing.px1),
                height: 54 * AppSpacing.px1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.px8),
                  border: Border.all(color: const Color(0xFFB5B5B5), width: .5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0C0A1C).withValues(alpha: .1),
                      blurRadius: AppSpacing.px20,
                      offset: Offset(0, 5 * AppSpacing.px1),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6 * AppSpacing.px1),
                    border: Border.all(color: AppColors.mainKre, width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4 * AppSpacing.px1),
                          bottomLeft: Radius.circular(4 * AppSpacing.px1),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 22 * AppSpacing.px1,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            color: frenchLicensePlate
                                ? const Color(0xFF1E46AA)
                                : AppColors.mainKre,
                          ),
                          child: AnimatedOpacity(
                            opacity: frenchLicensePlate ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Transform.translate(
                              offset: Offset(0, -AppSpacing.px1),
                              child: Transform.scale(
                                scale: .93,
                                child: Image.asset(AppImages.franceEuro),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.center,
                          cursorColor: AppColors.greenKre,
                          cursorHeight: AppSpacing.px24,
                          onSubmitted: onSubmit,
                          onChanged: (value) {
                            final licensePlate = value.replaceAll(' - ', '');
                            if (licensePlate.length == 7) {
                              FocusScope.of(context).unfocus();
                              onLicensePlateCompleted(licensePlate);
                            }
                          },
                          inputFormatters: [LicensePlateFormatter()],
                          style: AppTypography.largeTitle.copyWith(
                            color: AppColors.mainKre,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText:
                                SetUpVehiculeStrings.licensePlatePlaceholder,
                            hintStyle: AppTypography.largeTitle.copyWith(
                              color: AppColors.placeholderKre,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (errorText != null) ...[
          VGap(AppSpacing.px8),
          CustomText.labelMedium(
            errorText!,
            color: AppColors.redKre,
            maxLines: 3,
          ),
        ],
      ],
    );
  }
}
