
import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';

class IncomeExpensesDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final int amount;
  final Color iconColor;
  const IncomeExpensesDetail({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 13,
          backgroundColor: Color(0xFF2E7E78),
          child: Icon(
            icon,
            color: iconColor,
            size: 19,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          label,
          style: Styles.style16,
        )
      ],
    );
  }
}