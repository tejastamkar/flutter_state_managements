import 'package:flutter/material.dart';
import 'package:my_first_getx_app/constants/data.dart';
import 'package:my_first_getx_app/data/model/category_model.dart';
import 'package:my_first_getx_app/domain/use_cases/meals_controller.dart';
import 'package:my_first_getx_app/presentation/pages/meals/meals.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryData;
  final MealsController mealsController;
  const CategoryCard(
      {super.key, required this.categoryData, required this.mealsController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealsScreen(
                      title: categoryData.title,
                      onToggleFavorite: (meal) {
                        mealsController.toggleFav(meal);
                      },
                      meals: dummyMeals
                          .where((meal) =>
                              meal.categories.contains(categoryData.id))
                          .toList(),
                    )));
      },
      splashColor: context.colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                categoryData.color.withOpacity(0.55),
                categoryData.color.withOpacity(0.9),
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryData.title,
            style: TextStyle(
              color: context.colorScheme.onPrimaryContainer,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
