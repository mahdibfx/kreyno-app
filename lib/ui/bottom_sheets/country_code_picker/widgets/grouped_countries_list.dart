import 'package:flutter/material.dart';
import 'package:kreyno/ui/bottom_sheets/country_code_picker/country_code_picker_sheet_model.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupedCountriesList
    extends ViewModelWidget<CountryCodePickerSheetModel> {
  final Function(SheetResponse response)? completer;
  const GroupedCountriesList({super.key, required this.completer});

  @override
  Widget build(BuildContext context, CountryCodePickerSheetModel viewModel) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final alphabetHeaders = viewModel.alphabetHeaders;
        int currentIndex = 0;

        for (int i = 0; i < alphabetHeaders.length; i++) {
          final letter = alphabetHeaders[i];
          final countries = viewModel.groupedCountries[letter]!;

          // Add header
          if (currentIndex == index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i > 0) VGap(AppSpacing.px16),
                CustomText.title(letter, color: AppColors.mainKre),
                VGap(AppSpacing.px20),
              ],
            );
          }
          currentIndex++;

          // Add countries for this letter
          for (int j = 0; j < countries.length; j++) {
            if (currentIndex == index) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.px20),
                child: GestureDetector(
                  onTap: () {
                    completer?.call(
                      SheetResponse(
                        confirmed: true,
                        data: (countries[j].dialCode, countries[j].code),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.px1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSpacing.px20,
                      children: [
                        Expanded(
                          child: Row(
                            spacing: AppSpacing.px12,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText.paragraph(
                                countries[j].flag,
                                color: AppColors.mainKre,
                                maxLines: 2,
                              ),
                              Flexible(
                                child: CustomText.smallParagraphMedium(
                                  countries[j].name,
                                  color: AppColors.mainKre,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomText.smallParagraphMedium(
                          countries[j].dialCode,
                          color: AppColors.mainKre,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            currentIndex++;
          }
        }

        return null;
      }, childCount: viewModel.totalItemCount),
    );
  }
}
