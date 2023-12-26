import 'package:admin_management/constants/constants.dart';
import 'package:admin_management/widgets/advanced_custom_button.dart';
import 'package:admin_management/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/edit_admin_controller.dart';
import '../models/adminInfo.dart';

class EditAdminPage extends StatelessWidget {
  final EditAdminController controller;

  EditAdminPage({required AdminInfo adminInfo})
      : controller = Get.put(EditAdminController(adminInfo));

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: "Edit",leadingIcon: Icons.arrow_back_ios_rounded,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: controller.phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: controller.targetController,
                decoration: InputDecoration(
                  labelText: 'Target',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: controller.currentController,
                decoration: InputDecoration(
                  labelText: 'Current',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: controller.roleController,
                decoration: InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: controller.statusController,
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(
                width: screenWidth*0.4,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor, // This is the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // This is the corner radius
                    ),
                  ),
                  onPressed: controller.updateAdminInfo,
                  icon: Icon(Icons.edit), // This is the ending icon
                  label: Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
