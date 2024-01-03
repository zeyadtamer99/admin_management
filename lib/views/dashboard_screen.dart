import 'dart:math';

import 'package:admin_management/constants/constants.dart';
import 'package:admin_management/widgets/custom_analytics_card.dart';
import 'package:admin_management/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../controllers/dash_board_controller.dart';
import '../widgets/sales_man_card.dart';

class DashboardScreen extends StatelessWidget {
  final random = Random();
  List<_SalesData> generateRandomData() {
    return List<_SalesData>.generate(
      5,
          (int index) => _SalesData('Month${index + 1}', random.nextInt(100).toDouble()),
    );
  }


  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {

    List<_SalesData> data1 = generateRandomData();
    List<_SalesData> data2 = generateRandomData();
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            title: 'Friday, 26',
            leadingIcon: Icons.menu_rounded,
            endIcon: Icons.doorbell_outlined,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: SfCartesianChart(
                        series: <SplineSeries<_SalesData, String>>[
                          SplineSeries<_SalesData, String>(
                            dataSource: data1,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            splineType: SplineType.natural,
                            name: 'Sales',
                            markerSettings: MarkerSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SfCartesianChart(
                        series: <StackedLineSeries<_SalesData, String>>[
                          StackedLineSeries<_SalesData, String>(
                            dataSource: data1,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            name: 'Sales1',
                            markerSettings: MarkerSettings(isVisible: true),
                          ),
                          StackedLineSeries<_SalesData, String>(
                            dataSource: data2,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            name: 'Sales2',
                            markerSettings: MarkerSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Salesmen",
                            style: TextStyle(
                                fontSize: AppFontSizes.medium,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: controller.navigateToSalesmen,
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.primaryColor,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.4,
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: controller.salesmen.length,
                            itemBuilder: (context, index) {
                              return SalesmanCard(
                                salesman: controller.salesmen[index],
                                onTap: controller.navigateToTargetStatus,
                                backgroundColor: Colors.white,
                              );
                            },
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
