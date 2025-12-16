import 'package:flutter/material.dart';
import 'package:health_care/constants.dart';
import 'package:health_care/core/services/shared_prefrences_singletone.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/features/auth/login/presentaion/views/login_view.dart';
import 'package:health_care/features/profile/data/models/local_appointment_model.dart';
import 'package:health_care/features/profile/data/services/local_appointment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_care/core/utils/app_colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = '';
  List<LocalAppointmentModel> appointments = [];

  final LocalAppointmentService service = LocalAppointmentService();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();

    final data = await service.getAppointments();

    setState(() {
      userName = prefs.getString('user_name') ?? 'Guest User';
      appointments = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: AppColors.mainColor),
              ),

              const SizedBox(height: 15),

              Text(
                userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Appointments",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                    ),

                    const SizedBox(height: 15),

                    appointments.isEmpty
                        ? const Center(
                            child: Text(
                              "No appointments yet",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : Column(
                            children: appointments
                                .map(_appointmentCard)
                                .toList(),
                          ),
                  ],
                ),
              ),

              // CustomButton(
              //   text: "Logout",
              //   onTap: () {
              //     Prefs.setBool(isLoggedInKey, false);
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(builder: (context) => LoginView()),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appointmentCard(LocalAppointmentModel appointment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.mainColor, width: .6),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: AppColors.mainColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.doctorName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "${appointment.date} • ${appointment.time}",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
