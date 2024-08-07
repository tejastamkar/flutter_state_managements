import 'dart:developer';
import 'package:my_first_getx_app/constants/data.dart';
import 'package:my_first_getx_app/data/model/expense_model.dart';

class ExpenseController {
  List<ExpenseModel> myExpenseList = [];

  ExpenseController() {
    myExpenseList = [...expenseList];
  }

  bool addExpense(ExpenseModel expense) {
    try {
      myExpenseList.add(expense);
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  bool insertExpense(ExpenseModel expense, int index) {
    try {
      myExpenseList.insert(index, expense);
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  bool deleteExpense(String id) {
    try {
      myExpenseList.removeWhere((element) => element.id == id);
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  bool updateExpense(ExpenseModel expense) {
    try {
      int index =
          myExpenseList.indexWhere((element) => element.id == expense.id);
      if (index != -1) {
        myExpenseList[index] = expense;
        return true;
      }
      return false;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
