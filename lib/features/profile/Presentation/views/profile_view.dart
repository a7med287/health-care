import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_care/core/utils/app_colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = '';

  /// static appointments for now
  final List<Map<String, String>> appointments = [
    {
      'doctor': 'Dr. Ahmed Hassan',
      'date': '20 Sep 2025',
      'time': '5:30 PM',
    },
    {
      'doctor': 'Dr. Mohamed Ali',
      'date': '25 Sep 2025',
      'time': '7:00 PM',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? 'Guest User';
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

              /// Profile Icon
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: AppColors.mainColor,
                ),
              ),

              const SizedBox(height: 15),

              /// User Name
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              /// Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Section title
                    const Text(
                      "My Appointments",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Appointments list
                    appointments.isEmpty
                        ? const Center(
                            child: Text(
                              "No appointments yet",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : Column(
                            children: appointments
                                .map((appointment) =>
                                    _appointmentCard(appointment))
                                .toList(),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Appointment Card
  Widget _appointmentCard(Map<String, String> data) {
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
          const Icon(
            Icons.calendar_month,
            color: AppColors.mainColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['doctor']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${data['date']} • ${data['time']}",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
