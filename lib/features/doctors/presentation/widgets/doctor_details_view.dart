import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/doctors/presentation/widgets/Booking_Dialog.dart';





class DoctorDetailsView extends StatelessWidget {
  final String name;
  final String specialty;
  final String address;
  final String rating;
  final String image;
  final String doctorId; // Required: Doctor ID for fetching available slots

  const DoctorDetailsView({
    super.key,
    required this.name,
    required this.specialty,
    required this.address,
    required this.rating,
    required this.image,
    required this.doctorId,
  });

  // دالة مساعدة لفتح نافذة الحجز
  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BookingDialog(
          doctorName: name,
          specialty: specialty,
          image: image,
          address: address,
          doctorId: doctorId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Doctors",
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // صورة الدكتور
            Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColors.mainColor,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(image),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              specialty,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard(Icons.star, rating, "Rating"),
                _buildInfoCard(Icons.location_on, address, "Location"),
              ],
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => _showBookingDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Book Appointment",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String value, String label) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.mainColor, size: 30),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}