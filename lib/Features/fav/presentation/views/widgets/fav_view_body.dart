import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_quick/Features/fav/presentation/managers/fav_cubit.dart';
import 'package:yum_quick/Features/fav/presentation/views/widgets/category_fav.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

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
                "Favorites",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
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
            child: BlocBuilder<FavCubit, FavState>(
              builder: (context, state) {
                if (state is FavLoading) {
                  return const Center(child: CircularProgressIndicator()); // ✅ تحميل
                } else if (state is FavFailure) {
                  return Center(child: Text(state.errorMessage)); // ❌ خطأ
                } else if (state is FavSuccess) {
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return CategoryCardFav(
                        imageUrl: product.imagePath?? "No Name", // ✅ تأكد من استخدام المسار الصحيح
                        title: product.name??"",
                        subtitle: product.description ?? "",
                        rating: product.rating ?? 0.0,
                        price: (product.price ?? 0).toDouble(), // ✅ يحوّل `null` إلى `0.0`
                      );
                    },
                  );
                }
                return const Center(child: Text("No favorites found.")); // ℹ️ حالة فارغة
              },
            ),
          ),
        ),
      ],
    );
  }
}
