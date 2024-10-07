import 'package:go_router/go_router.dart';
import 'package:test_ui/views/home.dart';
import 'package:test_ui/views/statistics.dart';

abstract class AppRouter{
  static const kHomeView = '/homeView';
  static const kAddView = '/addView';
  static const kStatisticsView = '/statisticsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kHomeView,
        builder: (context, state) =>  Home(),
      ),

      GoRoute(    
        path: kStatisticsView,
        builder: (context, state) => const Statistics(),
      ),

    ]);
}