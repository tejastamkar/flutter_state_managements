import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/meals_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final MealsModel meal;
  final void Function(MealsModel meal) onSelectMeal;
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
          ),
          Text(meal.title)
        ]));
  }
}
