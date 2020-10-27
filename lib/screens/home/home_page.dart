import 'package:flutter/material.dart';
import 'package:meal_app_tutorial/providers/dummy_data.dart';
import 'package:meal_app_tutorial/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(cat.title, cat.color, cat.id);
      }).toList(),
    );
  }
}
