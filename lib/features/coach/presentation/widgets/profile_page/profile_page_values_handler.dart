import 'package:flutter/material.dart';

import '../../../data/models/coach_profile_model.dart';

class ProfilePageValuesHandler {
  CoachProfileModel? model;

  ProfilePageValuesHandler();

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController surnameEditingController = TextEditingController();
  TextEditingController offlineNameController = TextEditingController();
  TextEditingController offlineLocationController = TextEditingController();
  TextEditingController countExperienceEditingController =
      TextEditingController();
  TextEditingController individualPriceEditingController =
      TextEditingController();
  TextEditingController groupPriceEditingController = TextEditingController();
  TextEditingController goalEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();

  void initControllersValues() {

    nameEditingController.text = model!.firstName ?? '';
    surnameEditingController.text = model!.lastName ?? '';
    countExperienceEditingController.text = (model!.duration ?? '').toString();
    individualPriceEditingController.text =
        (model!.individualPrice ?? '').toString();
    groupPriceEditingController.text = (model!.groupPrice ?? '').toString();
    phoneEditingController.text = model!.phoneNumber ?? '';
    emailEditingController.text = model!.email ?? '';
  }

  void dispose() {
    nameEditingController.dispose();
    surnameEditingController.dispose();
    offlineLocationController.dispose();
    offlineNameController.dispose();
    countExperienceEditingController.dispose();
    individualPriceEditingController.dispose();
    groupPriceEditingController.dispose();
    phoneEditingController.dispose();
    goalEditingController.dispose();
    emailEditingController.dispose();
  }
}
