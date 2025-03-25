import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yum_quick/Features/home/presentation/managers/bestsellerproduct/bestsellerproduct_cubit.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/cusstom_list_view_items.dart';
import 'package:yum_quick/Features/home/data/repositories/repo_best_seller/repo_impl.dart';
import 'package:yum_quick/Features/home/data/service/best_seller_service.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class FuturedListViewItems extends StatelessWidget {
  const FuturedListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BestsellerproductCubit(
        RepoImpl(
          bestSellerService: BestSellerService(
            DioWrapper(),
          ),
        ),
      )..getHomeData(),
      child: BlocBuilder<BestsellerproductCubit, BestsellerproductState>(
        builder: (context, state) {
          if (state is BestsellerproductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BestsellerproductFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is BestsellerproductSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.bestSeller.bestSellerProducts?.length ?? 0,
                itemBuilder: (context, index) {
                  final product = state.bestSeller.bestSellerProducts![index];
                  return Padding(
                    padding: const EdgeInsets.all(3.5),
                    child: CustomListViewItem(
                      price: product.price.toString(),
                      imageUrl: product.imagePath ??
                          'https://via.placeholder.com/150',
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
