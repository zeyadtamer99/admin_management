import 'package:get/get.dart';
import 'package:admin_management/views/add_task_screen.dart';

class TargetStatusController extends GetxController {
  void onAppBarLeadingPressed() {
    Get.back();
  }

  void onAppBarEndPressed() {
    Get.to(AddTask());
  }

  void onButtonPressed() {}
}
