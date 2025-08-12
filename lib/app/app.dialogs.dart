// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/delete_spot/delete_spot_dialog.dart';

enum DialogType { deleteSpot }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.deleteSpot: (context, request, completer) =>
        DeleteSpotDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
