import 'package:flutter/material.dart';
import 'package:yum_quick/Features/fav/presentation/views/widgets/fav_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: FavViewBody(),
    );
  }
}
