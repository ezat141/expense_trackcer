import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';
import 'package:test_ui/data/utlity.dart';
import 'package:test_ui/widgets/incomeexpensesdetail.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 170,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(47, 125, 121, 0.3),
            spreadRadius: 6,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        color: const Color(0xFF2E7E78),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Balance',
                  style: Styles.styleBold16,
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  '\$ ${total()}',
                  style: Styles.style25,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IncomeExpensesDetail(
                    icon: Icons.arrow_downward,
                    label: 'Income',
                    amount: income(),
                    iconColor: Colors.white),
                IncomeExpensesDetail(
                    icon: Icons.arrow_upward,
                    label: 'Expenses',
                    amount: expenses(),
                    iconColor: Colors.white),
                
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                amount(income()),
                amount(expenses()),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text amount(int amount) {
    return Text(
                '\$ $amount',
                style: Styles.style20,
              );
  }
}

