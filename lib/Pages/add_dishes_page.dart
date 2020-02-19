import 'package:flutter/material.dart';
import 'package:top/model/dishes_model.dart';

class AddDishesPage extends StatefulWidget {
  final Dishes dishes;

  AddDishesPage({this.dishes});
  @override
  _AddDishesPageState createState() => _AddDishesPageState();
}

class _AddDishesPageState extends State<AddDishesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What did you like to today?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
