import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'screens/categories.dart';
import 'screens/category-meals.dart';

import './screens/tabs.dart';
import './screens/filter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'vegetarian': true,
    'vegan': true,
    'lactose': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filter['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toogleFavourite(String mealId) {
    final existingId = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingId >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingId);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        // colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber),
        canvasColor: Color.fromARGB(255, 241, 241, 241),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromARGB(255, 184, 244, 54)),
            ),
      ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (context) => Tabs(_favouriteMeals),
        CategoryMeals.routeName: (context) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (context) =>
            MealDetail(_toogleFavourite, _favouriteMeals),
        Filter.routeName: (context) => Filter(_setFilter, _filter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Categories());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
