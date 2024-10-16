import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


class SettingsCubit extends Cubit<bool> {
  final Box settingsBox;
  SettingsCubit(this.settingsBox) : super(settingsBox.get('darkMode', defaultValue: false));

  void toggleDarkMode(){
    final newMode = !state;
    settingsBox.put('darkMode', newMode);
    emit(newMode);
  }
}
