import 'package:flutter/material.dart';
import '/custom/constants.dart';

class MyHeadText extends StatelessWidget {
  const MyHeadText({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, color: kTextColor),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, color: kTextColor),
    );
  }
}
