import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/meals_model.dart';
import 'package:my_first_getx_app/utils/extensions.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final MealsModel meal;
  final void Function(MealsModel meal) onSelectMeal;
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.isTablet ? 20 : 16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.isTablet ? 20 : 16),
        child: InkWell(
          borderRadius: BorderRadius.circular(context.isTablet ? 20 : 16),
          onTap: () => onSelectMeal(meal),
          child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.hardEdge,
              children: [
                Hero(
                  tag: meal.title,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                      meal.imageUrl,
                    ),
                    fit: BoxFit.cover,
                    height:
                        context.heightPercentage(context.isTablet ? 40 : 20),
                    width: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Column(children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.isTablet ? 20 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        mealItemDescription(
                            context: context,
                            description: "${meal.duration} min",
                            icon: Icons.schedule),
                        const SizedBox(
                          width: 10,
                        ),
                        mealItemDescription(
                            context: context,
                            description: complexityText,
                            icon: Icons.work),
                        const SizedBox(
                          width: 10,
                        ),
                        mealItemDescription(
                            context: context,
                            description: affordabilityText,
                            icon: Icons.attach_money),
                      ],
                    )
                  ]),
                ),
              ]),
        ),
      ),
    );
  }
}

Widget mealItemDescription(
    {required BuildContext context,
    required String description,
    required IconData icon}) {
  return Row(children: [
    Icon(
      icon,
      color: Colors.white,
    ),
    const SizedBox(width: 4),
    Text(
      description,
      style:
          TextStyle(color: Colors.white, fontSize: context.isTablet ? 16 : 12),
    )
  ]);
}
