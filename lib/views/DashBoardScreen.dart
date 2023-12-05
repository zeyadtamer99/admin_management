import 'dart:math';

import 'package:admin_management/constants/constants.dart';
import 'package:admin_management/widgets/custom_analytics_card.dart';
import 'package:admin_management/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../controllers/dash_board_controller.dart';
import '../widgets/sales_man_card.dart';

class DashboardScreen extends StatelessWidget {
  final random = Random();

  List<_SalesData> generateRandomData() {
    return List<_SalesData>.generate(
      5,
          (int index) => _SalesData(
        'Month ${index + 1}',
        random.nextInt(100).toDouble(), // Generates a random number between 0 and 99
      ),
    );
  }
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = generateRandomData();

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
              DefaultTabController(
                length: 3, // The number of tabs
                child: Column(
                  children: [
                    TabBar(
                      onTap: controller.changeTab,
                      tabs: [
                        Tab(text: 'Leads'),
                        Tab(text: 'Salesmen'),
                        Tab(text: 'Targets'),
                      ],
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 3),
                        ),
                      ),
                    ), // Add more widgets as needed
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 250, // adjust this value as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // replace with your actual list length
                  itemBuilder: (context, index) {
                    return CustomAnalyticsCard(
                      title: 'Card $index',
                      child: SfSparkLineChart.custom(
                        trackball: SparkChartTrackball(
                            activationMode: SparkChartActivationMode.tap),
                        marker: SparkChartMarker(
                            borderColor: Colors.lightBlueAccent,
                            displayMode: SparkChartMarkerDisplayMode.all),
                        labelDisplayMode: SparkChartLabelDisplayMode.all,
                        xValueMapper: (int index) => data[index].year,
                        yValueMapper: (int index) => data[index].sales,
                        color: Colors.white,
                        dataCount: 5,
                      ),
                      backgroundColor: AppColors.primaryColor,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 32,
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.primaryColor,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.4,
                      child: ListView.builder(
                        itemCount: controller.salesmen.length,
                        itemBuilder: (context, index) {
                          return SalesmanCard(
                            name: controller.salesmen[index].name,
                            calls: controller.salesmen[index].calls,
                            percentage: controller.salesmen[index].percentage,
                          );
                        },
                      ),
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
