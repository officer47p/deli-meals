import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;
  MealItem(this.removeItem, {@required this.meal});

  String get complexityString {
    if (meal.complexity == Complexity.Simple) return "Simple";
    if (meal.complexity == Complexity.Challenging) return "Challenging";
    if (meal.complexity == Complexity.Hard) return "Hard";

    return "Unknown";
  }

  String get affordabilityString {
    if (meal.affordability == Affordability.Affordable) return "Affordable";
    if (meal.affordability == Affordability.Pricey) return "Pricey";
    if (meal.affordability == Affordability.Luxurious) return "Luxurious";

    return "Unknown";
  }

  void selectMeal(BuildContext ctx) async {
    var result = await Navigator.of(ctx)
        .pushNamed(MealDetailScreen.name, arguments: meal);
    if (result != null) removeItem(result);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    color: Colors.black54,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${meal.duration} min")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${complexityString}")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${affordabilityString}")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
