import 'package:flutter/material.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/cusstom_list_view_items.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/discountslider.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/futured_grid_view_items.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/futured_list_view_items.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const SizedBox(
          height: 60,
        ),
        // 🔍 شريط البحث
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
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

        // 🔍 العنوان الصباحي
        // 🔍 العنوان الصباحي
        const Padding(
          padding:  EdgeInsets.only(left: 30, right: 30),
          child:  Align(
            alignment: Alignment.centerLeft, // ✅ يجعل النصوص في البداية (start)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: ColorManager.white,
                  ),
                ),
                Text(
                  "Rise and shine! It's breakfast time",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
          ),
        ),

       const  SizedBox(
          height: 20,
        ),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔥 قسم Best Seller
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Best Seller",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(color: ColorManager.primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // 🔥 عرض المنتجات
                  const FuturedListViewItems(),
                  const SizedBox(height: 20),
                  const DiscountSlider(),
                  const SizedBox(height: 30),
                  const Text(
                    "Recommended",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  const FutureGridViewItems(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
