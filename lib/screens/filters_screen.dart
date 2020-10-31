import 'package:flutter/material.dart';
import 'package:meal_app_tutorial/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this._currentFilters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  Widget _buildSwitch(
      String title, String description, bool value, Function handler) {
    return SwitchListTile(
      value: value,
      onChanged: handler,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  void initState() {
    _gluttenFree = widget._currentFilters['gluten-free'];
    _lactoseFree = widget._currentFilters['lactose-free'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _vegan = widget._currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              var filtersData = {
                'gluten-free': _gluttenFree,
                'lactose-free': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.setFilters(filtersData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Set meal filters",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitch("Gluten Free", "Display only gluten free meals",
                    _gluttenFree, (value) {
                  setState(() {
                    _gluttenFree = value;
                  });
                }),
                _buildSwitch("Lactose Free", "Display only lactose free meals",
                    _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                _buildSwitch(
                    "Vegetarian", "Display only vegetarian meals", _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buildSwitch("Vegan", "Display only vegan meals", _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
