import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filtersscreen';
  final Function(Map<String, bool>) updateFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.updateFilters, this.currentFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilters['gluten'] ?? false;
    isLactoseFree = widget.currentFilters['lactose'] ?? false;
    isVegetarian = widget.currentFilters['vegetarian'] ?? false;
    isVegan = widget.currentFilters['vegan'] ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              widget.updateFilters({
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegetarian': isVegetarian,
                'vegan': isVegan
              });
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust Your Meal Selection',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchTile(
                      "Gluten Free",
                      'Only include gluten free meals',
                      isGlutenFree, (newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  }),
                  buildSwitchTile(
                      'Lactose Free',
                      'Only include lactose free meals',
                      isLactoseFree, (newValue) {
                    setState(() {
                      isLactoseFree = newValue;
                    });
                  }),
                  buildSwitchTile('Vegetarian', 'Only include vegetarian meals',
                      isVegetarian, (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  }),
                  buildSwitchTile('Vegan', 'Only include vegan meals', isVegan,
                      (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SwitchListTile buildSwitchTile(
      String title, String subtitle, bool value, Function(bool) handler) {
    return SwitchListTile(
        activeColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
        value: value,
        subtitle: Text(subtitle),
        onChanged: handler);
  }
}
