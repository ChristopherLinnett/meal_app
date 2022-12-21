import 'package:flutter/material.dart';

import 'package:meal_app/screens/category_meals_screen/category_meals_screen_view.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color colour;
  final String id;
  const CategoryItem(
      {super.key, required this.title, required this.colour, required this.id});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoriesMealScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colour.withOpacity(.7), colour],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
