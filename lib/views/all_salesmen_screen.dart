import 'package:admin_management/models/salesmen.dart';
import 'package:admin_management/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_salesmen_controller.dart';
import '../widgets/sales_man_card.dart';

class AllSalesmenPage extends StatelessWidget {

  final AllSalesmenController controller;

  AllSalesmenPage({required RxList<Salesman> salesmen})
      : controller = Get.put(AllSalesmenController(salesmen));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'All Salesmen',leadingIcon: Icons.arrow_back_ios_rounded,onLeadingPressed: controller.goBack,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5.0, // Adjust as needed
                borderRadius: BorderRadius.circular(10), // Adjust as needed
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Adjust as needed
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: controller.updateFilteredSalesmen,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none, // Removes underline
                      contentPadding: EdgeInsets.all(10), // Adjust as needed
                    ),
                  ),
                ),
              ),
            ),


            SizedBox(height: 12,),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredSalesmen.length,
                    itemBuilder: (context, index) {
                      return SalesmanCard(
                        salesman: controller.filteredSalesmen[index],
                        onTap: controller.navigateToTargetStatus,
                        backgroundColor: Colors.white,
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
