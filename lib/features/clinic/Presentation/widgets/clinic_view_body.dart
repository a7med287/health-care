import 'package:flutter/material.dart';
import 'package:health_care/features/clinic/Data/models/cllinic_model.dart';
import 'package:health_care/features/clinic/Presentation/widgets/custom_clinic_card.dart';
import 'package:health_care/features/clinic/Presentation/widgets/grid_list_view.dart';
import 'package:health_care/features/clinic/Presentation/widgets/search_text_field.dart';

class ClinicViewBody extends StatelessWidget {
  const ClinicViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Clinic> clinicsList = [
      Clinic(
        image: "assets/images/r1.png",
        name: "Smile Clinic",
        phone: "01012345678",
        location: "Nasr City",
      ),
      Clinic(
        image: "assets/images/r2.png",
        name: "Heart Care",
        phone: "01098765432",
        location: "Heliopolis",
      ),
      Clinic(
        image: "assets/images/r3.png",
        name: "Beauty Clinic",
        phone: "01055555555",
        location: "Maadi",
      ),
      Clinic(
        image: "assets/images/r2.png",
        name: "Smile Clinic",
        phone: "01012345678",
        location: "Nasr City",
      ),
      Clinic(
        image: "assets/images/r3.png",
        name: "Heart Care",
        phone: "01098765432",
        location: "Heliopolis",
      ),
      Clinic(
        image: "assets/images/r1.png",
        name: "Beauty Clinic",
        phone: "01055555555",
        location: "Maadi",
      ),
      Clinic(
        image: "assets/images/r1.png",
        name: "Smile Clinic",
        phone: "01012345678",
        location: "Nasr City",
      ),
      Clinic(
        image: "assets/images/r3.png",
        name: "Heart Care",
        phone: "01098765432",
        location: "Heliopolis",
      ),
      Clinic(
        image: "assets/images/r2.png",
        name: "Beauty Clinic",
        phone: "01055555555",
        location: "Maadi",
      ),
      Clinic(
        image: "assets/images/r1.png",
        name: "Smile Clinic",
        phone: "01012345678",
        location: "Nasr City",
      ),
      Clinic(
        image: "assets/images/r2.png",
        name: "Heart Care",
        phone: "01098765432",
        location: "Heliopolis",
      ),
      Clinic(
        image: "assets/images/r3.png",
        name: "Beauty Clinic",
        phone: "01055555555",
        location: "Maadi",
      ),
      Clinic(
        image: "assets/images/r1.png",
        name: "Smile Clinic",
        phone: "01012345678",
        location: "Nasr City",
      ),
      Clinic(
        image: "assets/images/r2.png",
        name: "Heart Care",
        phone: "01098765432",
        location: "Heliopolis",
      ),
      Clinic(
        image: "assets/images/r3.png",
        name: "Beauty Clinic",
        phone: "01055555555",
        location: "Maadi",
      ),
      Clinic(
        image: "assets/images/r2.png",
        name: "Smile Clinic",
        phone: "01012345678",
        location: "Nasr City",
      ),
      Clinic(
        image: "assets/images/r3.png",
        name: "Heart Care",
        phone: "01098765432",
        location: "Heliopolis",
      ),
      Clinic(
        image: "assets/images/r1.png",
        name: "Beauty Clinic",
        phone: "01055555555",
        location: "Maadi",
      ),
      Clinic(
        image: "assets/images/r1.png",
        name: "Smile Clinic",
        phone: "01012345678",
        location: "Nasr City",
      ),
      Clinic(
        image: "assets/images/r3.png",
        name: "Heart Care",
        phone: "01098765432",
        location: "Heliopolis",
      ),
      Clinic(
        image: "assets/images/r2.png",
        name: "Beauty Clinic",
        phone: "01055555555",
        location: "Maadi",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ClinicSpecialityDropdown(),
                SizedBox(height: 8),
              ],
            ),
          ),

          ClinicsGridView(clinics: clinicsList),
        ],
      ),
    );
  }
}
