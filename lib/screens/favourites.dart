import 'package:flutter/material.dart';
import 'package:meals_app/screens/category-meals.dart';
import '../models/meal.dart';
import '../widgets/meal-item.dart';

class Favourites extends StatelessWidget {
  List<Meal> favouriteMeals;

  Favourites(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.length == 0) {
      return Center(
        child: Text('no favorite meal!!'),
      );
    } else {
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: ((context, index) {
          return MealItem(
            imageUrl: favouriteMeals[index].imageUrl,
            id: favouriteMeals[index].id,
            duration: favouriteMeals[index].duration,
            title: favouriteMeals[index].title,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
          );
        }),
      );
    }
  }
}
