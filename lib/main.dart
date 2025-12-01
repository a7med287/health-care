import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/features/clinic/Presentation/views/clinic_view.dart';
import 'package:health_care/features/doctors/presentation/views/doctor_view.dart';
import 'package:health_care/features/doctors/presentation/widgets/doctor_view_body.dart';
import 'package:health_care/features/splash/presentation/views/splash_view.dart';
import 'package:health_care/features/doctors/presentation/widgets/Booking_Dialog.dart';

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


        home: BookingDialog(doctorName: "Dr. John Doe", specialty: "Cardiologist", image: "assets/images/doctor.png", address: "123 Main St, Anytown, USA"));
  }
}