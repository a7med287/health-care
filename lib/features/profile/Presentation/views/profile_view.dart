import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: Center(child: Text(' Profile page')),

    );
  }
}