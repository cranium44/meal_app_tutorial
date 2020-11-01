import 'package:flutter/material.dart';
import 'package:meal_app_tutorial/models/meal.dart';
import 'package:meal_app_tutorial/widgets/category_meals_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favourites;

  FavouritesScreen(this._favourites);

  Widget build(BuildContext context) {
    return Column(
      children: [
        _favourites.isEmpty
            ? Center(
                child: Text("Favs boi!!"),
              )
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return CategoryMealItem(_favourites[index]);
                  },
                  itemCount: _favourites.length,
                ),
              ),
      ],
    );
  }
}
