import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_filter_sheet_model.dart';

class HomeFilterSheet extends StackedView<HomeFilterSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const HomeFilterSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeFilterSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  HomeFilterSheetModel viewModelBuilder(BuildContext context) =>
      HomeFilterSheetModel();
}
