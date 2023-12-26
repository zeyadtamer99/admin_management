import 'dart:convert';

import 'package:admin_management/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:admin_management/models/adminInfo.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  var usernameErrorText = Rx<String?>(null);
  var passwordErrorText = Rx<String?>(null);

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username cannot be empty';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    checkToken();
  }

  Future<void> checkToken() async {
    final storage = GetStorage();
    var response = storage.read('response');
    if (response != null) {
      Get.offAll(() => HomeScreen());
    }
  }

  Future<void> onSignInPressed() async {
    usernameErrorText.value = null;
    passwordErrorText.value = null;

    bool isValid = true;
    if (username.value.isEmpty) {
      usernameErrorText.value = 'Please enter a valid username';
      isValid = false;
    }
    if (password.value.isEmpty) {
      passwordErrorText.value = 'Please enter a valid password';
      isValid = false;
    }

    if (isValid) {
      await signIn();
      print('Sign-in successful');
    } else {
      print('Sign-in failed due to validation errors');
    }
  }

  signIn() async {
    Uri baseUrl = Uri.parse("https://dgcuae.com/api/prototype/user/login");

    var res = await http.post(baseUrl, body: {
      "email": mailCtrl.text,
      "password": passwordCtrl.text,
    });

    var response = jsonDecode(res.body);
    if (response['status'] == 'successful') {
      final storage = GetStorage();

      await storage.write('token', response['data']['token']);
      Get.offAll(() => HomeScreen());
    }

    print(res.body);
  }

  void onForgotPasswordPressed() {
    print('Forgot password pressed');
  }
}
