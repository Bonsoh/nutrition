import '../models/nutrition_day.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nutrition_total_card.dart';
import 'nutrition_meal_card.dart';

class NutritionOverview extends StatefulWidget {
  const NutritionOverview({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  _NutritionOverviewState createState() => _NutritionOverviewState();
}

class _NutritionOverviewState extends State<NutritionOverview> {

  @override
  Widget build(BuildContext context) {
    final nutritionDay = Provider.of<NutritionDay>(context);
    return Column(
            children: [
              TotalNutritionCard(),
              const SizedBox(height: 20),
              NutritionMealCard(
                mealId: 0,
                foodList: nutritionDay.breakfast,
              ),
              const SizedBox(height: 20),
              NutritionMealCard(
                mealId: 1,
                foodList: nutritionDay.lunch,
              ),
              const SizedBox(height: 20),
              NutritionMealCard(
                mealId: 2,
                foodList: nutritionDay.dinner,
              ),
              const SizedBox(height: 20),
              NutritionMealCard(
                mealId: 3,
                foodList: nutritionDay.snack,
              ),
            ],
          );
  }
}
