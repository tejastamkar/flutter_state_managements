import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/expense_model.dart';
import 'package:my_first_getx_app/domain/use_cases/expense_controller.dart';
import 'package:my_first_getx_app/presentation/pages/expense/add_expense_screen.dart';
import 'package:my_first_getx_app/presentation/pages/home/widget/cart_widget.dart';
import 'package:my_first_getx_app/presentation/pages/home/widget/expense_list.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExpenseController expenseController = ExpenseController();

  void openBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      builder: (context) => AddExpenseScreen(
        expenseController: expenseController,
        onRefresh: ({required ExpenseModel expense}) {
          setState(() {});
          expenseController.addExpense(expense);
        },
      ),
    );
  }

  void dismissExpense(
      {required int index, required ExpenseModel selectedExpense}) {
    expenseController.deleteExpense(selectedExpense.id);
    setState(() {});
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              expenseController.insertExpense(selectedExpense, index);
              setState(() {});
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        centerTitle: context.isTablet ? false : true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openBottomSheet,
        child: const Icon(Icons.add),
      ),
      body: context.isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Chart(
                      expenses: expenseController.myExpenseList,
                    ),
                  ),
                ),
                Expanded(
                  child: ExpenseList(
                    expenseController: expenseController,
                    dismissExpense: (
                            {required index, required selectedExpense}) =>
                        dismissExpense(
                      index: index,
                      selectedExpense: selectedExpense,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Chart(
                  expenses: expenseController.myExpenseList,
                ),
                Expanded(
                  child: ExpenseList(
                    expenseController: expenseController,
                    dismissExpense: (
                            {required index, required selectedExpense}) =>
                        dismissExpense(
                      index: index,
                      selectedExpense: selectedExpense,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
