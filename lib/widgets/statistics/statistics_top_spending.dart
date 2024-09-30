import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';

class StatisticsTopSpending extends StatelessWidget {
  const StatisticsTopSpending({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Top Spending', style: Styles.styleBold18),
          const Icon(Icons.swap_vert, size: 25, color: Colors.grey),
        ],
      ),
    );
  }
}
