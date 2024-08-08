import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/expense_model.dart';
import 'package:my_first_getx_app/domain/use_cases/expense_controller.dart';
import 'package:my_first_getx_app/presentation/pages/home/widget/expense_card.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class ExpenseList extends StatefulWidget {
  final ExpenseController expenseController;
  final void Function(
      {required int index,
      required ExpenseModel selectedExpense}) dismissExpense;
  const ExpenseList(
      {super.key,
      required this.expenseController,
      required this.dismissExpense});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    bool showEmptyList = widget.expenseController.myExpenseList.isEmpty;
    return showEmptyList
        ? Center(
            child: Text('No data added yet',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onPrimaryContainer,
                    fontSize: context.isTablet ? 20 : 18)),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 80),
            itemCount: widget.expenseController.myExpenseList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: context.colorScheme.errorContainer,
                ),
                onDismissed: (direction) => widget.dismissExpense(
                    index: index,
                    selectedExpense:
                        widget.expenseController.myExpenseList[index]),
                key: ValueKey(widget.expenseController.myExpenseList[index].id),
                child: ExpenseCard(
                  expenseData: widget.expenseController.myExpenseList[index],
                ),
              );
            },
          );
  }
}
