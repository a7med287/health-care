import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/clinic/Data/clinic_cubit/clinic_cubit.dart';
import 'package:health_care/features/clinic/Data/service/clinic_service.dart';

import 'package:health_care/features/clinic/Presentation/widgets/clinic_view_body.dart';

class ClinicView extends StatelessWidget {
  const ClinicView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClinicCubit(ClinicService())..getClinics(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Clinic", style: TextStyle(color: AppColors.mainColor)),
        ),
        body: const ClinicViewBody(),
      ),
    );
  }
}
