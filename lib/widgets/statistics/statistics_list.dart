import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';
import 'package:test_ui/data/model/add_date.dart';

class StatisticsList extends StatelessWidget {
  final List<Add_data> items;

  const StatisticsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            // leading: ClipRRect(
            //   borderRadius: BorderRadius.circular(5),
            //   child: Image.asset(
            //     'assets/images/${history.name}.png',
            //     height: 40,
            //   ),
            // ),
            title: Text(
              items[index].name,
              style: Styles.style16,
            ),
            subtitle: Text(
              ' ${items[index].datetime.year}-${items[index].datetime.day}-${items[index].datetime.month}',
              style: Styles.style13,
            ),
            trailing: Text(
              items[index].amount,
              textAlign: TextAlign.right,
              style: Styles.styleBold18.copyWith(
                color: items[index].IN == 'Income' ? Colors.green : Colors.red,
              ),
            ),
          );
        },
        childCount: items.length,
      ),
    );
  }
}
