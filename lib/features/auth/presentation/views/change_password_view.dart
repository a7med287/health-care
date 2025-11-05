import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/core/utils/styles.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/core/widgets/custom_text_form_field.dart';
import 'package:health_care/generated/l10n.dart';
import '../../../../core/utils/app_images.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// 🔹 الخلفية الخضراء المنحنية + الصورة
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: size.height * 0.6, // زوّدنا شوية عشان المنحنى يبقى أنعم
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor.withOpacity(0.95),
                    AppColors.primaryColor.withOpacity(0.85),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      Assets.backAuthImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.logo,
                          height: 70,
                        ),
                        const SizedBox(height: 8),
                        SvgPicture.asset(
                          Assets.textLogo,
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///  الكارد البيضاء 
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width * 0.88,
              
              margin: EdgeInsets.only(bottom: size.height * 0.20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).changePassword,
                    style: Styles.textStyleBold24.copyWith(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.of(context).forgotPasswordHint,
                    textAlign: TextAlign.center,
                    style: Styles.textStyleRegular16.copyWith(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 25),

                  ///   الإيميل
                  const CustomTextFormField(
                    iconData: Icons.email_outlined,
                    
                    textInputType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 25),

                  
                  CustomButton(
                    text: S.of(context).sendResetLink,
                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
