import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/media_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:string_validator/string_validator.dart';

class ProfileImageUpdaterModel extends ReactiveViewModel {
  final _logger = getLogger('ProfileImageUpdaterModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _mediaService = locator<MediaService>();
  final _toastService = locator<ToastService>();

  Avatar? get currentAvatar => _userService.currentUser?.avatar;

  void onAddProfileImageTapped() async {
    await _showImagePickerSheet();
  }

  void onChangeProfileImageTapped() async {
    await _showImagePickerSheet();
  }

  void onDeleteProfileImageTapped() async {
    //TODO: Implement image deletion once the API is ready
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
    //TODO: Implement image upload once the API is ready
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    setBusy(false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
