import 'package:flutter/material.dart';
import 'package:yum_quick/Features/update_profile/presentation/views/widgets/update_profile_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: UpdateProfileBody(),
    );
  }
}
