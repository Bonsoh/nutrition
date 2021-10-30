import '../custom/constants.dart';
import '../nutrition/nutrition_overview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  int index = 0;

  List<DateTime> get day {
    var todayDate = DateTime.now();
    return List.generate(7, (index) {
      return todayDate.subtract((Duration(days: index)));
    });
  }

  void previousDay() {
    if (index != 6) {
      index++;
      setState(() {});
    }
  }

  void nextDay() {
    if (index != 0) {
      index--;
      setState(() {});
    }
  }

  Widget buildDatePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: (index == 6) ? null: previousDay,
            icon: Icon(Icons.keyboard_arrow_left, color: (index == 6) ? kSecondaryColor : null,)),
        Text((index == 0) ? 'Heute' : DateFormat('dd.MM.yy').format(day[index])),
        IconButton(
            onPressed: (index == 0) ? null : nextDay,
            icon: Icon(Icons.keyboard_arrow_right, color: (index == 0) ? kSecondaryColor : null,)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalorienzähler'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildDatePicker(),
            NutritionOverview(date: day[index]),
          ],
        ),
      ),
    );
  }
}
