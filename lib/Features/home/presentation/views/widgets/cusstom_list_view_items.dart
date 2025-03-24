import 'package:flutter/material.dart';
import 'package:yum_quick/core/constants/assets.dart';

class CustomListViewItem extends StatelessWidget {
  final String price; // إضافة السعر كـ متغير
  const CustomListViewItem({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Stack(
        children: [
          // صورة المنتج
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.imagesImageBestSeller),
              ),
            ),
          ),

          // السعر في الركن السفلي الأيمن
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(20),
                     bottomLeft: Radius.circular(20),
                      ),
              ),
              child: Text(
                "\$$price",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
