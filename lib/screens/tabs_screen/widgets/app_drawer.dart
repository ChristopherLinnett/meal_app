import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen/filters_screen_view.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  ListTile buildListTile(
      IconData icon, String title, String targetScreen, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.of(ctx).pushReplacementNamed(targetScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).canvasColor,
            child: Text("Cooking Up",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
          const SizedBox(height: 20),
          buildListTile(Icons.restaurant, 'Meals', '/', context),
          buildListTile(
              Icons.settings, 'Filters', FiltersScreen.routeName, context),
        ],
      ),
    );
  }
}
