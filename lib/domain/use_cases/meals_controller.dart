import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/meals_model.dart';
import 'package:my_first_getx_app/presentation/pages/meals/meal_details.dart';

class MealsController {
  // Private constructor
  MealsController._privateConstructor();

  // The single instance of MealsController
  static final MealsController _instance =
      MealsController._privateConstructor();

  // Factory constructor to return the same instance every time
  factory MealsController() {
    return _instance;
  }

  List<MealsModel> favMeals = [];

  void toggleFav(MealsModel meal) {
    if (favMeals.contains(meal)) {
      favMeals.remove(meal);
    } else {
      favMeals.add(meal);
    }
  }
}

void selectMeal(
    BuildContext context, MealsModel meal, Function onToggleFavorite) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => MealDetailsScreen(
        meal: meal,
        onToggleFavorite: (meal) {},
      ),
    ),
  );
}
