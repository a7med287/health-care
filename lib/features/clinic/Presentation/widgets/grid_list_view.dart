import 'package:flutter/material.dart';
import 'package:health_care/features/clinic/Data/models/cllinic_model.dart';
import 'package:health_care/features/clinic/Presentation/widgets/custom_clinic_card.dart';
 // لو الملف اسمه كده

class ClinicsGridView extends StatelessWidget {
  final List<Clinic> clinics;

  const ClinicsGridView({
    super.key,
    required this.clinics,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(12.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,        // 3 أعمدة
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,   // حسب حجم الكارد اللي عندك
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final clinic = clinics[index];
            return ClinicCard(
              imageUrl: clinic.image,
              name: clinic.name,
              phone: clinic.phone,
              location: clinic.location,
            );
          },
          childCount: clinics.length,
        ),
      ),
    );
  }
}
