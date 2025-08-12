import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'profile_sheet_model.dart';

class ProfileSheet extends StackedView<ProfileSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ProfileSheet({Key? key, required this.completer, required this.request})
    : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  ProfileSheetModel viewModelBuilder(BuildContext context) =>
      ProfileSheetModel();
}
