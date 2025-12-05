import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/core/utils/styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text,  this.radius =40});
  final void Function()? onTap;
  final String text;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          // gradient: LinearGradient(
          //   begin: AlignmentGeometry.topRight,
          //   end: AlignmentGeometry.bottomLeft,
          //   colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
          // ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.textStyleMedium16.copyWith(color: Colors.white)
          ),
        ),
      ),
    );
  }
}
