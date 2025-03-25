import 'package:flutter/material.dart';
import 'package:yum_quick/core/common/functions/cached_network_image.dart';

class CustomGridViewItem extends StatefulWidget {
  final String imagePath;
  final String price;
  final double rating;

  const CustomGridViewItem({
    super.key,
    required this.imagePath,
    required this.price,
    this.rating = 5.0,
  });

  @override
  State<CustomGridViewItem> createState() => _CustomGridViewItemState();
}

class _CustomGridViewItemState extends State<CustomGridViewItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    print("🖼️ Image Path Received: ${widget.imagePath}"); // ✅ طباعة الرابط للتأكد من صحته

    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: MyCachedImage(
              url: widget.imagePath.isNotEmpty
                  ? widget.imagePath
                  : 'https://via.placeholder.com/150', // ✅ صورة افتراضية في حالة الرابط فارغ
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    widget.rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 3),
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
