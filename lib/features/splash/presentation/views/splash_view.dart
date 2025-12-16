import 'package:flutter/material.dart';
import 'package:health_care/constants.dart';
import 'package:health_care/core/services/shared_prefrences_singletone.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/auth/login/presentaion/views/login_view.dart';
import 'package:health_care/features/home/presentation/views/home_view.dart';
import 'package:health_care/features/splash/presentation/views/widgets/animated_logo.dart';

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

    bool isLogged = Prefs.getBool(isLoggedInKey);
    Future.delayed(Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>isLogged ?HomeView() : LoginView()  ),
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
            colors: [
              AppColors.darkMainColor,
              AppColors.mainColor
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const AnimatedLogo(),
              SizedBox(height: 16),
              // SvgPicture.asset(Assets.textLogo),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
