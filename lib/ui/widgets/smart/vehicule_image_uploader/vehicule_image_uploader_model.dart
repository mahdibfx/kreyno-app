import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/services/media_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VehiculeImageUploaderModel extends BaseViewModel {
  final _logger = getLogger('VehiculeImageUploaderModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();

  final Function(String uuid) onImageUploadSuccess;
  final Function(String errorMessage) onImageUploadFailure;
  final Function(bool isUploading) onImageUploading;
  final Function() onImageDeleteSuccess;
  final Function(String errorMessage) onImageDeleteFailure;

  VehiculeImageUploaderModel({
    required this.onImageUploadSuccess,
    required this.onImageUploadFailure,
    required this.onImageUploading,
    required this.onImageDeleteSuccess,
    required this.onImageDeleteFailure,
  });

  bool _isUploading = false;
  bool get isUploading => _isUploading;

  bool _isDeleting = false;
  bool get isDeleting => _isDeleting;

  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  String? _uploadedImageUuid;
  String? get uploadedImageUuid => _uploadedImageUuid;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setIsUploading(bool value) {
    _isUploading = value;
    onImageUploading(value);
    rebuildUi();
  }

  void setIsDeleting(bool value) {
    _isDeleting = value;
    rebuildUi();
  }

  void setPickedImage(File? value) {
    _pickedImage = value;
    rebuildUi();
  }

  void setUploadedImageUuid(String? value) {
    _uploadedImageUuid = value;
    rebuildUi();
  }

  void setErrorMessage(String? value) {
    _errorMessage = value;
    rebuildUi();
  }

  void showImagePickerSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.uploadVehiculeImage,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );
    if (response != null && response.confirmed) {
      _logger.i('Image picked: ${(response.data as File).path}');
      setPickedImage(response.data as File);
      _uploadImage();
    }
  }

  void _uploadImage() async {
    setIsUploading(true);
    final result = await _mediaService.uploadImage(pickedImage!);
    setIsUploading(false);
    result.match(
      (error) {
        setErrorMessage(error);
        onImageUploadFailure(error);
      },
      (data) {
        setUploadedImageUuid(data.uuid);
        onImageUploadSuccess(data.uuid);
      },
    );
  }

  void onDeleteImageTapped() async {
    setIsDeleting(true);
    final result = await _mediaService.removeImage(uploadedImageUuid!);
    setIsDeleting(false);
    result.match(
      (error) {
        setErrorMessage(error);
        onImageDeleteFailure(error);
      },
      (removed) {
        if (removed) {
          setUploadedImageUuid(null);
          setPickedImage(null);
          onImageDeleteSuccess();
        }
      },
    );
  }

  void onRetryUploadTapped() async {
    setErrorMessage(null);
    _uploadImage();
  }
}
