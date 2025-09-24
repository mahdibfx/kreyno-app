import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends BaseViewModel {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final postalCodeController = TextEditingController();
  late DateTime birthdayValue;

  init() {}

  getUserInfo() {}
  String sexe = 'female'; // either female or male ;
  sexChanged(String selectedSexe) {
    sexe = selectedSexe;
    notifyListeners();
  }
}
