import 'package:flutter/material.dart';
import 'package:my_first_getx_app/constants/data.dart';
import 'package:my_first_getx_app/domain/use_cases/meals_controller.dart';
import 'package:my_first_getx_app/presentation/pages/category/widgets/category_card.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class CategoryScreen extends StatelessWidget {
  final MealsController mealsController;
  const CategoryScreen({super.key, required this.mealsController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Category"),
        centerTitle: false,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              crossAxisCount: context.isTablet ? 4 : 2),
          itemCount: availableCategories.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CategoryCard(
                mealsController: mealsController,
                categoryData: availableCategories.elementAt(index));
          }),
    );
  }
}
