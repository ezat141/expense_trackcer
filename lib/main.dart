import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_ui/constants.dart';
import 'package:test_ui/data/model/add_date.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_ui/views/home.dart';
import 'package:test_ui/views/statistics.dart';
import 'package:test_ui/widgets/bottomnavigationbar.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>(kDataBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:  const Bottom(),
    );
  }
}
