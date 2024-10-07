import 'package:equatable/equatable.dart';
import 'package:test_ui/data/model/add_date.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<Add_data> transactions;
  final int totalIncome;
  final int totalExpenses;
  final int totalBalance;

  const TransactionLoaded({
    required this.transactions,
    required this.totalIncome,
    required this.totalExpenses,
    required this.totalBalance,
  });

  @override
  List<Object?> get props => [transactions, totalIncome, totalExpenses, totalBalance];
}

class TransactionError extends TransactionState {
  final String message;

  const TransactionError({required this.message});

  @override
  List<Object?> get props => [message];
}
