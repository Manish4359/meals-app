import 'package:flutter/material.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final double duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isVegan;
  final bool isLactoseFree;

  Meal({
    required this.affordability,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.isGlutenFree,
    required this.id,
    required this.imageUrl,
    required this.ingredients,
    required this.isLactoseFree,
    required this.steps,
    required this.title,
    required this.isVegan,
    required this.isVegetarian,
  });
}
