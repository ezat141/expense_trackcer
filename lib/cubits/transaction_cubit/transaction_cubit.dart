import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:test_ui/data/model/add_date.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final Box<Add_data> box;

  TransactionCubit({required this.box}) : super(TransactionInitial());

  void loadTransactions() {
    try {
      emit(TransactionLoading());

      final transactions = box.values.toList();

      final incomeTransactions =
          transactions.where((t) => t.IN == 'Income').toList();
      final totalIncome = incomeTransactions.isNotEmpty
          ? incomeTransactions
              .map((t) => int.parse(t.amount))
              .reduce((a, b) => a + b)
          : 0;
      final expenseTransactions =
          transactions.where((t) => t.IN == 'Expense').toList();
      final totalExpenses = expenseTransactions.isNotEmpty
          ? expenseTransactions
              .map((t) => int.parse(t.amount))
              .reduce((a, b) => a + b)
          : 0;
      final totalBalance = totalIncome - totalExpenses;
      print("Transactions: $transactions");
      print("Total Income: $totalIncome");
      print("Total Expenses: $totalExpenses");
      print("Total Balance: $totalBalance");

      emit(TransactionLoaded(
        transactions: transactions,
        totalIncome: totalIncome,
        totalExpenses: totalExpenses,
        totalBalance: totalBalance,
      ));
    } catch (e) {
      emit(TransactionError(
          message: 'Failed to load transactions: ${e.toString()}'));
    }
  }
}
