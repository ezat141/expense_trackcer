import 'package:flutter/material.dart';
import 'package:test_ui/widgets/Add/amount_widget.dart';
import 'package:test_ui/widgets/Add/explain_widget.dart';
import 'package:test_ui/widgets/Add/name_widget.dart';
import 'package:test_ui/widgets/Add/how_widget.dart';
import 'package:test_ui/widgets/Add/date_time_widget.dart';
import 'package:test_ui/widgets/Add/save_widget.dart';

class MainContainer extends StatelessWidget {
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final TextEditingController amountController;
  final FocusNode amountFocusNode;
  final List<String> items;
  final String? selectedItem;
  final List<String> itemsIncomeExpense;
  final String? selectedItemIncomeExpense;
  final DateTime date;
  final VoidCallback onSave;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<String?> onItemSelected;
  final ValueChanged<String?> onIncomeExpenseSelected;

  const MainContainer({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    required this.amountController,
    required this.amountFocusNode,
    required this.items,
    required this.selectedItem,
    required this.itemsIncomeExpense,
    required this.selectedItemIncomeExpense,
    required this.date,
    required this.onSave,
    required this.onDateChanged,
    required this.onItemSelected,
    required this.onIncomeExpenseSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 550,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 35,
            offset: Offset(0, 22),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          NameWidget(
            selectedItem: selectedItem,
            items: items,
            onChanged: onItemSelected,
          ),
          const SizedBox(height: 30),
          ExplainWidget(
            ex: nameFocusNode,
            nameController: nameController,
          ),
          const SizedBox(height: 30),
          AmountWidget(
            amountFocusNode: amountFocusNode,
            amountController: amountController,
          ),
          const SizedBox(height: 30),
          HowWidget(
            selectedItem: selectedItemIncomeExpense,
            items: itemsIncomeExpense,
            onChanged: onIncomeExpenseSelected,
          ),
          const SizedBox(height: 30),
          DateTimeWidget(
            date: date,
            onDateChanged: onDateChanged,
          ),
          const Spacer(),
          SaveWidget(onSave: onSave),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
