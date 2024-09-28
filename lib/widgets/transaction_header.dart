import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Transactions History', style: Styles.styleBold18),
          Text('See all', style: Styles.styleNormal14),
        ],
      ),
    );
  }
}
