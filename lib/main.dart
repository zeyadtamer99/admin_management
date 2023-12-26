import 'package:admin_management/models/adminInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'views/auth/sign_in_screen.dart';
import 'views/home_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget? _myScreen;
  
  final storage = GetStorage();
  
  
  
  @override
  Widget build(BuildContext context) {
    var response = storage.read("response");
    if(storage.read("token") != null && response != null ){
      _myScreen = HomeScreen();
    }else{
      _myScreen = SignInScreen();
    }
    return GetMaterialApp(title: 'Sales Management', home: _myScreen!,debugShowCheckedModeBanner: false);
  }
}
