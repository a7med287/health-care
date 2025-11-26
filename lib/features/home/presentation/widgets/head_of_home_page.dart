import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/core/utils/app_colors.dart';

class HeadOfHomePage extends StatelessWidget {
  const HeadOfHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.mainColor, width: 1),
          ),
          child: const Icon(Icons.notifications_none,
              color: AppColors.mainColor),
        ),

         SvgPicture.asset('assets/images/insoveLogo.svg',
        width: 80,
        ),
      ],
    );
  }
}