import '/custom/input_decoration.dart';
import '/custom/textinputform.dart';
import '/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FastAddWidget extends StatefulWidget {
  const FastAddWidget({
    Key? key,
    required this.onAdded,
  }) : super(key: key);
  final ValueChanged<Food> onAdded;

  @override
  State<FastAddWidget> createState() => _FastAddWidgetState();
}

class _FastAddWidgetState extends State<FastAddWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Food food = Food(
      id: DateTime.now().toString(),
      name: '',
      quantity: 1.0,
      calories: 0,
      carbs: 0.0,
      fat: 0.0,
      protein: 0.0,
    );
    return AlertDialog(
      title: const Text('Schneller Eintrag'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (name) {
                  if (name.isNotEmpty) {
                    food = Food(
                      id: food.id,
                      name: name,
                      calories: food.calories,
                      carbs: food.carbs,
                      fat: food.fat,
                      protein: food.protein,
                    );
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Bitte Namen eintragen';
                  }
                },
                decoration: myInputDecoration(
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (calories) {
                  if (calories.isNotEmpty && double.parse(calories) != 0) {
                    food = Food(
                      id: food.id,
                      name: food.name,
                      calories: int.parse(calories),
                      carbs: food.carbs,
                      fat: food.fat,
                      protein: food.protein,
                    );
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Bitte Kalorien eintragen';
                  }
                },
                decoration: myInputDecoration(
                  labelText: 'Kalorien',
                  suffixText: 'kcal',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  DecimalTextInputFormatter(),
                  LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (carbs) {
                  food = Food(
                    id: food.id,
                    name: food.name,
                    calories: food.calories,
                    carbs: carbs.isNotEmpty ? double.parse(carbs) : 0.0,
                    fat: food.fat,
                    protein: food.protein,
                  );
                },
                decoration: myInputDecoration(
                  labelText: 'Kohlenhydrate',
                  suffixText: 'g',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  DecimalTextInputFormatter(),
                  LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (fat) {
                  food = Food(
                    id: food.id,
                    name: food.name,
                    calories: food.calories,
                    carbs: food.carbs,
                    fat: fat.isNotEmpty ? double.parse(fat) : 0.0,
                    protein: food.protein,
                  );
                },
                decoration: myInputDecoration(
                  labelText: 'Fett',
                  suffixText: 'g',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  DecimalTextInputFormatter(),
                  LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (protein) {
                  food = Food(
                    id: food.id,
                    name: food.name,
                    calories: food.calories,
                    carbs: food.carbs,
                    fat: food.fat,
                    protein: protein.isNotEmpty ? double.parse(protein) : 0.0,
                  );
                },
                decoration: myInputDecoration(
                  labelText: 'Protein',
                  suffixText: 'g',
                  isDense: true,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onAdded(food);
                Navigator.pop(context);
              }
            },
            child: const Text('Hinzufügen')),
      ],
    );
  }
}
