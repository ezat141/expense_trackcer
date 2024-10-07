import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ui/cubits/navigation_cubit/navigation_cubit_cubit.dart';
import 'package:test_ui/views/add.dart';
import 'package:test_ui/views/home.dart';
import 'package:test_ui/views/statistics.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(), // Provide the NavigationCubit
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, index) {
          List<Widget> screens = [ Home(), const Statistics(),  Home(), const Statistics()];

          return Scaffold(
            body: screens[index], 
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Add_Screen()));
              },
              backgroundColor: const Color(0xff368983),
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Padding(
                padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<NavigationCubit>().selectIndex(0); 
                      },
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color: index == 0 ? const Color(0xff368983) : Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<NavigationCubit>().selectIndex(1); 
                      },
                      child: Icon(
                        Icons.bar_chart_outlined,
                        size: 30,
                        color: index == 1 ? const Color(0xff368983) : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        context.read<NavigationCubit>().selectIndex(2); 
                      },
                      child: Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 30,
                        color: index == 2 ? const Color(0xff368983) : Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<NavigationCubit>().selectIndex(3); // Navigate to Profile
                      },
                      child: Icon(
                        Icons.person_outlined,
                        size: 30,
                        color: index == 3 ? const Color(0xff368983) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

