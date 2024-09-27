import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';
import 'package:test_ui/data/listdata.dart';
import 'package:test_ui/data/model/add_date.dart';
import 'package:test_ui/data/top.dart';
import 'package:test_ui/data/utlity.dart';
import 'package:test_ui/widgets/chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<Add_data> a = [];
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (context, value, child) {
            a = f[value];
            return custom();
          },
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Statistics',
                  style: Styles.style20.copyWith(color: Colors.black)),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                            kj.value = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: index_color == index
                                ? Color(0xFF438883)
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            day[index],
                            style: Styles.style13.copyWith(
                              color: index_color == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF666666)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Expense',
                            textAlign: TextAlign.center,
                            style: Styles.style14.copyWith(
                              color: Color(0xFF666666),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Chart()
                  ],
                ),
              ),
              SizedBox(height: 20),
              Chart(index: index_color),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Spending',
                      style: Styles.styleBold18,
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(
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
                  a[index].name,
                  style: Styles.style16,
                ),
                subtitle: Text(
                  ' ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
                  style: Styles.style13,
                ),
                trailing: Text(a[index].amount,
                    textAlign: TextAlign.right,
                    style: Styles.styleBold18.copyWith(
                        color: a[index].IN == 'INCOME'
                            ? Colors.green
                            : Colors.red)),
              );
            },
            childCount: a.length,
          ),
        ),
      ],
    );
  }
}
