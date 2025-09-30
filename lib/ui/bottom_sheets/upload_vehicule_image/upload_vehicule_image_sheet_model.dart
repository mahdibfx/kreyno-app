import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/services/media_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadVehiculeImageSheetModel extends BaseViewModel {
  final _logger = getLogger('UploadVehiculeImageSheetModel');
  final _mediaService = locator<MediaService>();
  final _toastService = locator<ToastService>();

  late final Function(SheetResponse)? completer;

  void setCompleter(Function(SheetResponse)? completerFn) {
    completer = completerFn;
  }

  Future<void> pickImage({required bool fromGallery}) async {
    final result = await _mediaService.getLocalImage(fromGallery: fromGallery);

    result.fold(
      (error) {
        _logger.e('Failed to pick image: $error');
        _toastService.showError(title: error);
      },
      (image) {
        if (image != null) {
          completer?.call(SheetResponse(confirmed: true, data: image));
        }
      },
    );
  }
}
