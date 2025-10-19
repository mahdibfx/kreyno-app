import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileImageUpdaterModel extends ReactiveViewModel {
  final _logger = getLogger('ProfileImageUpdaterModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _toastService = locator<ToastService>();

  Avatar? get currentAvatar => _userService.currentUser?.avatar;

  void onAddProfileImageTapped() async {
    await _showImagePickerSheet();
  }

  void onChangeProfileImageTapped() async {
    await _showImagePickerSheet();
  }

  Future<void> _showImagePickerSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.uploadProfileImage,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );
    if (response != null && response.confirmed) {
      _logger.i('Image picked: ${(response.data as File).path}');
      _uploadImage(response.data as File);
    }
  }

  void _uploadImage(File image) async {
    setBusy(true);
    try {
      final result = await _userService.updateProfileImage(image);
      result.match(
        (error) {
          _logger.e('Error updating profile image: $error');
          _toastService.showError(title: error);
        },
        (success) {
          _logger.i('Profile image updated successfully');
          _toastService.showSuccess(
            title: 'Image de profil mise à jour avec succès',
          );
        },
      );
    } finally {
      setBusy(false);
    }
  }

  void onDeleteProfileImageTapped() async {
    setBusy(true);
    try {
      final result = await _userService.deleteProfileImage();
      result.match(
        (error) {
          _logger.e('Error deleting profile image: $error');
          _toastService.showError(title: error);
        },
        (success) {
          _logger.i('Profile image deleted successfully');
          _toastService.showSuccess(
            title: 'Image de profil supprimée avec succès',
          );
        },
      );
    } finally {
      setBusy(false);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
