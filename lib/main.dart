import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen/categories_screen_view.dart';
import 'package:meal_app/screens/category_meals_screen/category_meals_screen_view.dart';
import 'package:meal_app/screens/filters_screen/filters_screen_view.dart';
import 'package:meal_app/screens/meal_detail_screen/meal_detail_screen_view.dart';
import 'package:meal_app/screens/tabs_screen/tabs_screen_view.dart';
import 'dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = dummyMeals;
  List<Meal> favouritedMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  bool isMealFavourite(String mealId) {
    return favouritedMeals.any((meal) => meal.id == mealId);
  }

  void toggleFavourite(String mealId) {
    final existingIndex =
        favouritedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favouritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouritedMeals.add(dummyMeals.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  void updateFilter(Map<String, bool> newFilter) {
    setState(() {
      _filters = newFilter;

      availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] != null &&
            _filters['gluten']! &&
            !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] != null &&
            _filters['lactose']! &&
            !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] != null &&
            _filters['vegetarian']! &&
            !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] != null && _filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
                .copyWith(secondary: Colors.redAccent),
            canvasColor: const Color.fromARGB(255, 255, 146, 146),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 50, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 50, 51, 1),
                ),
                headline6: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold))),
        home: TabsScreen(
          favouritedMeals: favouritedMeals,
        ),
        routes: {
          CategoriesScreen.routeName: ((context) => const CategoriesScreen()),
          CategoriesMealScreen.routeName: (context) =>
              CategoriesMealScreen(availableMeals: availableMeals),
          MealDetailScreen.routeName: (context) =>
              MealDetailScreen(toggleFavourite, isMealFavourite),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(updateFilter, _filters),
        });
  }
}
