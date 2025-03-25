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
        "image": Assets.imagesOnboardingA,
        "title": "Mexican Appetizer",
        "subtitle": "Tortilla Chips With Toppings",
        "rating": 5.0,
        "price": 15.00
      },
    ],
    "Meal": [
      {
        "image": Assets.imagesOnboardingA,
        "title": "Italian Pasta",
        "subtitle": "Penne Pasta With Cheese",
        "rating": 4.8,
        "price": 12.50
      }
    ],
    "Vegan": [
      {
        "image": Assets.imagesOnboardingA,
        "title": "Vegan Salad",
        "subtitle": "Fresh Avocado & Veggies",
        "rating": 4.9,
        "price": 9.99
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    // **تحقق من أن `selectedIndex` لا يتجاوز عدد العناصر المتاحة**
    List<String> categories = foodItems.keys.toList();

    // إذا كان `selectedIndex` غير صالح، يتم تعيينه إلى 0 لتجنب الخطأ
    int safeIndex = (selectedIndex < categories.length) ? selectedIndex : 0;

    debugPrint("Selected Index: $selectedIndex, Safe Index: $safeIndex");

    List<Map<String, dynamic>> selectedItems =
        foodItems[categories[safeIndex]] ?? [];

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
