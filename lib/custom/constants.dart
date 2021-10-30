import '../models/food.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF00BBFF);
const kSecondaryColor = Color(0xFF22222C);
const kDecentColor = Color(0xFF30303A);
const kTextColor = Color(0xFFB6C9EA);

class MyLists {

  static List<Food> foodList = [
    Food(
        id: 'ban',
        name: 'Banane',
        quantity: 1,
        calories: 96,
        carbs: 22,
        fat: 0.2,
        protein: 1),
    Food(
        id: 'apf',
        name: 'Apfel',
        quantity: 1,
        calories: 67,
        carbs: 8,
        fat: 0,
        protein: 1),
    Food(
        id: 'ei',
        name: 'Ei',
        quantity: 1,
        calories: 153,
        carbs: 0.7,
        fat: 11.2,
        protein: 12.8),
    Food(
        id: 'hafer',
        name: 'Haferflocken',
        quantity: 1,
        calories: 372,
        carbs: 58.7,
        fat: 7,
        protein: 13.5),
    Food(
        id: 'beeren',
        name: 'Beeren',
        quantity: 1,
        calories: 52,
        carbs: 6.9,
        fat: 0.6,
        protein: 1.4),
    Food(
        id: 'maquark',
        name: 'Magerquark',
        quantity: 1,
        calories: 68,
        carbs: 4.1,
        fat: 0.2,
        protein: 12),
    Food(
        id: 'mandeln',
        name: 'Mandeln',
        quantity: 1,
        calories: 619,
        carbs: 5.7,
        fat: 53,
        protein: 24),
    Food(
        id: 'proteinpulver',
        name: 'Proteinpulver',
        quantity: 1,
        calories: 387,
        carbs: 6,
        fat: 5.7,
        protein: 77),
  ];
}