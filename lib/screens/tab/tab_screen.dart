import 'package:flutter/material.dart';
import 'package:meal_app_tutorial/models/meal.dart';
import 'package:meal_app_tutorial/screens/favourites_screen.dart';
import 'package:meal_app_tutorial/screens/home/categories_screen.dart';
import 'package:meal_app_tutorial/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> _favourites;

  TabScreen(this._favourites);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  int _pageSelectedIndex = 0;

  @override
  initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(widget._favourites),
        'title': 'My Favourites',
      }
    ];
    super.initState();
  }

  _selectPage(int index) {
    setState(() {
      _pageSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_pageSelectedIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_pageSelectedIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            onTap: _selectPage,
            currentIndex: _pageSelectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: "Favourites"),
            ]),
      ),
    );
  }
}
