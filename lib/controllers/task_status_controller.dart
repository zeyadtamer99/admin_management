import 'package:admin_management/views/add_task_screen.dart';
import 'package:admin_management/views/dashboard_screen.dart';
import 'package:get/get.dart';

import '../views/task_status_screen.dart';

class TaskStatusController extends GetxController {
  void onAppBarLeadingPressed() {
    Get.to(DashboardScreen());
  }
  void onAppBarEndPressed() {
    Get.to(AddTask());
  }
  void onButtonPressed() {}
}
