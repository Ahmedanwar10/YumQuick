import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final Function(int) onCategorySelected;

  const CategorySelector({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.fastfood, "label": "Snacks"},
    {"icon": Icons.restaurant, "label": "Meal"},
    {"icon": Icons.grass, "label": "Vegan"},
    {"icon": Icons.cake, "label": "Dessert"},
    {"icon": Icons.local_drink, "label": "Drinks"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.amber[100] : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    categories[index]["icon"],
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  categories[index]["label"],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
