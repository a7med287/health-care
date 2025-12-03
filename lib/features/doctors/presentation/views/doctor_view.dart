import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/doctors/presentation/widgets/doctor_view_body.dart';

import '../../data/repo/repoimpl.dart';
import '../cubits/doctor_cubit/doctor_cubit.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key, required this.clinicId});

  final String clinicId;
  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(DoctorRepoImpl())..getDoctors(clinicId: widget.clinicId),
      child: Scaffold(
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
        body: DoctorViewBody(),

      ),
    );
  }
}