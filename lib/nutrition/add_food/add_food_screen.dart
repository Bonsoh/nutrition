import '/custom/constants.dart';
import '/models/food.dart';
import '/models/nutrition_day.dart';
import '/nutrition/add_food/added_food_list_screen.dart';
import '/nutrition/add_food/fast_add.dart';
import '/nutrition/add_food/search_widget.dart';
import '/nutrition/food_edit/food_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({Key? key, required this.mealId, required this.foodList})
      : super(key: key);
  final int mealId;
  final List<Food> foodList;

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  String query = '';
  List<Food> searchResult = [];
  final List<String> mealName = [
    'Frühstück',
    'Mittagessen',
    'Abendessen',
    'Snack',
  ];

  /// list of recently added foods
  List<Food> tempList = [];

  void addFood(Food food) {
    tempList.add(food);
    setState(() {});
  }

  void doneAddFood() {
    Provider.of<NutritionDay>(context, listen: false).addFood(
      widget.mealId,
      tempList,
    );
    Navigator.of(context).pop();
  }

  int get foodCount {
    return tempList.length;
  }

  Widget buildSearch() {
    return SearchWidget(
      text: query,
      hintText: 'Search Food',
      onChanged: searchFood,
    );
  }

  Future searchFood(String query) async{

    /// Instead of this hardcoded search I want to use the API
    /// to search specific food and convert the json data into my food model

    final searchResult = MyLists.foodList.where((food) {
      final nameLower = food.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.searchResult = searchResult;
    });
  }

  Widget buildFood(Food food) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FoodEditScreen(food: food, tempList: tempList);
            },
          ),
        ).then((value) => setState(() {}));
      },
      title: Text(food.name),
      subtitle: Text((food.quantity * 100).toStringAsFixed(0) + ' g'),
      trailing: IconButton(
        onPressed: () {addFood(food);},
        icon: const Icon(Icons.add, color: kPrimaryColor,),
      )
    );
  }

  Future fastAdd() {
    return showDialog(
        context: context,
        builder: (context) => FastAddWidget(
            onAdded: addFood,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: tempList.isEmpty ? null : doneAddFood,
        child: tempList.isEmpty
            ? const Icon(
                Icons.check,
                color: Colors.black54,
              )
            : const Icon(
                Icons.check,
                color: Colors.black,
              ),
      ),
      appBar: AppBar(
        title: Text(mealName[widget.mealId]),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddedFoodListScreen(tempList: tempList);
                      },
                    ),
                  ).then((value) => setState(() {}));
                },
                child: Text(
                  foodCount.toString(),
                  style: const TextStyle(color: Colors.black),
                )),
          ),
          PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                PopupMenuItem(
                  child: ListTile(
                      title: const Text('Schneller Eintrag'),
                      onTap: () {
                        Navigator.pop(context);
                        fastAdd();
                      }),
                ),
              ]),
        ],
      ),
      body: Column(
        children: [
          buildSearch(),
          Expanded(
              child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    final food = searchResult[index];
                    return buildFood(food);
                  }))
        ],
      ),
    );
  }
}
