import 'package:flutter/material.dart';
import 'package:health_care/core/utils/styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF00BFA5),
          // gradient: LinearGradient(
          //   begin: AlignmentGeometry.topRight,
          //   end: AlignmentGeometry.bottomLeft,
          //   colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
          // ),
          borderRadius: BorderRadius.circular(40),
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
