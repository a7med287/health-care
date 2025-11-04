import 'package:flutter/material.dart';

import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const HealthCare());
}

class HealthCare extends StatelessWidget {
  const HealthCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView());
  }
}