import 'package:admin_management/views/home_screen.dart';
import 'package:get/get.dart';

class SalesAgentController extends GetxController {
  final name = ''.obs;
  final phoneNumber = ''.obs;
  final email = ''.obs;
  final startDate = ''.obs;
  final progressValue1 = 0.0.obs;
  final progressValue2 = 0.0.obs;
  final progressValue3 = 0.0.obs;

  var nameErrorText = Rx<String?>(null);
  var phoneNumberErrorText = Rx<String?>(null);
  var emailErrorText = Rx<String?>(null);
  var startDateErrorText = Rx<String?>(null);
  var progressValueErrorText = Rx<String?>(null);

  void updateName(String value) {
    name.value = value;
  }

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void updateEmail(String value) {
    email.value = value;
  }

  void updateStartDate(String value) {
    startDate.value = value;
  }

  void updateProgressValue1(double value) {
    progressValue1.value = value;
  }

  void updateProgressValue2(double value) {
    progressValue2.value = value;
  }

  void updateProgressValue3(double value) {
    progressValue3.value = value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email cannot be empty';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name cannot be empty';
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return 'Phone number cannot be empty';
    return null;
  }

  String? validateStartDate(String? value) {
    if (value == null || value.isEmpty) return 'The start date cannot be empty';
    return null;
  }

  void onLeadingIconPressed() {
    Get.back();
  }

  void onSave() {
    print("Things to do to save task and push to api");
  }
}
