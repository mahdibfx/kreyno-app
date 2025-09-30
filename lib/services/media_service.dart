import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/upload_media_response.dart';
import 'package:kreyno/services/api/api_media_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class MediaService {
  final _logger = getLogger('MediaService');
  final _apiMediaService = ApiMediaService(locator<DioService>().dio);
  final ImagePicker _picker = ImagePicker();

  Future<Either<String, File?>> getLocalImage({
    required bool fromGallery,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 50,
      );

      return right(pickedFile != null ? File(pickedFile.path) : null);
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

  Future<Either<String, bool>> deleteImage(String uuid) async {
    return _apiMediaService
        .deleteUpload(uuid)
        .toEither()
        .then((result) => result.map((response) => response.isEmpty));
  }
}
