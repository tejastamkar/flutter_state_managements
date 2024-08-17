import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/meals_model.dart';
import 'package:my_first_getx_app/presentation/pages/meals/widgets/meal_item.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class FavMealsScreen extends StatelessWidget {
  final List<MealsModel> meals;
  const FavMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: context.isTablet ? 24 : 18),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {},
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Meals"),
          centerTitle: context.isTablet ? false : true,
        ),
        body: content);
  }
}
