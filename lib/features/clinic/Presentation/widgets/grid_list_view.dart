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
    return SliverPadding(
      padding: const EdgeInsets.all(12.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final clinic = clinics[index];

            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorView(clinicId: clinic.id,)),
                );
              },
              child: ClinicCard(
                imageUrl: clinic.logoPath ?? "",
                name: clinic.name,
                phone: clinic.phone,
                location: clinic.address,
              ),
            );
          },
          childCount: clinics.length,
        ),
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
