import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double duration;
  final Complexity complexity;

  final Affordability affordability;

  MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.affordability,
    required this.duration,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';

      case Complexity.Challenging:
        return 'challenging';
      case Complexity.Hard:
        return 'hard';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Pricey:
        return 'pricey';
      case Affordability.Affordable:
        return 'affordable';
      case Affordability.Luxurious:
        return 'luxurious';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MealDetail.routeName, arguments: id);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        //padding: EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 5),
                  //  alignment: Alignment.bottomRight,
                  color: Color.fromARGB(204, 36, 36, 36),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.punch_clock_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text('$duration min')
                      ],
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 5,
                        ),
                        Text('$complexityText')
                      ],
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.currency_bitcoin),
                        SizedBox(
                          width: 5,
                        ),
                        Text('$affordabilityText')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
