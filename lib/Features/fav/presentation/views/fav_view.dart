import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yum_quick/Features/fav/data/repo_fav.dart/fav_repo_impl.dart';
import 'package:yum_quick/Features/fav/data/service_fav/fav_service.dart';
import 'package:yum_quick/Features/fav/presentation/managers/fav_cubit.dart';
import 'package:yum_quick/Features/fav/presentation/views/widgets/fav_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit(FavRepoImpl(favService: FavService()))..getFav(1), // ✅ استدعاء `getFav`
      child: const Scaffold(
        backgroundColor: ColorManager.colorHeader,
        body: FavViewBody(),
      ),
    );
  }
}
