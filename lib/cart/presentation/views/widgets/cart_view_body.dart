import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_quick/core/constants/assets.dart';
import 'package:yum_quick/core/resources/color_managers.dart';
import 'cart_item.dart';
import 'summary_row.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  _CartViewBodyState createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  List<Map<String, dynamic>> cartItems = [
    {
      "image": Assets.imagesOnboardingA,
      "title": "Strawberry Shake",
      "price": 20.00,
      "quantity": 1
    },
    {
      "image": Assets.imagesOnboardingB,
      "title": "Broccoli Lasagna",
      "price": 12.00,
      "quantity": 1
    },
  ];

  double get totalPrice {
    double subtotal = cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
    double tax = 5.00;
    double delivery = 3.00;
    return subtotal + tax + delivery;
  }

  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] += change;
      if (cartItems[index]['quantity'] <= 0) {
        cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          color: const Color(0xFFFFD55F),
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => GoRouter.of(context).go('/mainScreen'),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                const Spacer(),
                const Text(
                  "Cart",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You have ${cartItems.length} items in the cart",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItem(
                        imageUrl: item['image'],
                        title: item['title'],
                        price: item['price'],
                        quantity: item['quantity'],
                        onQuantityChanged: (change) =>
                            updateQuantity(index, change),
                      );
                    },
                  ),
                ),
                const Divider(),
                SummaryRow(
                    title: "Subtotal", amount: "\$${totalPrice - 5 - 3}"),
                const SummaryRow(title: "Tax and Fees", amount: "\$5.00"),
                const SummaryRow(title: "Delivery", amount: "\$3.00"),
                const Divider(),
                SummaryRow(
                    title: "Total", amount: "\$${totalPrice}", isBold: true),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.colorHeader,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                    ),
                    child: const Text("Checkout",
                        style: TextStyle(
                            fontSize: 18, color: ColorManager.primary)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
