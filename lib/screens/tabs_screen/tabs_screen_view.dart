import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen/categories_screen_view.dart';
import 'package:meal_app/screens/favourites_screen/favourites_screen_view.dart';
import 'package:meal_app/screens/tabs_screen/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouritedMeals;
  
  const TabsScreen({super.key, required this.favouritedMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages = [];
  int selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(favouritedMeals: widget.favouritedMeals),
        'title': 'Favourites'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: const MainDrawer(),
      body: (pages[selectedPageIndex]['page'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).backgroundColor,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
