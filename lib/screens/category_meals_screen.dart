import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String name = "/category-meals";
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<String> exceptionalItems = [];
  String categoryTitle;
  String categoryId;
  List meals;
  bool haveFetchedData = false;

  @override
  void initState() {
    // meals = widget.availableMeals;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!haveFetchedData) {
      final passedArgs = (ModalRoute.of(context).settings.arguments as Map);
      categoryTitle = passedArgs["title"];
      categoryId = passedArgs["id"];
      meals = widget.availableMeals.where((item) {
        return item.categories.contains(categoryId);
      }).toList();
      haveFetchedData = true;
    }
    super.didChangeDependencies();
  }

  void removeItem(String id) {
    setState(() {
      meals.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(meals);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(removeItem, meal: meals[i]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
