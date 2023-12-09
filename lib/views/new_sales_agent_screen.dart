import 'package:admin_management/constants/constants.dart';
import 'package:admin_management/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sales_agent_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_slider.dart';
import '../widgets/custom_text_field.dart';

class NewSalesAgentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final SalesAgentController _controller = Get.put(SalesAgentController());

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back,
        title: 'New Sales Agent',
        onLeadingPressed: _controller.onLeadingIconPressed,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    title: 'Name',
                    hintText: 'Enter Name',
                    onChanged: (value) => _controller.updateName(value),
                    validator: (value) => _controller.validateName(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    onChanged: (value) => _controller.updatePhoneNumber(value),
                    validator: (value) =>
                        _controller.validatePhoneNumber(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      title: 'Email',
                      hintText: 'Enter Email',
                      onChanged: (value) => _controller.updateEmail(value),
                      validator: (value) => _controller.validateEmail(value)),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      title: 'Start Date',
                      hintText: 'Enter Start Date',
                      onChanged: (value) => _controller.updateStartDate(value),
                      validator: (value) =>
                          _controller.validateStartDate(value)),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => CustomSlider(
                      title: 'Target Needed Calls Daily',
                      value: _controller.progressValue1.value,
                      min: 0,
                      max: 30,
                      onChanged: (double value) =>
                          _controller.updateProgressValue1(value),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => CustomSlider(
                      title: 'Target Needed Monthly EGP',
                      value: _controller.progressValue2.value,
                      min: 0,
                      max: 100000,
                      onChanged: (double value) =>
                          _controller.updateProgressValue2(value),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => CustomSlider(
                      title: 'Target Needed Other',
                      value: _controller.progressValue3.value,
                      min: 0,
                      max: 2000,
                      onChanged: (double value) =>
                          _controller.updateProgressValue3(value),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(text: "Save", backgroundColor: AppColors.primaryColor, fontSize: AppFontSizes.medium, width: screenWidth*0.7, height: screenHeight*0.06, onPressed: _controller.onSave),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
