import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ui/cubits/transaction_cubit/transaction_cubit.dart';
import 'package:test_ui/widgets/balance_card.dart';
import 'package:test_ui/widgets/greeting_section.dart';
import 'package:test_ui/widgets/transaction_header.dart';
import 'package:test_ui/widgets/transaction_item.dart';
import '../cubits/transaction_cubit/transaction_state.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late TransactionCubit transactionCubit;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TransactionCubit>(context).loadTransactions();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TransactionLoaded) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: 340,
                      child: _buildHeader(state.totalBalance,
                          state.totalIncome, state.totalExpenses)),
                ),
                const SliverToBoxAdapter(
                  child: TransactionHeader(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final transaction = state.transactions[index];
                      return TransactionItem(
                        history: transaction,
                        index: index,
                      );
                    },
                    childCount: state.transactions.length,
                  ),
                ),
              ],
            );
          } else if (state is TransactionError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No transactions available.'));
          }
        },
      )),
    );
  }

  Widget _buildHeader(int totalBalance, int totalIncome, int totalExpenses) {
    return Stack(
      children: [
        const GreetingSection(),
        Positioned(
          top: 160,
          left: 37,
          child: BalanceCard(
            totalBalance: totalBalance,
            totalIncome: totalIncome,
            totalExpenses: totalExpenses,
          ),
        )
      ],
    );
  }
}
