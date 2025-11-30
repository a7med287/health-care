import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/doctors/presentation/widgets/doctor_view_body.dart';
import 'package:health_care/features/home/presentation/widgets/animated_bottom_nav.dart';
import 'package:health_care/features/home/presentation/widgets/nav_item.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  int currentIndex = 0;

  final List<NavItem> navItems = const [
    NavItem(icon: Icons.home, label: 'Home'),
    NavItem(icon: Icons.search, label: 'Search'),
    NavItem(icon: Icons.notifications, label: 'Notifications'),
    NavItem(icon: Icons.person, label: 'Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Doctors",
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
          ),
        ),
      ),
      body:DoctorViewBody() ,
       
    );
  }
}