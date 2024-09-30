import 'package:flutter/material.dart';
import 'package:test_ui/widgets/chart.dart';

class StatisticsChart extends StatelessWidget {
  final int index;

  const StatisticsChart({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Chart(index: index);
  }
}
