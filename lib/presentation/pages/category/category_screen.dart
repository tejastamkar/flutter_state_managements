import 'package:flutter/material.dart';
import 'package:my_first_getx_app/constants/data.dart';
import 'package:my_first_getx_app/presentation/pages/category/widgets/category_card.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                categoryData: availableCategories.elementAt(index));
          }),
    );
  }
}
