part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsState {}

final class StatisticsInitial extends StatisticsState {}

class StatisticsSuccess extends StatisticsState {
  final List<String> days;
  final List<dynamic> data;  // List of Add_data or empty list if failure.
  final int selectedIndex;

  StatisticsSuccess({required this.days, required this.data, required this.selectedIndex});
}

class StatisticsFailure extends StatisticsState {
  final String errorMessage;

  StatisticsFailure(this.errorMessage);
}
