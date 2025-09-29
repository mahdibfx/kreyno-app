import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/update_profile_dto.dart';
import 'package:kreyno/enums/error_type.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends BaseViewModel {
  final authService = locator<AuthService>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final postalCodeController = TextEditingController();
  late DateTime birthdayValue;
  Gender sexe = Gender.female; // either female or male ;
  ErrorType? errorType;
  bool? userValid;
  File? loadedImage;
  init() {
    getUserInfo();
  }

  Timer? _debounce;
  bool isButtonDisabled() {
    if (userValid == null) {
      return true;
    }
    return userValid == null && !userValid!;
  }

  void onSearchChanged(String query) {
    // cancel previous timer if still active
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // start a new timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // this code runs after 500ms of inactivity
      debugPrint("Debounced text: $query");
      checkUserExistence();
    });
  }

  uploadPicture() async {
    final result = await locator<BottomSheetService>().showCustomSheet(
      variant: BottomSheetType.choosePictureSource,
    );
    if (result != null) {
      print(result.data);
      if (result.data == "camera") {
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image != null) {
          loadedImage = File(image.path);
        }
      } else if (result.data == "gallery") {
        final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (image != null) {
          loadedImage = File(image.path);
        }
      }
    }
    notifyListeners();
  }

  updateProfileData() async {
    final dtoData = UpdateProfileDto(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      birthDate: birthdayValue,
      address: postalCodeController.text,
      gender: sexe,
    );
    final result = await authService.updateProfile(dtoData);
    if (result.success) {}
  }

  changeBirthday(DateTime value) {
    birthdayValue = value;
    notifyListeners();
  }

  checkUserExistence() async {
    final result = await authService.checkUserExistence(
      usernameController.text,
    );

    userValid = result.data.exists;
    notifyListeners();
  }

  getUserInfo() async {
    try {
      errorType = null;
      setBusy(true);
      final result = await authService.getProfile();
      if (result.success) {
        final user = result.data;
        firstNameController.text = user.firstName;
        lastNameController.text = user.lastName;
        emailController.text = user.email;
        birthdayValue = user.birthDate;
        postalCodeController.text = user.address;
        sexe = user.gender;

        notifyListeners();
      } else {
        errorType = ErrorType.backend;
        // TODO: handle backend errors (result.message or similar)
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        errorType = ErrorType.internet;

        // TODO: show internet error screen
      }
    } catch (e) {
      errorType = ErrorType.general;

      // TODO: show generalized error screen
    } finally {
      setBusy(false);
    }
  }

  sexChanged(Gender selectedSexe) {
    sexe = selectedSexe;
    notifyListeners();
  }
}
