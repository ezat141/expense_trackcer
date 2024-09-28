import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_ui/constants.dart';
import 'package:test_ui/data/model/add_date.dart';
import 'package:test_ui/widgets/balance_card.dart';
import 'package:test_ui/widgets/greeting_section.dart';
import 'package:test_ui/widgets/transaction_header.dart';
import 'package:test_ui/widgets/transaction_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = Hive.box<Add_data>(kDataBox);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 340, child: _buildHeader()),
                    ),
                    const SliverToBoxAdapter(
                      child: TransactionHeader(),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => TransactionItem(
                            history: box.getAt(index)!, index: index),
                        childCount: box.length,
                      ),
                    ),
                  ],
                );
              })),
    );
  }

  Widget _buildHeader() {
    return const Stack(
      children: [
        GreetingSection(),
        Positioned(
          top: 160,
          left: 37,
          child: BalanceCard(),
        )
      ],
    );
  }
}

