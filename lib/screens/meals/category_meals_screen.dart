import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String title;

  CategoryMealsScreen({this.title = "cool"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(child: Text("sup"),),
    );
  }
}
