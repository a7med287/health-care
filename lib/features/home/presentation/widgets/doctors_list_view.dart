import 'package:flutter/material.dart';
import 'package:health_care/features/home/data/models/demo_doctors_data.dart';
import 'package:health_care/features/home/presentation/widgets/doctor_card.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: demoDoctors.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final doctor = demoDoctors[index];
          return SizedBox(
            width: 300,
            child: DoctorCard(
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
            ),
          );
        },
      ),
    );
  }
}
