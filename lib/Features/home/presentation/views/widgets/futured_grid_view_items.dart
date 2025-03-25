import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yum_quick/Features/home/data/repositories/recommended_category/repo_impl.dart';
import 'package:yum_quick/Features/home/data/service/recommended_category_service.dart';
import 'package:yum_quick/Features/home/presentation/managers/recommended_category/recommended_category_cubit.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/custtom_grid_view_items.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class FutureGridViewItems extends StatefulWidget {
  const FutureGridViewItems({super.key});

  @override
  State<FutureGridViewItems> createState() => _FutureGridViewItemsState();
}

class _FutureGridViewItemsState extends State<FutureGridViewItems> {
  @override
  void initState() {
    super.initState();
    context.read<RecommendedCategoryCubit>().getRecommendedCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCategoryCubit, RecommendedCategoryState>(
      builder: (context, state) {
        if (state is RecommendedCategoryLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecommendedCategoryFailureState) {
          return Center(child: Text('خطأ: ${state.errMessage}'));
        } else if (state is RecommendedCategorySuccessState) {
          final products = state.recommendedCategoryList
              .expand((category) => category.categories ?? [])
              .expand((category) => category.products ?? [])
              .toList();

          // ✅ طباعة الصور قبل عرضها
          for (var product in products) {
            print("🖼️ Displaying Product Image: ${product.imagePath}");
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.6 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomGridViewItem(
                imagePath: products[index].imagePath ?? '',
                price: products[index].price?.toString() ?? '0',
                rating: products[index].rating ?? 5.0,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
