import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/category.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/product.dart';
import 'package:yum_quick/Features/menu/presentation/managers/get_menu_cubit.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/category_select.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/category_cardmenu.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class MenuViewBody extends StatefulWidget {
  const MenuViewBody({super.key});

  @override
  _MenuViewBodyState createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody> {
  int selectedIndex = 0;

  void _updateCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),

        // 🔍 شريط البحث
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                CategorySelector(onCategorySelected: _updateCategory),
                const SizedBox(height: 20),

                // 🔥 استدعاء المنتجات من API
                Expanded(
                  child: BlocBuilder<GetMenuCubit, GetMenuState>(
                    builder: (context, state) {
                      if (state is GetMenuLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetMenuFailure) {
                        return Center(child: Text("Error: ${state.errorMessage}"));
                      } else if (state is GetMenuSuccess) {
final List<Category>? categories = state.products.isNotEmpty ? state.products[0].categories : [];
final List<Product> products = categories != null && categories.isNotEmpty
    ? categories[selectedIndex].products ?? []
    : [];

  return ListView.builder(
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return CategoryCard(
        imageUrl: product.imagePath ?? '',
        title: product.name ?? 'No Title',
        subtitle: product.description ?? 'No Description',
        rating: product.rating ?? 0.0,
        price: (product.price ?? 0).toDouble(),
      );
    },
  );
}


                      return const Center(child: Text("No Data Available"));
                    },
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
