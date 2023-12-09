import 'package:admin_management/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sign_in_controller.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sign In",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: AppFontSizes.large, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: screenWidth * 0.65,
                child: Text(
                  'Please enter your email address and password for login',
                  softWrap: true,
                  style: TextStyle(fontSize: AppFontSizes.small, color: Colors.grey),
                ),
              ),
              SizedBox(height: 36),
              CustomTextField(
                title: 'Username',
                hintText: 'Enter your username',
                onChanged: (value) => controller.username(value),
                validator: (value) => controller.validateUsername(value), errorText: controller.usernameErrorText,
              ),
              SizedBox(height: 16),
              CustomTextField(
                title: 'Password',
                hintText: 'Enter your password',
                onChanged: (value) => controller.password(value),
                validator: (value) => controller.validatePassword(value), errorText: controller.passwordErrorText,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: controller.onForgotPasswordPressed,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.black,fontSize: AppFontSizes.verySmall),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: CustomButton(
                  text: 'Sign In',
                  backgroundColor: Colors.red,
                  onPressed: controller.onSignInPressed,
                  fontSize: AppFontSizes.small,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.065,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: controller.onNotRegisteredYetPressed,
                  child: Text(
                    'Not Register Yet?',
                    style: TextStyle(color: Colors.grey,fontSize: AppFontSizes.verySmall),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
