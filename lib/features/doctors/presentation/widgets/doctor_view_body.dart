import 'package:flutter/material.dart';
import 'package:health_care/features/doctors/presentation/widgets/Doctor_Categories_Section.dart';
import 'package:health_care/features/doctors/presentation/widgets/Doctors_List_Section.dart';


class DoctorViewBody extends StatefulWidget {
  const DoctorViewBody({super.key});

  @override
  State<DoctorViewBody> createState() => _DoctorViewBodyState();
}

class _DoctorViewBodyState extends State<DoctorViewBody> {
  String selectedSpecialty = "All";

  final List<Map<String, String>> allDoctors = [
    {
      "name": "Tarek Ali",
      "specialty": "Cardiologist",
      "address": "Sohag",
      "rating": "4.5",
      "image": "assets/images/doctor1.jpg",
    },
    {
      "name": "Ahmed Hassan",
      "specialty": "Dermatologist",
      "address": "Cairo",
      "rating": "4.7",
      "image": "assets/images/doctor2.jpg",
    },
    {
      "name": "Ahmed Ibrahim",
      "specialty": "Pediatrician",
      "address": "Alexandria",
      "rating": "4.8",
      "image": "assets/images/doctor3.jpg",
    },
    {
      "name": "Omar Saeed",
      "specialty": "Neurologist",
      "address": "Giza",
      "rating": "4.6",
      "image": "assets/images/doctor4.jpg",
    },
    {
      "name": "Ali Mostafa",
      "specialty": "Dentist",
      "address": "Mansoura",
      "rating": "4.9",
      "image": "assets/images/doctor5.jpg",
    },
    {
      "name": "Youssef Adel",
      "specialty": "Orthopedic Surgeon",
      "address": "Aswan",
      "rating": "4.4",
      "image": "assets/images/doctor6.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredList = selectedSpecialty == "All"
        ? allDoctors
        : allDoctors
            .where((doctor) => doctor['specialty'] == selectedSpecialty)
            .toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorCategoriesSection(
                selectedSpecialty: selectedSpecialty,
                onCategoryChanged: (newCategory) {
                  setState(() {
                    selectedSpecialty = newCategory;
                  });
                },
              ),

              const SizedBox(height: 20),

              Expanded(
                child: DoctorsListSection(filteredList: filteredList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







