import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_getx_app/constants/variables.dart';
import 'package:my_first_getx_app/data/model/expense_model.dart';
import 'package:my_first_getx_app/domain/use_cases/expense_controller.dart';
import 'package:my_first_getx_app/utils/custom_date_picker.dart';
import 'package:my_first_getx_app/utils/error_dialog_box.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class AddExpenseScreen extends StatefulWidget {
  final ExpenseController expenseController;
  final void Function({required ExpenseModel expense}) onRefresh;
  const AddExpenseScreen(
      {super.key, required this.expenseController, required this.onRefresh});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DateTime? expenseDate;
  Set<Category> segmentedCategories = {
    Category.food,
    Category.travel,
    Category.leisure,
    Category.work,
  };
  Set selectedCategory = {
    Category.food.name,
  };

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (titleController.text.trim().isEmpty ||
        amountController.text.trim().isEmpty ||
        expenseDate == null) {
      showErrorDialog(context: context, message: "Please fill all the fields");
      return;
    }

    if (double.tryParse(amountController.text) == null ||
        double.parse(amountController.text) <= 0) {
      showErrorDialog(context: context, message: "Please enter a valid amount");

      return;
    }
    ExpenseModel expense = ExpenseModel(
      id: uuid.v4(),
      title: titleController.text,
      amount: double.parse(amountController.text),
      date: expenseDate!.toUtc(),
      category: Category.values
          .firstWhere((element) => element.name == selectedCategory.first),
    );
    widget.onRefresh(expense: expense);
    Navigator.pop(context);
  }

  void onClose() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.isTablet ? 25 : 20),
          topRight: Radius.circular(context.isTablet ? 25 : 20),
        ),
        child: Scaffold(
            bottomNavigationBar: !context.isTablet
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(context.width / 2.4, 40),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: onClose,
                          child: Text("Close",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.isTablet ? 16 : 14)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(context.width / 2.4, 40),
                            backgroundColor: context.colorScheme.primary,
                            foregroundColor: context.colorScheme.onPrimary,
                          ),
                          onPressed: onSubmit,
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.isTablet ? 16 : 14),
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "Add Expense",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onPrimaryContainer),
                    ),
                    const Spacer(),
                    context.isTablet
                        ? Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: context.colorScheme.error,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: onClose,
                                child: Text("Close",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: context.isTablet ? 16 : 14)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: context.colorScheme.primary,
                                  foregroundColor:
                                      context.colorScheme.onPrimary,
                                ),
                                onPressed: onSubmit,
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.isTablet ? 16 : 14),
                                ),
                              )
                            ],
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                TextField(
                  controller: titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: "Title of Expense",
                    counterText: "",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: "₹",
                          labelText: "Amount",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          expenseDate = await openDatePicker(
                              context: context, initialDate: expenseDate);
                          setState(() {});
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              expenseDate == null
                                  ? "Select Date"
                                  : DateFormat("dd MMM yyyy")
                                      .format(expenseDate!),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context.colorScheme.onPrimaryContainer,
                                  fontSize: context.isTablet ? 16 : 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.calendar_month,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SegmentedButton(
                    showSelectedIcon: false,
                    multiSelectionEnabled: false,
                    onSelectionChanged: (p0) {
                      selectedCategory = p0;
                      setState(() {});
                    },
                    segments: [
                      ...categoryIcons.entries.map((e) => ButtonSegment(
                            value: e.key.name,
                            enabled: true,
                            label: Text(e.key.name,
                                style: TextStyle(
                                    fontSize: context.isTablet ? 25 : 15)),
                          )),
                    ],
                    selected: selectedCategory)
              ]),
            )),
      ),
    );
  }
}
