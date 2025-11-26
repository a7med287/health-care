
import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.mainColor, width: 1),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search doctor, drugs, articles...",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon:
              Icon(Icons.search, color: AppColors.mainColor, size: 22),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

