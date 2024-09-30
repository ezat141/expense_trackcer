import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_ui/constants.dart';
import 'package:test_ui/data/model/add_date.dart';
import 'package:test_ui/widgets/Add/background_container.dart';
import 'package:test_ui/widgets/Add/main_container.dart'; // Import MainContainer

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_data>(kDataBox);
  DateTime date = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  String? selectedItem;
  String? selectedItemIncomeExpense;

  final List<String> _items = ['Food', 'Transfer', 'Transportation', 'Education'];
  final List<String> _itemsIncomeExpense = ['Income', 'Expense'];

  @override
  void initState() {
    super.initState();
    _nameFocusNode.addListener(() {
      setState(() {});
    });
    _amountFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _nameFocusNode.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }

  void _onSave() {
    if (selectedItem != null && selectedItemIncomeExpense != null) {
      var add = Add_data(
        selectedItemIncomeExpense!,
        _amountController.text,
        date,
        _nameController.text,
        selectedItem!,
      );
      box.add(add);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            BackgroundContainer(),
            Positioned(
              top: 120,
              child: MainContainer(
                nameController: _nameController,
                nameFocusNode: _nameFocusNode,
                amountController: _amountController,
                amountFocusNode: _amountFocusNode,
                items: _items,
                selectedItem: selectedItem,
                itemsIncomeExpense: _itemsIncomeExpense,
                selectedItemIncomeExpense: selectedItemIncomeExpense,
                date: date,
                onSave: _onSave,
                onDateChanged: (newDate) {
                  setState(() {
                    date = newDate;
                  });
                },
                onItemSelected: (item) {
                  setState(() {
                    selectedItem = item;
                  });
                },
                onIncomeExpenseSelected: (item) {
                  setState(() {
                    selectedItemIncomeExpense = item;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}


