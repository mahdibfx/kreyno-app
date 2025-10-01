// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/destructive/destructive_dialog.dart';

enum DialogType { destructive }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.destructive: (context, request, completer) =>
        DestructiveDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
