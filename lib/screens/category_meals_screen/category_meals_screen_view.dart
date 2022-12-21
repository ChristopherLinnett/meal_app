import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen/widgets/meal_item.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = 'Categories-Meal';
  final List<Meal> availableMeals;
  const CategoriesMealScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routeArgs['id'];
    final String? categoryTitle = routeArgs['title'];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle ?? 'None')),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                  id: categoryMeals[index].id,
                  imageUrl: categoryMeals[index].imageUrl,
                  title: categoryMeals[index].title,
                  duration: categoryMeals[index].duration,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity);
            },
            itemCount: categoryMeals.length),
      ),
    );
  }
}
