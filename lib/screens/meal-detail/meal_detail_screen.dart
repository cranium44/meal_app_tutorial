import 'package:flutter/material.dart';
import 'package:meal_app_tutorial/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function _toggleFavourites;
  final Function _isFavouriteMeal;

  MealDetailScreen(this._toggleFavourites, this._isFavouriteMeal);

  Widget buildListContainer({Widget child}) {
    return Container(
      height: 180,
      width: 300,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Meal>;
    final meal = routeArgs['meal'];
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildListContainer(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(meal.ingredients[index]),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildListContainer(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('# ${index + 1}'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(meal.steps[index]),
                        ),
                      ),
                      Divider(
                        color: Colors.black54,
                      ),
                    ],
                  );
                },
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _toggleFavourites(meal.id);
        },
        child:
            Icon(_isFavouriteMeal(meal.id) ? Icons.star : Icons.star_outline),
      ),
    );
  }
}
