import 'package:dev/custom/constants.dart';
import 'package:dev/custom/input_decoration.dart';
import 'package:dev/custom/textinputform.dart';
import 'package:dev/models/food.dart';
import 'package:dev/models/nutrition_day.dart';
import 'package:dev/services/round_double.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FoodEditScreen extends StatefulWidget {
  const FoodEditScreen({
    Key? key,
    this.mealId,
    this.foodIndex,
    required this.food,
    this.tempList,
  }) : super(key: key);
  final int? mealId;
  final int? foodIndex;
  final Food food;
  final List<Food>? tempList;

  @override
  State<FoodEditScreen> createState() => _FoodEditScreenState();
}

class _FoodEditScreenState extends State<FoodEditScreen> {
  late double quantity;
  late Food food;

  /// using mealId to check if user edit existing Food or try to add new Food

  @override
  void initState() {
    super.initState();
    quantity = widget.food.quantity;
    food = widget.food;
  }

  void updateFood() {
    food = Food(
      id: widget.food.id,
      name: widget.food.name,
      quantity: quantity,
      calories:
          ((widget.food.calories / widget.food.quantity) * quantity).round(),
      carbs: Round.toDouble(
          (widget.food.carbs / widget.food.quantity) * quantity, 1),
      fat: Round.toDouble(
          (widget.food.fat / widget.food.quantity) * quantity, 1),
      protein: Round.toDouble(
          (widget.food.protein / widget.food.quantity) * quantity, 1),
    );
  }

  void doneUpdateFood() {
    if (widget.mealId != null && widget.foodIndex != null) {
      Provider.of<NutritionDay>(context, listen: false).updateFood(
        widget.mealId!,
        widget.foodIndex!,
        food,
      );
    }
    Navigator.of(context).pop();
  }

  void doneAddFood() {
    if (widget.tempList != null) {
      widget.tempList!.add(food);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: widget.mealId != null
            ? const Text('Eintrag bearbeiten')
            : const Text('Lebensmittel hinzufügen'),
        actions: [
          IconButton(
              onPressed: widget.mealId != null ? doneUpdateFood : doneAddFood,
              icon: const Icon(Icons.check)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          Text(
            widget.food.name,
            style: const TextStyle(fontSize: 24),
          ),
          SizedBox(height: size.height * 0.1),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            color: kDecentColor,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Expanded(
                            flex: 2, child: Text('Anzahl an Portionen')),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            initialValue: quantity.toString(),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              DecimalTextInputFormatter(),
                              LengthLimitingTextInputFormatter(4),
                            ],
                            onChanged: (value) {
                              if (value.isNotEmpty && double.parse(value) != 0) {
                                quantity = double.parse(value);
                                updateFood();
                                setState(() {});
                              }
                            },
                            decoration: myInputDecoration(
                              isDense: true,
                              hintText: 'Menge',
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        SizedBox(width: 20),
                        Expanded(flex: 2, child: Text('Portionsgröße')),
                        Expanded(
                            flex: 1,
                            child: Text(
                              '100 g',
                              textAlign: TextAlign.end,
                            )),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(food.calories.toString()),
                        const Text('Kalorien'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(food.carbs.toString() + ' g'),
                        const Text('Kohlenhydrate'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(food.fat.toString() + ' g'),
                        const Text('Fett'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(food.protein.toString() + ' g'),
                        const Text('Protein'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
