import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen/widgets/category_item.dart';
import '../../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const routeName = 'Categories';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: dummyCategories
          .map((category) => CategoryItem(
              title: category.title, colour: category.color, id: category.id))
          .toList(),
    );
  }
}
