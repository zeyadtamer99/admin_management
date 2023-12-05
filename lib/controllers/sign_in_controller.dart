import 'package:admin_management/views/home_screen.dart';
import 'package:get/get.dart';

import '../views/auth/sign_up_screen.dart';

class SignInController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  var usernameErrorText = Rx<String?>(null);
  var passwordErrorText = Rx<String?>(null);

  // Validation logic for the form fields
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username cannot be empty';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    return null;
  }

  // Logic to handle sign in
  void onSignInPressed() {
    // Reset error messages
    usernameErrorText.value = null;
    passwordErrorText.value = null;

    // Validate username and password
    bool isValid = true;
    if (username.value.isEmpty) {
      usernameErrorText.value = 'Username cannot be empty';
      isValid = false;
    }
    if (password.value.isEmpty) {
      passwordErrorText.value = 'Password cannot be empty';
      isValid = false;
    }

    // Proceed with sign-in if valid
    if (isValid) {
      Get.to(() => HomeScreen());
      print('Sign-in successful');
    } else {
      // Handle validation errors
      print('Sign-in failed due to validation errors');
    }
  }

  // Logic for forgot password
  void onForgotPasswordPressed() {
    // Add your forgot password logic here
    print('Forgot password pressed');
  }

  // Logic for navigating to the registration page
  void onNotRegisteredYetPressed() {
    Get.to(() =>
        SignUpScreen()); // Replace SignUpScreen with your actual sign-up page widget
  }
}
