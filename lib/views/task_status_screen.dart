import 'package:admin_management/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/task_status_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/customprogressbar.dart';
import '../widgets/empty_custom_button.dart';

class TaskStatus extends StatelessWidget {
  final TaskStatusController controller = Get.put(TaskStatusController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Target Status',
        leadingIcon: Icons.arrow_back_ios_rounded,
        onLeadingPressed: controller.onAppBarLeadingPressed,
        endIcon: Icons.add ,
        onEndPressed: controller.onAppBarEndPressed,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 20,),
          CustomCircularProgressBar(
            progress1: 0.7,
            progress2: 0.5,
            color1: Colors.black54,
            color2: AppColors.primaryColor,
            taskAmount: '65%',
            circleTexts: ['To Do', 'In Progress', 'Completed'],
            circleColors: [AppColors.lightGreyColor, Colors.black54, AppColors.primaryColor],
          ),
         Column(children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 SizedBox(width: 12,),
                 Text('Monthly',style: TextStyle(fontSize: AppFontSizes.medium, fontWeight: FontWeight.bold),),
               ],
             ),
           ),
           SizedBox(height: 6,),
           TitleCustomButton(
             text: 'Completed',
             subtitle: "18 tasks now . 22 tasks completed",
             onPressed: controller.onButtonPressed,
             icon: Icons.more_horiz_rounded,
             borderColor: AppColors.primaryColor,
             buttonColor: Colors.white,
             width: screenWidth*0.9,
             height: screenHeight*0.1,
             textSize: 16,
             fontWeight: FontWeight.bold,
           ),
           SizedBox(height: 12,),

           TitleCustomButton(
             text: 'In Progress',
             subtitle: "2 tasks now . 1 started",
             onPressed: controller.onButtonPressed,
             borderColor: Colors.black54,
             icon: Icons.more_horiz_rounded,
             buttonColor: Colors.white,
             width: screenWidth*0.9,
             height: screenHeight*0.1,
             textSize: 16,
             fontWeight: FontWeight.bold,
           ),
           SizedBox(height: 12,),

           TitleCustomButton(
             text: 'To Do',
             subtitle: "2 tasks now . 1 upcoming",
             onPressed: controller.onButtonPressed,
             borderColor: AppColors.lightGreyColor,
             icon: Icons.more_horiz_rounded,
             buttonColor: Colors.white,
             width: screenWidth*0.9,
             height: screenHeight*0.1,
             textSize: 16,
             fontWeight: FontWeight.bold,
           ),
         ],)
        ],
      ),
    );
  }
}
