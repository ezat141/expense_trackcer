import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../data/model/add_date.dart';
import 'add_screen_state.dart';

class AddScreenCubit extends Cubit<AddScreenState> {
  AddScreenCubit() : super(AddScreenInitial());

  final List<String> _items = [
    'Food',
    'Transfer',
    'Transportation',
    'Education'
  ];
  final List<String> _itemsIncomeExpense = ['Income', 'Expense'];

  void loadInitialData() {
    emit(AddScreenDataLoaded(
      date: DateTime.now(),
      selectedItem: null,
      selectedItemIncomeExpense: null,
      items: _items,
      itemsIncomeExpense: _itemsIncomeExpense,
    ));
  }

  void updateDate(DateTime newDate) {
    if (state is AddScreenDataLoaded) {
      final currentState = state as AddScreenDataLoaded;
      emit(AddScreenDataLoaded(
        date: newDate,
        selectedItem: currentState.selectedItem,
        selectedItemIncomeExpense: currentState.selectedItemIncomeExpense,
        items: currentState.items,
        itemsIncomeExpense: currentState.itemsIncomeExpense,
      ));
    }
  }

  void updateSelectedItem(String? selectedItem) {
    if (state is AddScreenDataLoaded) {
      final currentState = state as AddScreenDataLoaded;
      emit(AddScreenDataLoaded(
        date: currentState.date,
        selectedItem: selectedItem,
        selectedItemIncomeExpense: currentState.selectedItemIncomeExpense,
        items: currentState.items,
        itemsIncomeExpense: currentState.itemsIncomeExpense,
      ));
    }
  }

  void updateSelectedItemIncomeExpense(String? selectedItemIncomeExpense) {
    if (state is AddScreenDataLoaded) {
      final currentState = state as AddScreenDataLoaded;
      emit(AddScreenDataLoaded(
        date: currentState.date,
        selectedItem: currentState.selectedItem,
        selectedItemIncomeExpense: selectedItemIncomeExpense,
        items: currentState.items,
        itemsIncomeExpense: currentState.itemsIncomeExpense,
      ));
    }
  }

  void saveData(String name, String amount,  BuildContext context) {
    if (name.isEmpty || amount.isEmpty) {
      // Show a validation error or handle it in the UI
      print("Name or amount cannot be empty");
      return;
    }

    if (state is AddScreenDataLoaded) {
      final currentState = state as AddScreenDataLoaded;

      // Create a new Add_data object
      final newData = Add_data(
        currentState.selectedItemIncomeExpense ??
            'Expense', // 'IN' or 'Expense' based on your logic
        amount,
        currentState.date,
        currentState.selectedItem ?? 'No explanation',
        name,
      );

      // Save the new Add_data object into Hive
      var box = Hive.box<Add_data>(kDataBox);
      box.add(newData);

      print("Data saved successfully");
      Navigator.pop(context);

      // Emit a new state if needed (for resetting fields, etc.)
      emit(AddScreenDataLoaded(
        date: DateTime.now(), // Reset to current date or default
        selectedItem: null, // Reset selected item
        selectedItemIncomeExpense: null, // Reset Income/Expense selector
        items: currentState.items, // Pass the existing items back
        itemsIncomeExpense:
            currentState.itemsIncomeExpense, // Same for income/expense items
      ));
    }
  }
}
