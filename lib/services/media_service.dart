import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/upload_media_response.dart';
import 'package:kreyno/services/api/api_media_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';

class MediaService {
  final _logger = getLogger('MediaService');
  final _apiMediaService = ApiMediaService(locator<DioService>().dio);
  final ImagePicker _picker = ImagePicker();

  static const List<String> _acceptedFormats = ['PNG', 'JPG', 'JPEG', 'HEIC'];
  static const int _maxSize = 5 * 1024 * 1024; // 5MB

  Future<Either<String, File?>> getLocalImage({
    required bool fromGallery,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 50,
      );

      if (pickedFile == null) {
        return right(null);
      }

      final imageFile = File(pickedFile.path);

      final validationResult = _validateImage(imageFile);
      return validationResult.fold(
        (error) => left(error),
        (_) => right(imageFile),
      );
    } catch (e) {
      _logger.e('Failed to pick image: ${e.toString()}');
      return left('Failed to pick image: ${e.toString()}');
    }
  }

  Future<Either<String, UploadMediaResponse>> uploadImage(File image) async {
    return _apiMediaService.uploadFile(image).toEither();
  }

  Future<Either<String, bool>> removeImage(String uuid) async {
    return _apiMediaService
        .removeUpload(uuid)
        .toEither()
        .then((result) => result.map((response) => response.isEmpty));
  }

  Future<Either<String, bool>> deleteImage(int id) async {
    return _apiMediaService
        .deleteUpload(id)
        .toEither()
        .then((result) => result.map((response) => response.isEmpty));
  }

  Either<String, bool> _validateImage(File imageFile) {
    try {
      if (!imageFile.existsSync()) {
        return left(PickVehiculeImageStrings.fileDoesNotExist);
      }

      final fileSize = imageFile.lengthSync();

      if (fileSize > _maxSize) {
        return left(PickVehiculeImageStrings.fileSizeExceedsMaximumAllowedSize);
      }

      final fileName = imageFile.path.split('/').last.toLowerCase();
      final fileExtension = fileName.split('.').last;

      if (!_acceptedFormats.any(
        (format) => format.toLowerCase() == fileExtension,
      )) {
        return left(PickVehiculeImageStrings.fileFormatNotSupported);
      }

      return right(true);
    } catch (e) {
      _logger.e('Error validating image: ${e.toString()}');
      return left('Error validating image: ${e.toString()}');
    }
  }
}
