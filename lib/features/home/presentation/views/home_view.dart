import 'package:flutter/material.dart';

import 'package:health_care/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: HomeViewBody(),
        ),

      // floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
