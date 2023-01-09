import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';

import '../models/meal.dart';

class MealDetail extends StatefulWidget {
  static const routeName = '/meal-detail';
  Function toogleFavorite;
  List<Meal> favouriteMeals;
  MealDetail(this.toogleFavorite, this.favouriteMeals, {Key? key})
      : super(key: key);

  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  bool isFavorite = false;

  Widget buildSectionTitle(String title) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: Text(title),
    );
  }

  Widget buildContainer(context, List list) {
    return Container(
      height: 200,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black)),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: ((context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(list[index]),
                  ),
                ),
                Divider()
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == routeArgs);

    if (widget.favouriteMeals.any((meal) => meal.id == routeArgs)) {
      isFavorite = true;
    }

    return Scaffold(
      floatingActionButton: InkWell(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
              widget.toogleFavorite(routeArgs);
            });
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                  color: isFavorite ? Colors.amber : Colors.white, width: 2),
            ),
            child: Icon(
              Icons.star,
              //size: 40,
              color: isFavorite ? Colors.yellow : Colors.white,
            ),
          )),
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(selectedMeal.imageUrl),
            SizedBox(
              height: 30,
            ),
            buildSectionTitle('Ingredients'),
            SizedBox(
              height: 30,
            ),
            buildContainer(context, selectedMeal.ingredients),
            buildSectionTitle('Steps'),
            buildContainer(context, selectedMeal.steps),
          ],
        ),
      ),
    );
  }
}
