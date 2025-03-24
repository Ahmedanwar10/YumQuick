import 'package:flutter/material.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/custtom_grid_view_items.dart';
import 'package:yum_quick/core/constants/assets.dart';

class FutureGridViewItems extends StatelessWidget {
  const FutureGridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        childAspectRatio: 2.6 / 4, // نسبة العرض إلى الارتفاع
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4, // عدد العناصر في الشبكة
      itemBuilder: (BuildContext context, int index) {
        return CustomGridViewItem(
          imagePath: Assets.imagesPhotoRecommended, // استبدل بمسارات الصور
          price: (10 + index * 5).toString(), // سعر عشوائي
          rating: 5.0, // تقييم ثابت
          // العناصر الزوجية تكون مفضلة
        );
      },
    );
  }
}
