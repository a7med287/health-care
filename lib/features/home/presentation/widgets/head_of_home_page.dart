import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/core/utils/app_colors.dart';

import 'build_pop_menue.dart';

class HeadOfHomePage extends StatelessWidget {
  const HeadOfHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildPopupMenu(context),

         SvgPicture.asset('assets/images/insoveLogo.svg',
        width: 80,
        ),
      ],
    );
  }
}