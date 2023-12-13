import 'package:admin_management/widgets/CustomColumnWidget.dart';
import 'package:admin_management/widgets/advanced_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/profile_controller.dart';
import '../widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back,
        title: 'Profile',
        onLeadingPressed: _controller.navigateToHome,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _controller.name.value,
                style: TextStyle(
                    fontSize: AppFontSizes.large, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _controller.position.value,
                style: TextStyle(fontSize: AppFontSizes.medium),
              ),
              SizedBox(
                height: 24,
              ),
              AdvancedCustomButton(
                text: "Edit",
                onPressed: () {},
                borderColor: AppColors.primaryColor,
                width: screenWidth * 0.3,
                height: screenHeight * 0.04,
                textSize: AppFontSizes.small,
              ),
              SizedBox(
                height: 34,
              ),
              SizedBox(
                height: screenHeight * 0.1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomColumnWidget(
                            icon: Icons.access_time_rounded,
                            mainText: "5",
                            description: "On Going",
                            mainTextStyle: TextStyle(
                                fontSize: AppFontSizes.medium,
                                fontWeight: FontWeight.bold),
                            descriptionStyle: TextStyle(
                                fontSize: AppFontSizes.small,
                                color: Colors.grey)),
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: CustomColumnWidget(
                            icon: Icons.check_circle_outlined,
                            mainText: "25",
                            description: "Total Completed",
                            mainTextStyle: TextStyle(
                                fontSize: AppFontSizes.medium,
                                fontWeight: FontWeight.bold),
                            descriptionStyle: TextStyle(
                                fontSize: AppFontSizes.small,
                                color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              AdvancedCustomButton(
                text: "Teams",
                onPressed: () {},
                borderColor: AppColors.lightGreyColor,
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                textSize: AppFontSizes.medium,
                endingWidget: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(
                height: 12,
              ),
              AdvancedCustomButton(
                  text: "Targets",
                  onPressed: () {},
                  borderColor: AppColors.lightGreyColor,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  textSize: AppFontSizes.medium,
                  endingWidget: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(
                height: 12,
              ),
              AdvancedCustomButton(
                  text: "Settings",
                  onPressed: () {},
                  borderColor: AppColors.lightGreyColor,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  textSize: AppFontSizes.medium,
                  endingWidget: Icon(Icons.arrow_forward_ios_rounded),),
            ],
          ),
        ),
      ),
    );
  }
}
