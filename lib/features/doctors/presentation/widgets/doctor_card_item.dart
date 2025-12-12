import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/doctors/presentation/widgets/Booking_Dialog.dart';

class DoctorCardItem extends StatelessWidget {
  const DoctorCardItem({
    super.key,
    required this.name,
    required this.email,
    required this.clinicName,
    required this.doctorId, // Required: Doctor ID for booking
  });

  final String name, email, clinicName, doctorId;

  /// Shows the booking dialog for this doctor
  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BookingDialog(
          doctorName: name,
          specialty: clinicName, // Using clinic name as specialty
          image: '', // No image available in this view
          address: '', // No address available in this view
          doctorId: doctorId,
        );
      },
    );
  }

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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showBookingDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Book"),
            ),
          ],
        ),
      ),
    );
  }
}
