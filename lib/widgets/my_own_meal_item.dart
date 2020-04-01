import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  MealItem(this.meal);

  String compToString(Complexity comp) {
    if (comp == Complexity.Simple) return "Simple";
    if (comp == Complexity.Hard) return "Hard";
    if (comp == Complexity.Challenging) return "Challenging";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 300,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: Colors.pink.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: IconTheme(
              data: Theme.of(context).iconTheme.copyWith(
                    color: Colors.white,
                    size: 30,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.fitness_center),
                        Text(
                          compToString(meal.complexity),
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.credit_card),
                        Text(
                          compToString(meal.complexity),
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.fitness_center),
                        Text(
                          compToString(meal.complexity),
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // height: 250,
      // child: Card(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   child: Column(children: [
      //     Expanded(
      //       child: Stack(
      //         children: <Widget>[
      //           ClipRRect(
      //             borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(15),
      //               topRight: Radius.circular(15),
      //             ),
      //             child: Image.network(
      //               meal.imageUrl,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           Container(
      //             // alignment: Alignment.centerRight,
      //             child: Text("jfndsjk"),
      //           ),
      //         ],
      //       ),
      //     )
      //   ]),
      // ),
    );
  }
}
