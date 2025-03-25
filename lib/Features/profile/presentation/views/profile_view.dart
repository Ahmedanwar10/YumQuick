import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yum_quick/Features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: ProfileViewBody(),
    );
  }
}
