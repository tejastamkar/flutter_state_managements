import 'package:intl/intl.dart';
import 'package:my_first_getx_app/constants/variables.dart';

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  const ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  String get formatDate {
    return DateFormat("dd MMM yyyy").format(date.toLocal());
  }
}

class ExpenseBucket {
  final Category category;
  final List<ExpenseModel> expenses;

  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<ExpenseModel> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get totalExpenses {
    return expenses
        .map((e) => e.amount)
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
