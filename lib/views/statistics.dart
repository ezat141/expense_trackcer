import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_ui/widgets/chart.dart';

import '../cubits/statistics/statistics_cubit.dart';
import '../data/model/add_date.dart';
import '../widgets/statistics/statistics_header.dart';
import '../widgets/statistics/statistics_list.dart';
import '../widgets/statistics/statistics_top_spending.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StatisticsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<StatisticsCubit, StatisticsState>(
            builder: (context, state) {
              if (state is StatisticsInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is StatisticsSuccess) {
                return _buildSuccessUI(context, state);
              } else if (state is StatisticsFailure) {
                return Center(child: Text(state.errorMessage));
              }
              return const SizedBox.shrink(); // Fallback in case of unexpected state
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessUI(BuildContext context, StatisticsSuccess state) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('Statistics', style: TextStyle(fontSize: 20, color: Colors.black)),
              const SizedBox(height: 20),
              StatisticsHeader(state: state),
              const SizedBox(height: 20),
              Chart(index: state.selectedIndex),
              const SizedBox(height: 20),
              const StatisticsTopSpending(),
            ],
          ),
        ),
        StatisticsList(state.data.cast<Add_data>()),
      ],
    );
  }

}


