import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ui/core/utils/styles.dart';
import 'package:test_ui/data/model/add_date.dart';

import '../cubits/transaction_cubit/transaction_cubit.dart';

class TransactionItem extends StatelessWidget {
  final Add_data history;
  final int index;
  // final VoidCallback onDelete;

  final List<String> dayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  TransactionItem({required this.history, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        history.delete();
        BlocProvider.of<TransactionCubit>(context).loadTransactions();
      } ,
      child: ListTile(
        title: Text(history.name, style: Styles.style16),
        subtitle: Text(
          '${dayNames[history.datetime.weekday - 1]} ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
          style: Styles.style13,
        ),
        trailing: Text(
          '\$${history.amount}',
          style: Styles.styleBold18.copyWith(
            color: history.IN == 'Income' ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
