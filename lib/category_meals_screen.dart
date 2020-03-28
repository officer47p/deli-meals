import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final passedArgs = (ModalRoute.of(context).settings.arguments as Map);
    final categoryTitle = passedArgs["title"];
    final categoryId = passedArgs["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("The Recipes For The Category!"),
      ),
    );
  }
}
