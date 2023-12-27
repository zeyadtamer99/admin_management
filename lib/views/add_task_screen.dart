import 'package:admin_management/constants/constants.dart';
import 'package:admin_management/widgets/advanced_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_task_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddTask extends StatelessWidget {
  final AddTaskController controller = Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Add Task',
          leadingIcon: Icons.arrow_back_ios_rounded,
          onLeadingPressed: controller.onAppBarLeadingPressed,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CustomTextField(
                  title: 'Task Name',
                  hintText: 'Enter task name',
                  onChanged: controller.updateTaskName,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  title: 'Task Date',
                  endIcon: Icons.date_range_rounded,
                  hintText: 'Enter Date',
                  onChanged: controller.updateTaskDate,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      width: screenWidth * 0.45,
                      title: 'Start Time',
                      hintText: 'Enter Start Time',
                      onChanged: controller.updateStartTime,
                    ),
                    CustomTextField(
                      width: screenWidth * 0.45,
                      title: 'End Time',
                      hintText: 'Enter End Time',
                      onChanged: controller.updateEndTime,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task Status",
                      style: TextStyle(
                          fontSize: AppFontSizes.small, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          3,
                          (index) => GetBuilder<AddTaskController>(
                                builder: (controller) {
                                  return Obx(() => AdvancedCustomButton(
                                        text: [
                                          "On Going",
                                          "Completed",
                                          "To Do"
                                        ][index],
                                        onPressed: () => controller
                                            .updateSelectedIndex(index),
                                        width: screenWidth * 0.3,
                                        textSize: AppFontSizes.verySmall,
                                        isSelected:
                                            controller.selectedIndex.value ==
                                                index,
                                      ));
                                },
                              )),
                    )
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                CustomButton(
                  text: "Save",
                  backgroundColor: AppColors.primaryColor,
                  fontSize: AppFontSizes.medium,
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.06,
                  onPressed: controller.onSaveButtonPressed,
                ),
              ],
            ),
          ),
        ));
  }
}
