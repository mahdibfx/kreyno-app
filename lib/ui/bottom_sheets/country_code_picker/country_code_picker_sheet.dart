import 'package:flutter/material.dart';
import 'package:kreyno/ui/bottom_sheets/country_code_picker/country_code_picker_sheet.form.dart';
import 'package:kreyno/ui/bottom_sheets/country_code_picker/widgets/empty_state.dart';
import 'package:kreyno/ui/bottom_sheets/country_code_picker/widgets/presistant_header.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'country_code_picker_sheet_model.dart';
import 'widgets/grouped_countries_list.dart';

@FormView(fields: [FormTextField(name: 'search')])
class CountryCodePickerSheet extends StackedView<CountryCodePickerSheetModel>
    with $CountryCodePickerSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CountryCodePickerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CountryCodePickerSheetModel viewModel,
    Widget? child,
  ) {
    final showPhoneCode = request.data as bool? ?? true;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: AppSpacing.px20),
          child: BottomSheetLayout(
            showDragHandler: false,
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.px24,
              horizontal: AppSpacing.px16,
            ),
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    const CountryCodePickerHeader(),
                    SliverPadding(
                      padding: EdgeInsets.only(
                        left: AppSpacing.px4,
                        right: AppSpacing.px4,
                        top: 2 * AppSpacing.px1,
                      ),
                      sliver:
                          viewModel.searchQuery.isNotEmpty &&
                              viewModel.filteredCountries.isEmpty
                          ? const CountryCodePickerEmptyState()
                          : GroupedCountriesList(
                              completer: completer,
                              showPhoneCode: showPhoneCode,
                            ),
                    ),
                    SliverToBoxAdapter(child: VGap(AppSpacing.px16)),
                  ],
                ),
                // Alphabet list on the right
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(CountryCodePickerSheetModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (searchFocusNode.canRequestFocus) {
        searchFocusNode.requestFocus();
      }
    });
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CountryCodePickerSheetModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  CountryCodePickerSheetModel viewModelBuilder(BuildContext context) =>
      CountryCodePickerSheetModel();
}
