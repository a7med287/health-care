import 'package:flutter/material.dart';
import 'package:health_care/constants.dart';
import 'package:health_care/core/services/shared_prefrences_singletone.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/features/doctors/presentation/views/available_appointments_view.dart';
import '../../../../core/storage/token_storage.dart';

class DoctorCardItem extends StatelessWidget {
  const DoctorCardItem({
    super.key,
    required this.name,
    required this.email,
    required this.clinicName,
    required this.doctorId,
  });

  final String name;
  final String email;
  final String clinicName;
  final String doctorId;

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
            /// Doctor name
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            /// Email
            Text(
              email,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 4),

            /// Clinic name
            Text(
              clinicName,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 20),

            /// Book button
            CustomButton(
              text: "Book",
              radius: 16,
              onTap: () async {
                final token = Prefs.getString(tokenKey);


                if (token == null) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AvailableAppointmentsView(
                      doctorId: doctorId,
                      doctorName: name,
                      clinicName: clinicName,
                      token: token,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
