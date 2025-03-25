import 'package:flutter/material.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/category_cardmenu.dart';
import 'package:yum_quick/core/constants/assets.dart';

class FutureListItems extends StatelessWidget {
  const FutureListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
  children:  const [
    CategoryCard(
      imageUrl: Assets.imagesOnboardingA,
      title: 'Mexican Appetizer',
      subtitle: 'Tortilla Chips With Toppings',
      rating: 5.0,
      price: 15.00,
    ),
    CategoryCard(
      imageUrl: Assets.imagesOnboardingA,
      title: 'Pork Skewer',
      subtitle: 'Marinated in a rich blend of herbs and spices...',
      rating: 4.0,
      price: 12.99,
    ),
  ],
);

  }
}