import 'package:flutter/material.dart';
import 'package:kreyno/ui/bottom_sheets/country_code_picker/country_code_picker_sheet_model.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class CountryCodePickerEmptyState
    extends ViewModelWidget<CountryCodePickerSheetModel> {
  const CountryCodePickerEmptyState({super.key});

  @override
  Widget build(BuildContext context, CountryCodePickerSheetModel viewModel) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.px12,
            vertical: AppSpacing.px32,
          ),
          child: Column(
            children: [
              CustomText.paragraph(
                CountryCodePickerStrings.noCountriesFound,
                color: AppColors.placeholderKre,
              ),
              VGap(AppSpacing.px8),
              CustomText.smallParagraphMedium(
                CountryCodePickerStrings.trySearchingWithDifferentTerm,
                color: AppColors.placeholderKre,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
