import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


import '../models/adminInfo.dart';


class EditAdminController extends GetxController {
  final AdminInfo adminInfo;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final targetController = TextEditingController();
  final currentController = TextEditingController();
  final roleController = TextEditingController();
  final statusController = TextEditingController();
  // Add more controllers for the other fields...

  EditAdminController(this.adminInfo) {
    nameController.text = adminInfo.name;
    emailController.text = adminInfo.email;
    phoneNumberController.text = adminInfo.phoneNumber;
    targetController.text = adminInfo.target;
    currentController.text = adminInfo.current;
    roleController.text = adminInfo.role;
    statusController.text = adminInfo.status;
    // Set the text of the other controllers...
  }
  Future<void> updateAdminInfo() async {
    Uri baseUrl = Uri.parse("https://dgcuae.com/api/prototype/user/profile/update");

    final storage = GetStorage();
    String? token = storage.read('token');

    var res = await http.put(
      baseUrl,
      headers: {
        'Authorization': 'Bearer $token',
        "Accept" : "application/json",
      },
      body: {
        "name": nameController.text,
        "phone_number": phoneNumberController.text,
        //"target": targetController.text,
      },
    );

    var response = jsonDecode(res.body);
    if (response['status'] == 'successful') {
      Get.back();
    } else {
      Get.defaultDialog(
        title: 'Error',
        middleText: response['message'],
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneNumberController.dispose();
    targetController.dispose();
    super.onClose();
  }
}
