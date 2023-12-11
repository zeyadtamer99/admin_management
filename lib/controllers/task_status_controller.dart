import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:admin_management/views/add_task_screen.dart';
import 'package:admin_management/views/dashboard_screen.dart';
import '../views/task_status_screen.dart';

class TaskStatusController extends GetxController {
  void onAppBarLeadingPressed() {
    Get.back();
  }

  void onAppBarEndPressed() {
    Get.to(AddTask());
  }

  void onButtonPressed() {}
}
