abstract class AddScreenState {}

class AddScreenInitial extends AddScreenState {}

class AddScreenDataLoaded extends AddScreenState {
  final DateTime date;
  final String? selectedItem;
  final String? selectedItemIncomeExpense;
  final List<String> items;
  final List<String> itemsIncomeExpense;

  AddScreenDataLoaded({
    required this.date,
    required this.selectedItem,
    required this.selectedItemIncomeExpense,
    required this.items,
    required this.itemsIncomeExpense,
  });
}
