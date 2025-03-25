import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  final Function(int) onQuantityChanged;

  const CartItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // ✅ صورة المنتج
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // ✅ تفاصيل المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                Text("\$$price",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),

          // ✅ زر الحذف
          IconButton(
            onPressed: () => onQuantityChanged(-quantity), // حذف العنصر بالكامل
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          ),

          // ✅ التحكم في الكمية
          Row(
            children: [
              IconButton(
                onPressed: () => onQuantityChanged(-1),
                icon: const Icon(Icons.remove_circle_outline,
                    color: Colors.orange),
              ),
              Text(
                "$quantity",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => onQuantityChanged(1),
                icon:
                    const Icon(Icons.add_circle_outline, color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
