import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/mainScreen');
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              const SizedBox(width: 15),
              const Text(
                "Cart",
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.w700, 
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        // ✅ **إعدادات التطبيق**
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [            
              ],
            ),
          ),
        ),
      ],  
            );
  }
}