import 'package:flutter/material.dart';
import 'package:my_first_getx_app/constants/data.dart';
import 'package:my_first_getx_app/data/model/category_model.dart';
import 'package:my_first_getx_app/presentation/pages/meals/meals.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryData;
  const CategoryCard({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealsScreen(
                      title: categoryData.title,
                      onToggleFavorite: (meal) {},
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
