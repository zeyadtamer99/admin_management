import 'package:get/get.dart';

import '../views/home_screen.dart';

class ProfileController extends GetxController {
  final name = 'John Doe'.obs;
  final position = 'Software Developer'.obs;

  void editProfile() {
    // Add your logic for editing the profile here
  }

  void navigateToHome() {
    Get.to(() => HomeScreen());
  }
}
