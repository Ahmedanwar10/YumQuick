import 'package:flutter/material.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/category_select.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/future_screen_select_item.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class MenuViewBody extends StatefulWidget {
  const MenuViewBody({super.key});

  @override
  _MenuViewBodyState createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody> {
  int selectedIndex = 0;

  void _updateCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),

        // 🔍 شريط البحث
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                CategorySelector(onCategorySelected: _updateCategory),
                const SizedBox(height: 20),
                Expanded(
                    child:
                        FutureScreenSelectItem(selectedIndex: selectedIndex)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
