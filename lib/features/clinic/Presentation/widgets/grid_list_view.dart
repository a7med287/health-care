import 'package:flutter/material.dart';
import 'package:health_care/features/clinic/Data/models/cllinic_model.dart';
import 'package:health_care/features/clinic/Presentation/widgets/custom_clinic_card.dart';

class ClinicsGridView extends StatelessWidget {
  final List<ClinicModel> clinics;

  const ClinicsGridView({
    super.key,
    required this.clinics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.90,
      ),
      itemCount: clinics.length,
      itemBuilder: (context, index) {
        final clinic = clinics[index];
        return ClinicCard(
          imageUrl: clinic.logoPath ?? "",
          name: clinic.name,
          phone: clinic.phone,
          location: clinic.address,
        );
      },
    );
  }
}
