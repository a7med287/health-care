import 'package:flutter/material.dart';
import 'package:health_care/features/home/data/models/demo_doctors_data.dart';
import 'package:health_care/features/home/presentation/widgets/doctor_card.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demoDoctors.length,
      itemBuilder: (context, index) {
        final doctor = demoDoctors[index];
        return DoctorCard(
          doctor: doctor,
          onBookAppointment: () {
            // TODO: Navigate to booking page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookAppointmentView(doctor: doctor),
            //   ),
            // );
          },
          onTap: () {
            // TODO: Navigate to doctor details page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DoctorDetailsView(doctor: doctor),
            //   ),
            // );
          },
        );
      },
    );
  }
}
