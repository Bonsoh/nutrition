import '/models/food.dart';
import 'package:flutter/material.dart';

class AddedFoodListScreen extends StatefulWidget {
  const AddedFoodListScreen({Key? key, required this.tempList})
      : super(key: key);
  final List<Food> tempList;

  @override
  _AddedFoodListScreenState createState() => _AddedFoodListScreenState();
}

class _AddedFoodListScreenState extends State<AddedFoodListScreen> {
  void removeFood(int i) {
    widget.tempList.removeAt(i);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerade hinzugefügt'),
      ),
      body: ListView.builder(
          itemCount: widget.tempList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.tempList[index].name),
              subtitle: Text(
                  (widget.tempList[index].quantity * 100).toStringAsFixed(0) +
                      ' g'),
              trailing: IconButton(
                onPressed: () {
                  removeFood(index);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
