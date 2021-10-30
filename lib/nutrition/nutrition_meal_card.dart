import '../custom/constants.dart';
import '../custom/my_cards.dart';
import '../custom/text_ui.dart';
import '../models/food.dart';
import '../models/nutrition_day.dart';
import '../nutrition/add_food/add_food_screen.dart';
import '../nutrition/food_edit/food_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NutritionMealCard extends StatefulWidget {
  const NutritionMealCard(
      {Key? key, required this.mealId, required this.foodList})
      : super(key: key);
  final int mealId;
  final List<Food> foodList;

  @override
  _NutritionMealCardState createState() => _NutritionMealCardState();
}

class _NutritionMealCardState extends State<NutritionMealCard> {
  final List<String> mealName = [
    'Frühstück',
    'Mittagessen',
    'Abendessen',
    'Snack',
  ];

  void foodDetail(int foodIndex, String name) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(name),
              content: TextButton.icon(
                onPressed: () {
                  Provider.of<NutritionDay>(context, listen: false)
                      .deleteFood(widget.mealId, foodIndex);
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.delete_outline_outlined),
                label: const Text('Eintrag löschen'),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final nutritionDay = Provider.of<NutritionDay>(context, listen: false);
    return MyCard(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    mealName[widget.mealId],
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
                MyText(title: nutritionDay
                        .getTotalMealCalories(widget.foodList)
                        .toString() +
                    ' kcal'),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddFoodScreen(
                              mealId: widget.mealId,
                              foodList: widget.foodList,
                            );
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    )),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.foodList.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        onLongPress: () {
                          foodDetail(i, widget.foodList[i].name);
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FoodEditScreen(
                                    mealId: widget.mealId,
                                    foodIndex: i,
                                    food: widget.foodList[i]);
                              },
                            ),
                          );
                        },
                        title: Text(widget.foodList[i].name),
                        subtitle: Text(
                            (widget.foodList[i].quantity * 100).toStringAsFixed(0) +
                                ' g'),
                        trailing: Text(
                            widget.foodList[i].calories.toString() + ' kcal'),
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
