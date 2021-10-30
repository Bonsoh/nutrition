class Food {
  final String id;
  final String name;
  final double quantity;
  final int calories;
  final double carbs;
  final double fat;
  final double protein;

  Food({
    required this.id,
    required this.name,
    this.quantity = 1.0,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  /// convert json data to food model
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['_id'] as String,
      name: json['product_name'] as String,
      quantity: 1.0,
      calories: int.parse(json['energy-kcal'].toStringAsFixed(0)),
      carbs: json['carbohydrates_100g'] as double,
      fat: json['fat_100g'] as double,
      protein: json['proteins_100g'] as double,
    );
  }
}
