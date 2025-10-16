import 'dart:async';

import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/dtos/update_profile_dto.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/edit_profile/edit_profile_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends FormViewModel {
  final _logger = getLogger('EditProfileViewModel');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  User? get currentUser => _userService.currentUser;

  bool get isFormValid =>
      (hasFirstName && hasLastName && hasEmail && hasUserName) &&
      (hasFirstNameValidationMessage == false &&
          hasLastNameValidationMessage == false &&
          hasEmailValidationMessage == false &&
          hasUserNameValidationMessage == false);

  bool get hasChanges {
    if (currentUser == null) return false;

    return firstNameValue?.trim() != currentUser?.firstName.trim() ||
        lastNameValue?.trim() != currentUser?.lastName.trim() ||
        userNameValue?.trim() != currentUser?.username.trim() ||
        emailValue?.trim() != currentUser?.email.trim() ||
        isMale != (currentUser?.gender == Gender.male) ||
        (selectedBirthday!.day != currentUser!.birthDate.day ||
            selectedBirthday!.month != currentUser!.birthDate.month ||
            selectedBirthday!.year != currentUser!.birthDate.year);
  }

  bool _isMale = true;
  bool get isMale => _isMale;

  DateTime? _selectedBirthday;
  DateTime? get selectedBirthday => _selectedBirthday;

  bool _checkingEmailTaken = false;
  bool get checkingEmailTaken => _checkingEmailTaken;

  bool _emailAllowed = false;
  bool get emailAllowed => _emailAllowed;

  Timer? _emailDebounceTimer;

  void setCheckingEmailTaken(bool value) {
    if (value == _checkingEmailTaken) return;
    _checkingEmailTaken = value;
    rebuildUi();
  }

  void setEmailAllowed(bool value) {
    if (value == _emailAllowed) return;
    _emailAllowed = value;
    rebuildUi();
  }

  void setIsMale(bool value) {
    if (value == _isMale) return;
    _isMale = value;
    rebuildUi();
  }

  void onBirthdayChanged(DateTime birthday) {
    _logger.d('onBirthdayChanged: $birthday');
    _selectedBirthday = birthday;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }

  void onEmailChanged(String value) {
    setEmailAllowed(false);
    _emailDebounceTimer?.cancel();
    // Only start timer if email has value, no validation errors, and different from current email
    if (value.isNotEmpty &&
        hasEmail &&
        !hasEmailValidationMessage &&
        value.trim() != currentUser?.email) {
      _emailDebounceTimer = Timer(const Duration(milliseconds: 500), () {
        _handleEmailIsTaken();
      });
    } else if (value.trim() == currentUser?.email) {
      // Email unchanged from current, mark as allowed
      setEmailAllowed(true);
    }
  }

  void _handleEmailIsTaken() async {
    setCheckingEmailTaken(true);
    try {
      var response = await _authService.checkIfUserExists(
        attribute: UniqueExistenceId.email,
        value: emailValue!,
      );
      response.match(
        (errorMessage) {
          _logger.e(
            'Error checking if user with email exists',
            error: errorMessage,
          );
          _toastService.showError(title: errorMessage, showIcon: true);
        },
        (exists) {
          if (exists) {
            setEmailValidationMessage(SignupStrings.emailTaken);
          } else {
            setEmailAllowed(true);
          }
        },
      );
    } finally {
      setCheckingEmailTaken(false);
    }
  }

  void initializeForm() {
    if (currentUser == null) return;

    _isMale = currentUser!.gender == Gender.male;
    _selectedBirthday = currentUser!.birthDate;
    setEmailAllowed(true); // Initial email is valid
    rebuildUi();
    _logger.d('hasChanges: $hasChanges');
    _logger.d('isFormValid: $isFormValid');
  }

  void saveProfile() async {
    setBusy(true);
    try {
      final dto = UpdateProfileDto(
        firstName: firstNameValue?.trim(),
        lastName: lastNameValue?.trim(),
        email: emailValue?.trim(),
        gender: isMale ? Gender.male : Gender.female,
        birthDate: selectedBirthday,
      );

      final response = await _userService.updateProfile(dto);
      await response.match(
        (errorMessage) async {
          _logger.e('Error updating profile', error: errorMessage);
          _toastService.showError(title: errorMessage);
        },
        (success) async {
          _logger.i('Profile updated successfully');
          _toastService.showSuccess(title: 'Profil mis à jour avec succès');
        },
      );
    } finally {
      setBusy(false);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];

  @override
  void dispose() {
    _emailDebounceTimer?.cancel();
    super.dispose();
  }
}
