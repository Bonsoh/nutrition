import 'package:flutter/material.dart';
import 'food.dart';

class NutritionDay with ChangeNotifier {
  late String date; // id
  List<Food> _breakfast = [];
  List<Food> _lunch = [];
  List<Food> _dinner = [];
  List<Food> _snack = [];

  List<Food> get breakfast => [..._breakfast];
  List<Food> get lunch => [..._lunch];
  List<Food> get dinner => [..._dinner];
  List<Food> get snack => [..._snack];

  void addFood(int mealId, List<Food> list) {
    if (mealId == 0) {
      _breakfast = [..._breakfast, ...list];
    } else if (mealId == 1) {
      _lunch = [..._lunch, ...list];
    } else if (mealId == 2) {
      _dinner = [..._dinner, ...list];
    } else if (mealId == 3){
      _snack = [..._snack, ...list];
    }
    notifyListeners();
  }

  void updateFood(int mealId, int foodIndex, Food newFood) {
    if (mealId == 0) {
      _breakfast[foodIndex] = newFood;
    } else if (mealId == 1) {
      _lunch[foodIndex] = newFood;
    } else if (mealId == 2) {
      _dinner[foodIndex] = newFood;
    } else if (mealId == 3){
      _snack[foodIndex] = newFood;
    }
    notifyListeners();
  }

  void deleteFood(int mealId, int foodIndex) {
    if (mealId == 0) {
      _breakfast.removeAt(foodIndex);
    } else if (mealId == 1) {
      _lunch.removeAt(foodIndex);
    } else if (mealId == 2) {
      _dinner.removeAt(foodIndex);
    } else if (mealId == 3){
      _snack.removeAt(foodIndex);
    }
    notifyListeners();
  }

  /// Get Totals
  int getTotalMealCalories(List<Food> list) {
    int total = 0;
    for (var element in list) {
      total += element.calories;
    }
    return total;
  }

  int get getTotalCalories {
    int total = 0;
    for (var element in _breakfast) {
      total += element.calories;
    }
    for (var element in _lunch) {
      total += element.calories;
    }
    for (var element in _dinner) {
      total += element.calories;
    }
    for (var element in _snack) {
      total += element.calories;
    }
    return total;
  }

  int get getTotalCarbs {
    double total = 0;
    for (var element in _breakfast) {
      total += element.carbs;
    }
    for (var element in _lunch) {
      total += element.carbs;
    }
    for (var element in _dinner) {
      total += element.carbs;
    }
    for (var element in _snack) {
      total += element.carbs;
    }
    return total.round();
  }

  int get getTotalFat {
    double total = 0;
    for (var element in _breakfast) {
      total += element.fat;
    }
    for (var element in _lunch) {
      total += element.fat;
    }
    for (var element in _dinner) {
      total += element.fat;
    }
    for (var element in _snack) {
      total += element.fat;
    }
    return total.round();
  }

  int get getTotalProtein {
    double total = 0;
    for (var element in _breakfast) {
      total += element.protein;
    }
    for (var element in _lunch) {
      total += element.protein;
    }
    for (var element in _dinner) {
      total += element.protein;
    }
    for (var element in _snack) {
      total += element.protein;
    }
    return total.round();
  }
}
