import 'package:flutter/material.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/features/doctors/presentation/views/available_appointments_view.dart';

import '../../../../core/storage/token_storage.dart';

class DoctorCardItem extends StatelessWidget {
  const DoctorCardItem({super.key, required this.name, required this.email, required this.clinicName, required this.doctorId});

  final String name, email,clinicName, doctorId;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              clinicName,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: 20,),

            CustomButton(text: "Book",radius: 16,onTap: () async {
              final token = await TokenStorage().getToken();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AvailableAppointmentsView(doctorId: doctorId, token:  token! );
              },));
            },)
          ],
        ),
      ),
    );

  }
}
