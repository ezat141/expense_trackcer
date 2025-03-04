import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ui/cubits/add_screen_cubit/add_screen_state.dart';
import 'package:test_ui/cubits/settings_cubit/settings_cubit.dart';
import 'package:test_ui/widgets/Add/main_container.dart';

import '../cubits/add_screen_cubit/add_screen_cubit.dart';
import '../cubits/transaction_cubit/transaction_cubit.dart';
import '../widgets/Add/background_container.dart';

class Add_Screen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddScreenCubit, AddScreenState>(
          listener: (context, state) {
            if (state is AddScreenDataSuccess) {
              BlocProvider.of<TransactionCubit>(context).loadTransactions();
              Navigator.pop(context);
            }
          },
        ),
        
      ],
      child: BlocBuilder<SettingsCubit, bool>(

          builder: (context, isDarkMode) {
            return BlocBuilder<AddScreenCubit, AddScreenState>(
              builder: (context, state) {
                if (state is AddScreenDataLoaded) {
                  return Scaffold(
                    backgroundColor: isDarkMode
                      ? Colors.grey[900] // Dark mode background
                      : Colors.grey.shade100, // Light mode background
                    body: SafeArea(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          BackgroundContainer(isDarkMode: isDarkMode),
                          Positioned(
                            top: 120,
                            child: MainContainer(
                              nameController: _nameController,
                              amountController: _amountController,
                              date: state.date,
                              selectedItem: state.selectedItem,
                              selectedItemIncomeExpense:
                                  state.selectedItemIncomeExpense,
                              items: state.items, // items list
                              itemsIncomeExpense: state
                                  .itemsIncomeExpense, //  income/expense list
      
                              onSave: () {
                                context.read<AddScreenCubit>().saveData(
                                    _nameController.text,
                                    _amountController.text,
                                    context);
                              },
                              onDateChanged: (newDate) {
                                context
                                    .read<AddScreenCubit>()
                                    .updateDate(newDate);
                              },
                              onItemSelected: (item) {
                                context
                                    .read<AddScreenCubit>()
                                    .updateSelectedItem(item);
                              },
                              onIncomeExpenseSelected: (item) {
                                context
                                    .read<AddScreenCubit>()
                                    .updateSelectedItemIncomeExpense(item);
                              },
                              isDarkMode: isDarkMode,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      );
    
  }
}
