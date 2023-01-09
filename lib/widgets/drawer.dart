import 'package:flutter/material.dart';

import './../screens/filter.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String text, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      selectedTileColor: Colors.green.withOpacity(0.4),
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Colors.amber,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant_menu, 'meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListTile(Icons.filter_alt, 'filter', () {
            Navigator.of(context).pushReplacementNamed(Filter.routeName);
          })
        ],
      ),
    );
  }
}
