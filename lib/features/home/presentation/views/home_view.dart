import 'package:flutter/material.dart';
import 'package:health_care/core/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome To Home",style: Styles.textStyleBold24,),),
    );
  }
}
