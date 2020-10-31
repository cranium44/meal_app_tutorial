import 'package:flutter/material.dart';
import 'package:meal_app_tutorial/providers/dummy_data.dart';
import 'package:meal_app_tutorial/screens/filters_screen.dart';
import 'package:meal_app_tutorial/screens/meal-detail/meal_detail_screen.dart';
import 'package:meal_app_tutorial/screens/meals/category_meals_screen.dart';
import 'package:meal_app_tutorial/screens/tab/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegetarian': false,
    'vegan': false,
  };

  var _availableMeals = DUMMY_MEALS;

  _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten-free'] && !meal.isGlutenFree) return false;
        if (_filters['lactose-free'] && !meal.isLactoseFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 233, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(23, 23, 20, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(23, 23, 20, 1),
            ),
            headline1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabScreen(),
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
