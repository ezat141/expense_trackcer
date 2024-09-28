import 'package:hive/hive.dart';
import 'package:test_ui/constants.dart';
import 'package:test_ui/data/model/add_date.dart';


final box = Hive.box<Add_data>(kDataBox);

/// General method to calculate total, income, or expenses
int calculateAmount({required bool isIncome, bool calculateTotal = false}) {
  return box.values
      .map((entry) {
        int amount = int.parse(entry.amount);
        if (calculateTotal) {
          return entry.IN == 'Income' ? amount : -amount;
        }
        return (entry.IN == 'Income') == isIncome ? amount : 0;
      })
      .reduce((value, element) => value + element);
}

/// Calculate total (income - expenses)
int total() => calculateAmount(isIncome: true, calculateTotal: true);

/// Calculate total income
int income() => calculateAmount(isIncome: true);

/// Calculate total expenses
int expenses() => calculateAmount(isIncome: false);

/// Filter entries based on a given condition
List<Add_data> filterByCondition(bool Function(Add_data) condition) {
  return box.values.where(condition).toList();
}

/// Entries for today
List<Add_data> today() {
  DateTime now = DateTime.now();
  return filterByCondition((entry) => entry.datetime.day == now.day && entry.datetime.month == now.month && entry.datetime.year == now.year);
}

/// Entries for the last 7 days (week)
List<Add_data> week() {
  DateTime now = DateTime.now();
  DateTime sevenDaysAgo = now.subtract(Duration(days: 7));
  return filterByCondition((entry) => entry.datetime.isAfter(sevenDaysAgo) && entry.datetime.isBefore(now.add(Duration(days: 1))));
}

List<Add_data> month() {
  DateTime now = DateTime.now();
  return filterByCondition((entry) => entry.datetime.month == now.month && entry.datetime.year == now.year);
}

List<Add_data> year() {
  DateTime now = DateTime.now();
  return filterByCondition((entry) => entry.datetime.year == now.year);
}

/// Calculate total chart values for a given list of entries
int totalChart(List<Add_data> entries) {
  return entries
      .map((entry) => entry.IN == 'Income' ? int.parse(entry.amount) : int.parse(entry.amount) * -1)
      .reduce((value, element) => value + element);
}

/// Group entries by hour or day and calculate the total for each group
List<int> time(List<Add_data> entries, bool groupByHour) {
  List<int> totals = [];
  List<Add_data> groupedEntries = [];
  int lastIndex = 0;

  for (int c = 0; c < entries.length; c++) {
    for (int i = c; i < entries.length; i++) {
      bool isSameGroup = groupByHour
          ? entries[i].datetime.hour == entries[c].datetime.hour
          : entries[i].datetime.day == entries[c].datetime.day;

      if (isSameGroup) {
        groupedEntries.add(entries[i]);
        lastIndex = i;
      }
    }
    totals.add(totalChart(groupedEntries));
    groupedEntries.clear();
    c = lastIndex;
  }

  return totals;
}



