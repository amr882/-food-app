import 'package:flutter/material.dart';

class FoodModel extends ChangeNotifier {
  final String name;
  final double price;
  final String image;
  final int id;
  final bool ordered = false;
  int quantity = 0;
  DateTime? orderDate;

  FoodModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.orderDate
  });

  static List<FoodModel> items = [
    FoodModel(
        id: 1, name: 'Oshizushi', price: 9.99, image: 'items/Oshizushi.png'),
    FoodModel(
        id: 2,
        name: 'Nigiri Sushi (Nigirizushi)',
        price: 17.99,
        image: 'items/Nigiri Sushi (Nigirizushi).png'),
    FoodModel(
        id: 3,
        name: 'nigiri sushi',
        price: 12.50,
        image: 'items/nigiri sushi.png'),
    FoodModel(
      id: 4,
      name: 'Gunkan Maki',
      price: 20.99,
      image: 'items/Gunkan Maki.png',
    ),
    FoodModel(
      id: 5,
      name: 'SMakizushi (Maki Sushi)',
      price: 14.99,
      image: 'items/Makizushi (Maki Sushi).png',
    ),
    FoodModel(
        id: 6, name: 'Narezushi', price: 16.99, image: 'items/Narezushi.png'),
  ];
}

// List<Map> foodItemsModel = [
//   {
//     'name': 'Spaghetti pasta with meatballs',
//     'price': 14.99,
//     'image': 'items/Spaghetti_pasta_with_meatballs.png',
//     'id': 1,
//   },
//   {
//     'name': 'Egg and cucmber',
//     'price': 15.0,
//     'image': 'items/Egg and cucmber.png',
//     'id': 2,
//   },
//   {
//     'name': 'Fried pork and vegetables',
//     ' price': 20.99,
//     'image': 'items/Fried_pork_and_vegetables.png',
//     'id': 3
//   },
//   {
//     'name': 'Moi moi and ekpa',
//     'price': 25.00,
//     'image': 'items/Moi-moi and ekpa.png',
//     'id': 4
//   },
//   {
//     'name': 'Peach blueberry and arugula',
//     'price': 19.99,
//     'image': 'items/Peach__blueberry_and_arugula.png',
//     'id': 5
//   },
//   {
//     'name': 'Salad with grilled chicken breast',
//     'price': 17.00,
//     'image': 'items/Salad_with_grilled_chicken_breast.png',
//     'id': 6
//   },
//   {
//     'name': 'Spaghetti pasta with meatballs',
//     'price': 14.99,
//     'image': 'items/Spaghetti_pasta_with_meatballs.png',
//     'id': 7
//   },
//   {
//     'name': 'Veggie tomato mix',
//     'price': 8.00,
//     'image': 'items/Veggie tomato mix.png',
//     'id': 8
//   }
// ];
