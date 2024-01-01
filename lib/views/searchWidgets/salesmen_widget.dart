import 'package:admin_management/controllers/salesman_fragment_controller.dart';
import 'package:admin_management/models/salesmen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SalesmenWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container()
        // ListView.builder(
        //   itemCount: controller.salesmen.length,
        //   itemBuilder: (context, index) {
        //     return SalesmanCard(
        //       salesman: controller.salesmen[index],
        //       onTap: controller.navigateToTargetStatus,
        //       backgroundColor: Colors.white, // or any other color you want
        //     );
        //   },
        // ),
        );
  }
}
