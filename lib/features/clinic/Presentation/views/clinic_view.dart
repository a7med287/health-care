import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

import 'package:health_care/features/clinic/Presentation/widgets/clinic_view_body.dart';

class ClinicView extends StatelessWidget {
  const ClinicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic", style: TextStyle(color: AppColors.mainColor)),
      ),
      body: const ClinicViewBody(),
    );
  }
}
