import 'package:flutter/material.dart';
import 'package:health_care/features/doctors/presentation/widgets/Doctor_Details_View.dart';
import 'package:health_care/features/doctors/presentation/widgets/doctor_card_item.dart';

class DoctorsListSection extends StatelessWidget {
  final List<Map<String, String>> filteredList;

  const DoctorsListSection({
    super.key,
    required this.filteredList,
  });

  @override
  Widget build(BuildContext context) {
    if (filteredList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.filter_list_off, size: 50, color: Colors.grey),
            SizedBox(height: 10),
            Text("No doctors found in this category"),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final doctor = filteredList[index];
        return DoctorCardItem(
          name: doctor['name']!,
          specialty: doctor['specialty']!,
          address: doctor['address']!,
          rating: doctor['rating']!,
          image: doctor['image']!,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorDetailsView(
                  name: doctor['name']!,
                  specialty: doctor['specialty']!,
                  address: doctor['address']!,
                  rating: doctor['rating']!,
                  image: doctor['image']!,
                ),
              ),
            );
          },
          // -----------------------------------
        );
      },
    );
  }
}