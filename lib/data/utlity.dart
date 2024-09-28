import 'package:hive/hive.dart';
import 'package:test_ui/constants.dart';
import 'package:test_ui/data/model/add_date.dart';

// int totals = 0;

// final box = Hive.box<Add_data>(kDataBox);

// int total() {
//   var history2 = box.values.toList();
//   List a = [0, 0];
//   for (var i = 0; i < history2.length; i++) {
//     a.add(history2[i].IN == 'Income'
//         ? int.parse(history2[i].amount)
//         : int.parse(history2[i].amount) * -1);
//   }
//   totals = a.reduce((value, element) => value + element);
//   return totals;
// }

// int income() {
//   var history2 = box.values.toList();
//   List a = [0, 0];
//   for (var i = 0; i < history2.length; i++) {
//     a.add(history2[i].IN == 'Income' ? int.parse(history2[i].amount) : 0);
//   }
//   totals = a.reduce((value, element) => value + element);
//   return totals;
// }

// int expenses() {
//   var history2 = box.values.toList();
//   List a = [0, 0];
//   for (var i = 0; i < history2.length; i++) {
//     a.add(history2[i].IN == 'Income' ? 0 : int.parse(history2[i].amount) * -1);
//   }
//   totals = a.reduce((value, element) => value + element);
//   return totals;
// }

// List<Add_data> today() {
//   List<Add_data> a = [];
//   var history2 = box.values.toList();
//   DateTime date = new DateTime.now();
//   for (var i = 0; i < history2.length; i++) {
//     if (history2[i].datetime.day == date.day) {
//       a.add(history2[i]);
//     }
//   }
//   return a;
// }

// List<Add_data> week() {
//   List<Add_data> a = [];
//   DateTime date = new DateTime.now();
//   var history2 = box.values.toList();
//   for (var i = 0; i < history2.length; i++) {
//     if (date.day - 7 <= history2[i].datetime.day &&
//         history2[i].datetime.day <= date.day) {
//       a.add(history2[i]);
//     }
//   }
//   return a;
// }

// List<Add_data> month() {
//   List<Add_data> a = [];
//   var history2 = box.values.toList();
//   DateTime date = new DateTime.now();
//   for (var i = 0; i < history2.length; i++) {
//     if (history2[i].datetime.month == date.month) {
//       a.add(history2[i]);
//     }
//   }
//   return a;
// }

// List<Add_data> year() {
//   List<Add_data> a = [];
//   var history2 = box.values.toList();
//   DateTime date = new DateTime.now();
//   for (var i = 0; i < history2.length; i++) {
//     if (history2[i].datetime.year == date.year) {
//       a.add(history2[i]);
//     }
//   }
//   return a;
// }

// int total_chart(List<Add_data> history2) {
//   List a = [0, 0];

//   for (var i = 0; i < history2.length; i++) {
//     a.add(history2[i].IN == 'Income'
//         ? int.parse(history2[i].amount)
//         : int.parse(history2[i].amount) * -1);
//   }
//   totals = a.reduce((value, element) => value + element);
//   return totals;
// }

// List time(List<Add_data> history2, bool hour) {
//   List<Add_data> a = [];
//   List total = [];
//   int counter = 0;
//   for (var c = 0; c < history2.length; c++) {
//     for (var i = c; i < history2.length; i++) {
//       if (hour) {
//         if (history2[i].datetime.hour == history2[c].datetime.hour) {
//           a.add(history2[i]);
//           counter = i;
//         }
//       } else {
//         if (history2[i].datetime.day == history2[c].datetime.day) {
//           a.add(history2[i]);
//           counter = i;
//         }
//       }
//     }
//     total.add(total_chart(a));
//     a.clear();
//     c = counter;
//   }
//   print(total);
//   return total;
// }

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



