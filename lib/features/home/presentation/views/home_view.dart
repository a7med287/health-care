import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/clinic/Data/service/clinic_service.dart';
import 'package:health_care/features/clinic/Presentation/clinic_cubit/clinic_cubit.dart';
import 'package:health_care/features/clinic/Presentation/views/clinic_view.dart';
import 'package:health_care/features/home/presentation/widgets/animated_bottom_nav.dart';
import 'package:health_care/features/home/presentation/widgets/chat_patient_widget.dart';
import 'package:health_care/features/home/presentation/widgets/home_view_body.dart';
import 'package:health_care/features/home/presentation/widgets/nav_item.dart';
import 'package:health_care/features/profile/Presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  late final PageController _pageController;

  final List<NavItem> navItems = const [
    NavItem(icon: Icons.home, label: 'Home'),
    NavItem(icon: Icons.local_hospital, label: 'Clinic'),
    NavItem(icon: Icons.person, label: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClinicCubit(ClinicService())..getAllClinics(),
      child: Scaffold(
        floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(colors: [
                Color(0xff145861),
                Color(0xff29BBCC),
              ])
            ),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPatientWidget(),));
            }, icon: Icon(Icons.smart_toy_outlined,size: 28,color: Colors.white,))),
        body: SafeArea(
          
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeViewBody(),
              ClinicView(),
              ProfileView(),
            ],
          ),
        ),

        bottomNavigationBar: AnimatedBottomNav(
          currentIndex: currentIndex,
          items: navItems,
          onItemSelected: (index) {
            setState(() => currentIndex = index);
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
