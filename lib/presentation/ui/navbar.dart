import 'package:flutter/material.dart';
import 'package:my_first_getx_app/presentation/pages/category/category_screen.dart';
import 'package:my_first_getx_app/presentation/pages/home/home_screen.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: [const HomeScreen(), const CategoryScreen()][screenIndex]),
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
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
        ],
      ),
    );
  }
}
