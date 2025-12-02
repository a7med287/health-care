
import  'package:flutter/material.dart';
import 'package:health_care/features/doctors/presentation/widgets/doctor_card_item.dart';

class DoctorsListSection extends StatelessWidget {

  final List<Map<String,dynamic>> doctors;
  const DoctorsListSection({
    super.key, required this.doctors,

  });

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCardItem(
          name: doctor['name']!,
          specialty: doctor['specialty']!,
          address: doctor['address']!,
          rating: doctor['rating']!,
          image: doctor['image']!,


          onPressed: () {

          },

        );
      },
    );
  }
}