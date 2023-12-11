import 'package:admin_management/views/home_screen.dart';
import 'package:get/get.dart';

import '../views/auth/sign_in_screen.dart';
import '../views/auth/sign_up_screen.dart';

class SignUpController extends GetxController {
  var name = ''.obs;
  var password = ''.obs;
  var email = ''.obs;

  var nameErrorText = Rx<String?>(null);
  var emailErrorText = Rx<String?>(null);
  var passwordErrorText = Rx<String?>(null);

  // Validation logic for the form fields
  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name cannot be empty';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    return null;
  }
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email cannot be empty';
    return null;
  }

  // Logic to handle sign in
  void onSignUpPressed() {
    nameErrorText.value = null;
    emailErrorText.value = null;
    passwordErrorText.value = null;


    bool isValid = true;
    if (name.value.isEmpty) {
      nameErrorText.value = 'Name cannot be empty';
      isValid = false;
    }
    if (password.value.isEmpty) {
      passwordErrorText.value = 'Password cannot be empty';
      isValid = false;
    }
    if (email.value.isEmpty) {
      emailErrorText.value = 'Email cannot be empty';
      isValid = false;
    }

    if (isValid) {
      Get.to(()=>HomeScreen());
      print('Sign-in successful');
    } else {
      print('Sign-in failed due to validation errors');
    }
  }

  void onAlreadyHaveAccountPressed(){
    Get.to(() =>
        SignInScreen());
  }
  void onLeadingIconPressed(){
   Get.back();
  }
}

