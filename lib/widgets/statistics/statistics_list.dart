import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';
import 'package:test_ui/data/model/add_date.dart';

class StatisticsList extends StatelessWidget {
  final List<Add_data> data;

  const StatisticsList(this.data, {super.key});

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
              data[index].name,
              style: Styles.style16,
            ),
            subtitle: Text(
              ' ${data[index].datetime.year}-${data[index].datetime.day}-${data[index].datetime.month}',
              style: Styles.style13,
            ),
            trailing: Text(
              data[index].amount,
              textAlign: TextAlign.right,
              style: Styles.styleBold18.copyWith(
                color: data[index].IN == 'Income' ? Colors.green : Colors.red,
              ),
            ),
          );
        },
        childCount: data.length,
      ),
    );
  }
}
