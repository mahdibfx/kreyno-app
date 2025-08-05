import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class DropDownField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuEntry<T>> items;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Function(T?)? onChanged;
  final bool disabled;
  final FocusNode? focusNode;
  final bool isReadOnly;
  final Widget? leadingWidget;

  const DropDownField({
    super.key,
    this.value,
    required this.items,
    this.labelText,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.disabled = false,
    this.focusNode,
    this.isReadOnly = true,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.px12 / 2,
      children: [
        if (labelText != null)
          CustomText.smallParagraphMedium(
            labelText!,
            color: AppColors.textKre,
          ),
        DropdownMenu<T>(
          initialSelection: value,
          dropdownMenuEntries: items,
          onSelected: disabled ? null : onChanged,
          requestFocusOnTap: !isReadOnly,
          enableFilter: false,
          enableSearch: false,
          enabled: !disabled,
          hintText: hintText,
          errorText: errorText,
          width: double.maxFinite,
          leadingIcon: leadingWidget,
          trailingIcon: CustomIcon(
            iconPath: AppIcons.altArrowDown,
            size: AppSpacing.px20,
            color: AppColors.mainKre,
          ),
          selectedTrailingIcon: RotatedBox(
            quarterTurns: 2,
            child: CustomIcon(
              iconPath: AppIcons.altArrowDown,
              size: AppSpacing.px20,
              color: AppColors.mainKre,
            ),
          ),
          textStyle: AppTypography.smallParagraphMedium.copyWith(
            color: AppColors.mainKre,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            isCollapsed: true,
            fillColor: disabled ? AppColors.disabledFillKre : AppColors.white,
            hintStyle: AppTypography.smallParagraphMedium.copyWith(
              color: AppColors.placeholderKre,
            ),
            errorStyle: AppTypography.labelRegular.copyWith(
              color: AppColors.redKre,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.px16,
              vertical: AppSpacing.px12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.strokeKre,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.strokeKre,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.greenKre,
                width: 1.2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.redKre,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.redKre,
                width: 1.2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.strokeKre,
                width: 1.0,
              ),
            ),
          ),
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.white),
            elevation: WidgetStateProperty.all(5),
            shadowColor:
                WidgetStateProperty.all(Colors.black.withValues(alpha: 0.3)),
            side: WidgetStateProperty.all(
              const BorderSide(
                color: AppColors.strokeKre,
                width: 1.0,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.px12),
              ),
            ),
            maximumSize: WidgetStateProperty.all(
              Size(100.dw - AppSpacing.px32, 200 * AppSpacing.px1),
            ),
          ),
          alignmentOffset: Offset(0, AppSpacing.px4),
        ),
      ],
    );
  }
}
