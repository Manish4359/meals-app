import 'package:flutter/material.dart';
import 'package:meals_app/screens/category-meals.dart';
import '../dummy-data.dart';

class CategoryItem extends StatelessWidget {
  String id;
  String title;
  Color color;
  CategoryItem(
      {Key? key, required this.id, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //    Navigator.pushn(context, _createRoute(catId: id, catTitle: title));
        Navigator.pushNamed(context, CategoryMeals.routeName,
            arguments: {'id': id, 'title': title});
      },
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [color, color.withOpacity(.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

/*
Route _createRoute({required String catId, required String catTitle}) {
  return PageRouteBuilder(
    settings: RouteSettings(),
    pageBuilder: (context, animation, secondaryAnimation) => CategoryMeals(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset(0, 0);

      var curve = Curves.ease;
      var curveTween = CurveTween(curve: curve);
      final tween = Tween(begin: begin, end: end).chain(curveTween);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
*/
