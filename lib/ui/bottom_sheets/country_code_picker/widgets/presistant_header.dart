import 'package:flutter/material.dart';
import 'package:kreyno/ui/bottom_sheets/country_code_picker/country_code_picker_sheet.form.dart';
import 'package:kreyno/ui/bottom_sheets/country_code_picker/country_code_picker_sheet_model.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';

class CountryCodePickerHeader
    extends ViewModelWidget<CountryCodePickerSheetModel>
    with $CountryCodePickerSheet {
  const CountryCodePickerHeader({super.key});

  @override
  Widget build(BuildContext context, CountryCodePickerSheetModel viewModel) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: PersistentHeaderDelegate(
        onBackPressed: viewModel.goBack,
        searchController: searchController,
        searchFocusNode: searchFocusNode,
        onSearch: viewModel.onSearch,
        onClearSearch: () => viewModel.clearSearch(searchController),
      ),
    );
  }
}

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback onBackPressed;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final Function(String) onSearch;
  final VoidCallback onClearSearch;

  PersistentHeaderDelegate({
    required this.onBackPressed,
    required this.searchController,
    required this.searchFocusNode,
    required this.onSearch,
    required this.onClearSearch,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.white,
      child: Column(
        spacing: AppSpacing.px16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.largeTitle(
                CountryCodePickerStrings.title,
                maxLines: 2,
              ),
              RoundedButton(
                iconPath: AppIcons.multiplicationSign,
                onPressed: onBackPressed,
              ),
            ],
          ),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: searchController,
            builder: (context, value, child) {
              return InputField(
                controller: searchController,
                focusNode: searchFocusNode,
                onChanged: onSearch,
                hintText: CountryCodePickerStrings.search,
                keyboardType: TextInputType.text,
                leadingIcon: Padding(
                  padding: EdgeInsets.only(
                    left: 14 * AppSpacing.px1,
                    right: AppSpacing.px8,
                  ),
                  child: CustomIcon(
                    iconPath: AppIcons.search,
                    color: AppColors.placeholderKre,
                    size: AppSpacing.px20,
                  ),
                ),
                trailingIcon: value.text.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(
                          right: 14 * AppSpacing.px1,
                          left: AppSpacing.px8,
                        ),
                        child: CustomIcon(
                          iconPath: AppIcons.multiplicationSign,
                          color: AppColors.placeholderKre,
                          size: AppSpacing.px20,
                        ),
                      )
                    : null,
                onTrailingIconTapped: value.text.isNotEmpty
                    ? onClearSearch
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }

  double get height => 116 * AppSpacing.px1;

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
