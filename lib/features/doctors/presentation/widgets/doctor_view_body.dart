import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/doctors/presentation/cubits/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/features/doctors/presentation/widgets/doctor_card_item.dart';

class DoctorViewBody extends StatefulWidget {
  const DoctorViewBody({super.key});

  @override
  State<DoctorViewBody> createState() => _DoctorViewBodyState();
}

class _DoctorViewBodyState extends State<DoctorViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is DoctorSuccess) {
          final doctors = state.doctors;

          if (doctors.isEmpty) {
            return Center(child: Text("No Doctors Found"));
          }

          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doc = doctors[index];
              return DoctorCardItem(
                name: doc.fullName,
                email: doc.email,
                clinicName: doc.clinicName,
                doctorId: doc.userId, // Use userId as doctorId
              );
            },
          );
        }

        if (state is DoctorFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return SizedBox();
      },
    );
  }
}

// final List<Map<String, String>> allDoctors = [
//   {
//     "name": "Tarek Ali",
//     "specialty": "Cardiologist",
//     "address": "Sohag",
//     "rating": "4.5",
//     "image": "assets/images/doctor1.jpg",
//   },
//   {
//     "name": "Ahmed Hassan",
//     "specialty": "Dermatologist",
//     "address": "Cairo",
//     "rating": "4.7",
//     "image": "assets/images/doctor2.jpg",
//   },
//   {
//     "name": "Ahmed Ibrahim",
//     "specialty": "Pediatrician",
//     "address": "Alexandria",
//     "rating": "4.8",
//     "image": "assets/images/doctor3.jpg",
//   },
//   {
//     "name": "Omar Saeed",
//     "specialty": "Neurologist",
//     "address": "Giza",
//     "rating": "4.6",
//     "image": "assets/images/doctor4.jpg",
//   },
//   {
//     "name": "Ali Mostafa",
//     "specialty": "Dentist",
//     "address": "Mansoura",
//     "rating": "4.9",
//     "image": "assets/images/doctor5.jpg",
//   },
//   {
//     "name": "Youssef Adel",
//     "specialty": "Orthopedic Surgeon",
//     "address": "Aswan",
//     "rating": "4.4",
//     "image": "assets/images/doctor6.jpg",
//   },
// ];
