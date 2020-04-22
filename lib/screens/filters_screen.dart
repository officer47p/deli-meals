import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String name = "/filters-screen";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function clbk) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: clbk,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // color: Colors.pink.withOpacity(0.4),
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  "Gluten-free",
                  "Only include gluten-free meals.",
                  _glutenFree,
                  (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals.",
                  _vegan,
                  (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meals.",
                  _vegetarian,
                  (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Lactose-free",
                  "Only include lactose-free meals.",
                  _lactoseFree,
                  (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
