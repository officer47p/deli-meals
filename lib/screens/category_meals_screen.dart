import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String name = "/category-meals";
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final passedArgs = (ModalRoute.of(context).settings.arguments as Map);
    final categoryTitle = passedArgs["title"];
    final categoryId = passedArgs["id"];
    final meals = DUMMY_MEALS.where((item) {
      return item.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(meal: meals[i]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
