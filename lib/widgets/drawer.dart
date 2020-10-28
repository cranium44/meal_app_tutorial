import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function handler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 22),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up!",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ),
          _buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          _buildListTile('Filters', Icons.settings, () {}),
        ],
      ),
    );
  }
}
