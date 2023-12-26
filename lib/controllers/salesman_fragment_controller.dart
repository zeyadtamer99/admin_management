import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/salesmen.dart';
import '../views/target_status_screen.dart';

class SalesmenFragmentController extends GetxController{

  void navigateToTaskStatus() {
    Get.to(() => TargetStatus());
  }
}