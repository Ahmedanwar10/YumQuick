import 'package:flutter/material.dart';
import 'package:yum_quick/Features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: CartViewBody(),
    );
  }
}
