import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_ui/constants.dart';
import 'package:test_ui/cubits/settings_cubit/settings_cubit.dart';
import 'package:test_ui/data/model/add_date.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_ui/views/splash.dart';
import 'cubits/transaction_cubit/transaction_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>(kDataBox);
  final settingsBox = await Hive.openBox('settingsBox');
  runApp(MyApp(settingsBox: settingsBox));
}

class MyApp extends StatelessWidget {
  final Box settingsBox;
  const MyApp({super.key, required this.settingsBox});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionCubit(box: Hive.box(kDataBox)),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(settingsBox),
        ),
      ],
      child: BlocBuilder<SettingsCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp(
            title: 'Banking App',
            debugShowCheckedModeBanner: false,
            theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
