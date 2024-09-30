import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_ui/data/model/add_date.dart';

import '../../data/utlity.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsInitial()){
    // Emit initial data when cubit is created
    loadData(0); // Load initial data for 'Day'
  }

  void loadData(int index){
    try {
      List<List<Add_data>> allData = [today(), week(), month(), year()];
      emit(StatisticsSuccess(
        days: ['Day', 'Week', 'Month', 'Year'], 
        data: allData[index], 
        selectedIndex: index));

      
    } catch (e) {
      emit(StatisticsFailure("Failed to load data."));
      
    }
  }
  void updateData(int index) {
    loadData(index);
  }

}
