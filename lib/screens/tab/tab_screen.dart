import 'package:flutter/material.dart';
import 'package:meal_app_tutorial/screens/favourites_screen.dart';
import 'package:meal_app_tutorial/screens/home/home_page.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavouritesScreen(),
  ];

  int _pageSelectedIndex = 0;

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
          title: Text("Meals"),
        ),
        body: _pages[_pageSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          onTap: _selectPage,
          currentIndex: _pageSelectedIndex,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ]),
      ),
    );
  }
}
