import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/features/splash/presentation/views/splash_view.dart';

import 'core/utils/app_colors.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const HealthCare());
}

class HealthCare extends StatelessWidget {
  const HealthCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,

        // switch language ar => arabic OR en => english
        locale: Locale("en"),

        theme: ThemeData(
          fontFamily: "Tajawal",
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),


        home: const SplashView());
  }
}