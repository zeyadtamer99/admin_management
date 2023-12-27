import 'package:get/get.dart';

class AddTaskController extends GetxController {
  final taskName = ''.obs;
  final taskDate = ''.obs;
  final startTime = ''.obs;
  final endTime = ''.obs;
  var selectedIndex =
      (-1).obs; // Add this field to keep track of the selected index

  var taskNameErrorText = Rx<String?>(null);
  var taskDateErrorText = Rx<String?>(null);
  var startTimeErrorText = Rx<String?>(null);
  var endTimeErrorText = Rx<String?>(null);

  void updateTaskName(String value) {
    taskName.value = value;
  }

  void updateTaskDate(String value) {
    taskDate.value = value;
  }

  void updateStartTime(String value) {
    startTime.value = value;
  }

  void updateEndTime(String value) {
    endTime.value = value;
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value =
        index; // Update the selected index when a button is pressed
  }

  String? validateTaskName(String? value) {
    if (value == null || value.isEmpty) return 'Task name cannot be empty';
    return null;
  }

  String? validateTaskDate(String? value) {
    if (value == null || value.isEmpty) return 'Task date cannot be empty';
    return null;
  }

  String? validateStartTime(String? value) {
    if (value == null || value.isEmpty) return 'Start time cannot be empty';
    return null;
  }

  String? validateEndTime(String? value) {
    if (value == null || value.isEmpty) return 'End time cannot be empty';
    return null;
  }

  void onAppBarLeadingPressed() {
    Get.back();
  }

  void onSaveButtonPressed() {
    Get.back();
  }
}
