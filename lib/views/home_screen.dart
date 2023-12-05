import 'package:admin_management/views/DashBoardScreen.dart';
import 'package:admin_management/views/auth/sign_in_screen.dart';
import 'package:admin_management/views/new_sales_agent_screen.dart';
import 'package:admin_management/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (homeController.selectedIndex.value) {
          case 0:
            return DashboardScreen();
          case 1:
            return NewSalesAgentScreen();
          case 2:
            return SignInScreen();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New Agent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: homeController.selectedIndex.value,
        onTap: homeController.changePage,
      )),
    );
  }
}

