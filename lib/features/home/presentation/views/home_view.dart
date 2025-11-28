import 'package:flutter/material.dart';
import 'package:health_care/features/home/presentation/widgets/animated_bottom_nav.dart';
import 'package:health_care/features/home/presentation/widgets/home_view_body.dart';
import 'package:health_care/features/home/presentation/widgets/nav_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routName = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      
      body: SafeArea(
        child: HomeViewBody(),
        ),
        bottomNavigationBar: AnimatedBottomNav(
        currentIndex: currentIndex,
        items: navItems,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      // floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
