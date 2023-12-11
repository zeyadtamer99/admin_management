import 'package:admin_management/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../controllers/task_status_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/empty_custom_button.dart';

class TaskStatus extends StatelessWidget {
  final ValueNotifier<double> valueNotifier = ValueNotifier(60);
  final ValueNotifier<double> valueNotifier2 = ValueNotifier(60);
  final TaskStatusController controller = Get.put(TaskStatusController());

  @override
  Widget build(BuildContext context) {
    valueNotifier.value = 60.0;
    valueNotifier2.value = 80.0;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Target Status',
        leadingIcon: Icons.arrow_back_ios_rounded,
        onLeadingPressed: controller.onAppBarLeadingPressed,
        endIcon: Icons.add,
        onEndPressed: controller.onAppBarEndPressed,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SimpleCircularProgressBar(
                size: 200,
                valueNotifier: valueNotifier2,
                startAngle: 0,
                progressColors: const [Colors.black],
                progressStrokeWidth: 30,
                backColor: AppColors.lightGreyColor,
                backStrokeWidth: 30,
                animationDuration: 6,
                mergeMode: true,
              ),
              SimpleCircularProgressBar(
                size: 200,
                valueNotifier: valueNotifier,
                startAngle: 0,
                fullProgressColor: Colors.green,
                progressColors: const [AppColors.primaryColor],
                progressStrokeWidth: 30,
                backColor: AppColors.lightGreyColor,
                backStrokeWidth: 30,
                animationDuration: 6,
                mergeMode: true,
                onGetText: (double value) {
                  return Text(
                    '${value.toInt()}%',
                    style: TextStyle(fontSize: 48),
                  );
                },
              ),

            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Spread the circles evenly
            children:[
              Row(
                children: [ Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGreyColor, // Use the color from circleColors
                  ),
                ),
                  SizedBox(width: 8.0), // Add some space between the circle and text
                  Text("To Do"),],),
              Row(
                children: [ Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey, // Use the color from circleColors
                  ),
                ),
                  SizedBox(width: 8.0), // Add some space between the circle and text
                  Text("In Progress"),],),
              Row(
                children: [
                  Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor, // Use the color from circleColors
                  ),
                ),
                  SizedBox(width: 8.0), // Add some space between the circle and text
                  Text("Completed"),],),
            ]
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Monthly',
                      style: TextStyle(
                          fontSize: AppFontSizes.medium,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TitleCustomButton(
                text: 'Completed',
                subtitle: "18 tasks now . 22 tasks completed",
                onPressed: controller.onButtonPressed,
                icon: Icons.more_horiz_rounded,
                borderColor: AppColors.primaryColor,
                buttonColor: Colors.white,
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                textSize: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 12,
              ),
              TitleCustomButton(
                text: 'In Progress',
                subtitle: "2 tasks now . 1 started",
                onPressed: controller.onButtonPressed,
                borderColor: Colors.black54,
                icon: Icons.more_horiz_rounded,
                buttonColor: Colors.white,
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                textSize: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 12,
              ),
              TitleCustomButton(
                text: 'To Do',
                subtitle: "2 tasks now . 1 upcoming",
                onPressed: controller.onButtonPressed,
                borderColor: AppColors.lightGreyColor,
                icon: Icons.more_horiz_rounded,
                buttonColor: Colors.white,
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                textSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
