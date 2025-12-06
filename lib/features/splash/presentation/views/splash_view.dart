import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/auth/login/presentaion/views/login_view.dart';
import 'package:health_care/features/splash/presentation/views/widgets/animated_logo.dart';
import '../../../../core/utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = "splashView";
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topRight,
            end: AlignmentGeometry.bottomLeft,
            colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const AnimatedLogo(),
              SizedBox(height: 16),
              SvgPicture.asset(Assets.textLogo),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
