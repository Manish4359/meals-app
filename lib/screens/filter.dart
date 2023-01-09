import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/category-meals.dart';
import '/widgets/drawer.dart';

class Filter extends StatefulWidget {
  static String routeName = '/filter';
  Function setfilter;
  Map<String, bool> filter;
  Filter(
    this.setfilter,
    this.filter, {
    Key? key,
  }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = true;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenfree = widget.filter['gluten'] as bool;
    _vegan = widget.filter['vegan'] as bool;
    _vegetarian = widget.filter['vegetarian'] as bool;
    _lactoseFree = widget.filter['lactose'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                widget.setfilter({
                  'gluten': _glutenfree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose': _lactoseFree
                });
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Set your meal selection',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SwitchListTile(
              onChanged: (_) {
                setState(() {
                  _glutenfree = !_glutenfree;
                });
              },
              value: _glutenfree,
              title: Text('Gluten free'),
            ),
            SwitchListTile(
              onChanged: (_) {
                setState(() {
                  _vegetarian = !_vegetarian;
                });
              },
              value: _vegetarian,
              title: Text('Vegetarian'),
            ),
            SwitchListTile(
              onChanged: (_) {
                setState(() {
                  _vegan = !_vegan;
                });
              },
              value: _vegan,
              title: Text('Vegan'),
            ),
            SwitchListTile(
              onChanged: (_) {
                setState(() {
                  _lactoseFree = !_lactoseFree;
                });
              },
              value: _lactoseFree,
              title: Text('Lactose free'),
            )
          ],
        ),
      ),
    );
  }
}
