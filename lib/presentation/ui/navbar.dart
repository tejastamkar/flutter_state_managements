import 'package:flutter/material.dart';
import 'package:my_first_getx_app/domain/use_cases/meals_controller.dart';
import 'package:my_first_getx_app/presentation/pages/category/category_screen.dart';
import 'package:my_first_getx_app/presentation/pages/fav_meals/fav_meals_screen.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({
    super.key,
  });

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int screenIndex = 0;
  MealsController mealsController = MealsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: [
            CategoryScreen(
              mealsController: mealsController,
            ),
            FavMealsScreen(
              meals: mealsController.favMeals,
            ),
          ][screenIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        currentIndex: screenIndex,
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
