import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/salesmen.dart';
import '../views/target_status_screen.dart';

class SalesmenFragmentController extends GetxController{
  List<Salesman> salesmen = [
    Salesman(name: 'Abou trika', calls: 10, percentage: 50.0),
    Salesman(name: 'Ahmed Hassan', calls: 22, percentage: 95.0),
    Salesman(name: 'Wael Gomaa', calls: 33, percentage: 30.0),
    Salesman(name: 'Essam El-Hadary', calls: 44, percentage: 80.0),
    Salesman(name: 'Ahmed Fathi', calls: 55, percentage: 10.0),
    Salesman(name: 'Sayed Mowad', calls: 10, percentage: 50.0),
    Salesman(name: 'Hossam Ghaly', calls: 22, percentage: 95.0),
    Salesman(name: 'Emad Motoeb', calls: 33, percentage: 30.0),
    Salesman(name: 'Amr Zaki', calls: 44, percentage: 80.0),
    Salesman(name: 'Zeyad Tamer', calls: 55, percentage: 10.0),
  ];


  void navigateToTaskStatus() {
    Get.to(() => TargetStatus());
  }
}