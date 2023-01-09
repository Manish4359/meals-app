import 'package:flutter/material.dart';
import './categories.dart';
import './favourites.dart';
import './../widgets/drawer.dart';
import '../models/meal.dart';

class Tabs extends StatelessWidget {
  List<Meal> favouriteMeals;

  Tabs(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.category),
                  Text('Categories'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_border_outlined),
                  Text('Favourites '),
                ],
              ),
            ),
          ]),
        ),
        body: TabBarView(children: [
          Categories(),
          Favourites(this.favouriteMeals),
        ]),
      ),
    );
  }
}
