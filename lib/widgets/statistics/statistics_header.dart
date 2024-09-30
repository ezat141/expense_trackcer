import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ui/core/utils/styles.dart';
import 'package:test_ui/cubits/statistics/statistics_cubit.dart';

class StatisticsHeader extends StatelessWidget {
  final StatisticsSuccess state;

  const StatisticsHeader({super.key, required this.state});


  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(state.days.length, (index) {
          return GestureDetector(
            onTap: () => context.read<StatisticsCubit>().updateData(index),
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: state.selectedIndex == index ? const Color(0xFF438883) : Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                state.days[index],
                style: Styles.style13.copyWith(
                  color: state.selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
