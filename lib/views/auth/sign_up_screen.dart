// lib/views/auth/sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/sign_in_controller.dart';
import '../../controllers/sign_up_controller.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: controller.onLeadingIconPressed,
        leadingIcon: Icons.arrow_back_ios_rounded,
        title: "Sign Up",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyle(fontSize: AppFontSizes.large, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  'Please enter your information and create your account',
                  softWrap: true,
                  style: TextStyle(fontSize: AppFontSizes.small, color: Colors.grey),
                ),
              ),
              SizedBox(height: 36),
              CustomTextField(
                title: 'Username',
                hintText: 'Enter your username',
                onChanged: (value) => controller.name(value),
                validator: (value) => controller.validateName(value), errorText: controller.nameErrorText,
              ),
              SizedBox(height: 16),
              CustomTextField(
                title: 'Password',
                hintText: 'Enter your password',
                onChanged: (value) => controller.password(value),
                validator: (value) => controller.validatePassword(value), errorText: controller.passwordErrorText,
              ),
              SizedBox(height: 16),
              CustomTextField(
                title: 'Email',
                hintText: 'Enter your Email',
                onChanged: (value) => controller.email(value),
                validator: (value) => controller.validateEmail(value), errorText: controller.emailErrorText,
              ),

              SizedBox(height: 24),
              Center(
                child: CustomButton(
                  text: 'Sign Up',
                  backgroundColor: Colors.red,
                  onPressed: controller.onSignUpPressed,
                  fontSize: 16,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.065,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: controller.onAlreadyHaveAccountPressed,
                  child: Text(
                    'Already have an account?',
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
