import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_management/views/add_task_screen.dart';

import '../models/salesmen.dart';

class TargetStatusController extends GetxController {
  RxList<Salesman> salesmen;
  double current = 20.0;
  double target = 22.0;
  ValueNotifier<double> valueNotifier = ValueNotifier(0);
  ValueNotifier<double> valueNotifier2 = ValueNotifier(0);

  TargetStatusController(this.salesmen) {
    valueNotifier.value = (current / target) * 100;
    valueNotifier2.value = ((target - current) / target) * 100;
  }

  void onAppBarLeadingPressed() {
    Get.back();
  }

  void onAppBarEndPressed() {
    Get.to(AddTask());
  }

  void onButtonPressed() {}
}