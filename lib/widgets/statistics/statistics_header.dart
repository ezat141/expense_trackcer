import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';

class StatisticsHeader extends StatelessWidget {
  final List<String> day;
  final int indexColor;
  final Function(int) onTap;

  const StatisticsHeader({
    super.key,
    required this.day,
    required this.indexColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: indexColor == index ? const Color(0xFF438883) : Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                day[index],
                style: Styles.style13.copyWith(
                  color: indexColor == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
