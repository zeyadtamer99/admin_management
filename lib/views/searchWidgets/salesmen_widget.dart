import 'package:admin_management/controllers/salesman_fragment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/sales_man_card.dart';

class SalesmenWidget extends StatelessWidget {
  final SalesmenFragmentController controller = Get.put(SalesmenFragmentController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.salesmen.length,
        itemBuilder: (context, index) {
          return SalesmanCard(
            name: controller.salesmen[index].name,
            calls: controller.salesmen[index].calls,
            percentage: controller.salesmen[index].percentage,
            onTap: () {},
          );
        },
      ),
    );
  }
}
