import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetailsView extends StatelessWidget {
  final Map<String, dynamic> item;

  const ItemDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title'] ?? "No Title"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                item['image'] ?? 'assets/default_image.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item['title'] ?? "No Title",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              item['description'] ?? "No Description Available",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              "Price: \$${item['price'] ?? 0.0}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/cartView');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
