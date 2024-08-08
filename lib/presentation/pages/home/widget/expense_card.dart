import 'package:flutter/material.dart';
import 'package:my_first_getx_app/constants/variables.dart';
import 'package:my_first_getx_app/data/model/expense_model.dart';
import 'package:my_first_getx_app/presentation/ui/custom_pentagon_shape.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseModel expenseData;
  const ExpenseCard({super.key, required this.expenseData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.isTablet ? 25 : 20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              context.width < 260
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customPentagon(
                        color: context.colorScheme.primary,
                        childWidget: SizedBox(
                          width: context.isTablet ? 50 : 40,
                          height: context.isTablet ? 60 : 50,
                          child: Icon(
                            categoryIcons[expenseData.category],
                            color: context.colorScheme.onPrimary,
                            size: context.isTablet ? 35 : 30,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                width: context.isTablet ? 20 : 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(expenseData.title.toString(),
                      style: TextStyle(
                          color: context.colorScheme.onPrimaryContainer,
                          fontSize: context.isTablet ? 16 : 14,
                          fontWeight: FontWeight.bold)),
                  Text(expenseData.formatDate,
                      style: TextStyle(
                          color: context.colorScheme.onPrimaryContainer,
                          fontSize: context.isTablet ? 14 : 12,
                          fontWeight: FontWeight.normal)),
                ],
              ),
              const Spacer(),
              Text("₹${expenseData.amount}",
                  style: TextStyle(
                      color: context.colorScheme.onSecondaryContainer,
                      fontSize: context.isTablet ? 16 : 14,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
