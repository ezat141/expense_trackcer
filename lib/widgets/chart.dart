import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_ui/data/model/add_date.dart';
import 'package:test_ui/data/utlity.dart';

class Chart extends StatefulWidget {
  final int index;
  const Chart({super.key, required this.index});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  // Helper method to fetch the relevant data based on the index
  List<Add_data> fetchData(int index) {
    switch (index) {
      case 0:
        return today();
      case 1:
        return week();
      case 2:
        return month();
      case 3:
        return year();
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Add_data> data = fetchData(widget.index);
    bool isHourly = widget.index == 0;
    bool isDayView = widget.index < 3; // For today, week, and month views, use day/hour
    List timeValues = time(data, isHourly);

    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: Color(0xff438883),
            width: 3,
            dataSource: List.generate(timeValues.length, (index) {
              String label = isDayView
                  ? isHourly
                      ? data[index].datetime.hour.toString()
                      : data[index].datetime.day.toString()
                  : data[index].datetime.month.toString();
              int salesValue = index > 0
                  ? timeValues[index] + timeValues[index - 1]
                  : timeValues[index];
              return SalesData(label, salesValue);
            }),
            xValueMapper: (SalesData sales, _) => sales.label,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.label, this.sales);
  final String label;
  final int sales;
}

