import 'package:flutter/material.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/category_cardmenu.dart';
import 'package:yum_quick/core/constants/assets.dart';

class FutureScreenSelectItem extends StatelessWidget {
  final int selectedIndex;

  FutureScreenSelectItem({Key? key, required this.selectedIndex})
      : super(key: key);

  final Map<String, List<Map<String, dynamic>>> foodItems = {
    "Snacks": [
      {
        "image": Assets.imagesImageMenu,
        "title": "Mexican Appetizer",
        "subtitle": "Tortilla Chips With Toppings",
        "rating": 5.0,
        "price": 15.00
      },
      {
        "image": Assets.imagesImageMenu,
        "title": "Nachos",
        "subtitle": "Cheese & Jalapeno Nachos",
        "rating": 4.5,
        "price": 10.50
      }
    ],
    "Meal": [
      {
        "image": Assets.imagesImageMenu,
        "title": "Italian Pasta",
        "subtitle": "Penne Pasta With Cheese",
        "rating": 4.8,
        "price": 12.50
      }
    ],
    "Vegan": [
      {
        "image": Assets.imagesImageMenu,
        "title": "Vegan Salad",
        "subtitle": "Fresh Avocado & Veggies",
        "rating": 4.9,
        "price": 9.99
      }
    ],
    "Dessert": [
      {
        "image": Assets.imagesImageMenu,
        "title": "Chocolate Cake",
        "subtitle": "Dark Chocolate Delight",
        "rating": 4.7,
        "price": 7.50
      }
    ],
    "Drinks": [
      {
        "image": Assets.imagesImageMenu,
        "title": "Strawberry Shake",
        "subtitle": "Milkshake with fresh strawberries",
        "rating": 4.6,
        "price": 5.00
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> selectedItems =
        foodItems.values.elementAt(selectedIndex);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: selectedItems.length,
      itemBuilder: (context, index) {
        final item = selectedItems[index];
        return CategoryCard(
          imageUrl: item["image"],
          title: item["title"],
          subtitle: item["subtitle"],
          rating: item["rating"],
          price: item["price"],
        );
      },
    );
  }
}
