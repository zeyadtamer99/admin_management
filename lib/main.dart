import 'package:admin_management/views/task_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/auth/sign_in_screen.dart';
import 'views/home_screen.dart';
import 'views/new_sales_agent_screen.dart';
import 'controllers/home_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Sales Management', home: HomeScreen());
  }
}
