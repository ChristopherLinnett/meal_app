import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key, required this.favouritedMeals});
  final List<Meal> favouritedMeals;

  @override
  Widget build(BuildContext context) {
    if (favouritedMeals.isEmpty) {
      return Center(
          child: Text('Add Some Favourites to View Them Here',
              style: Theme.of(context).textTheme.headline6));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favouritedMeals[index].id,
              imageUrl: favouritedMeals[index].imageUrl,
              title: favouritedMeals[index].title,
              duration: favouritedMeals[index].duration,
              affordability: favouritedMeals[index].affordability,
              complexity: favouritedMeals[index].complexity);
        },
        itemCount: favouritedMeals.length,
      );
    }
  }
}
