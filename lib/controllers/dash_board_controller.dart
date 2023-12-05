import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/salesmen.dart';

// Controller for the DashboardScreen
class DashboardController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  List<Salesman> salesmen = [
    Salesman(name: 'John Doe', calls: 10, percentage: 50.0),
    Salesman(name: 'Ahmed Hassan', calls: 22, percentage: 95.0),
    Salesman(name: 'Wael Gomaa', calls: 33, percentage: 30.0),
    Salesman(name: 'Essam El-Hadary', calls: 44, percentage: 80.0),
    Salesman(name: 'Ahmed Fathi', calls: 55, percentage: 10.0),
    // Add more salesmen here
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
  void changeTab(int index) {
    tabController.animateTo(index);
  }
}