import '../models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const name = "./meal-detail";
  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Details"),
      ),
      body: Container(
        child: Center(
          child: Text(meal.title),
        ),
      ),
    );
  }
}
