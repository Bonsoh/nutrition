import '../models/nutrition_day.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/custom/my_cards.dart';
import '/custom/text_ui.dart';

class TotalNutritionCard extends StatelessWidget {
  const TotalNutritionCard({Key? key}) : super(key: key);

  final calories = 0; //UserManager.userdata!['calorieIntake'] ?? 0
  final carbs = 0; //UserManager.userdata!['goalCarbs'] ?? 0
  final fat = 0; //UserManager.userdata!['goalFat'] ?? 0
  final protein = 0; //UserManager.userdata!['goalProtein'] ?? 0

  @override
  Widget build(BuildContext context) {
    final nutritionDay = Provider.of<NutritionDay>(context, listen: false);
    return MyCard(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: MyHeadText(
                          title:
                          nutritionDay.getTotalCalories.toString() + ' kcal',
                        ),
                      ),
                      const Center(child: Text('Gegessen')),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Center(
                          child: MyHeadText(
                              title: (calories)
                                  .toString() +
                                  ' kcal')),
                      const Center(child: Text('Ziel')),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 50),
            Row(
              children: const [
                Expanded(
                    child: Center(
                        child: Text('Kohlenhydrate'))),
                Expanded(
                    child: Center(child: Text('Fett'))),
                Expanded(
                    child: Center(child: Text('Protein'))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Center(
                        child: Text(
                            nutritionDay.getTotalCarbs.toString() +
                                ' / ' +
                                ((carbs).toString() + 'g')))),
                Expanded(
                    child: Center(
                        child: Text(nutritionDay.getTotalFat.toString() +
                            ' / ' +
                            ((fat).toString() + 'g')))),
                Expanded(
                    child: Center(
                        child: Text(nutritionDay.getTotalProtein.toString() +
                            ' / ' +
                            ((protein).toString() + 'g')))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}