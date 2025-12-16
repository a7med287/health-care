import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/constants.dart';
import 'package:health_care/core/services/shared_prefrences_singletone.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/profile/data/models/local_appointment_model.dart';
import 'package:health_care/features/profile/data/services/local_appointment_service.dart';

import '../../../../core/helpers/build_snak_bar.dart';
import '../cubits/available_slots_cubit/available_slot_cubit.dart';

class AvailableAppointmentsViewBodyBlockConsumer extends StatelessWidget {
  final String doctorName;
  final String clinicName;

  const AvailableAppointmentsViewBodyBlockConsumer({
    super.key,
    required this.doctorName,
    required this.clinicName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvailableSlotCubit, AvailableSlotState>(
      listener: (context, state) async {
        if (state is BookAppointmentSuccess) {
          final localService = LocalAppointmentService();

          /// save appointment locally
          await localService.saveAppointment(
            LocalAppointmentModel(
              doctorName: doctorName,
              clinicName: clinicName,
              date: DateTime.now().toString().split(' ')[0],
              time: "Scheduled",
            ),
          );

          buildSnackBar(context, 'Booked successfully');
          Navigator.pop(context);
        }

        if (state is BookAppointmentFailure) {
          buildSnackBar(
            context,
            'Booking failed',
            isError: true,
          );
        }
      },
      builder: (context, state) {
        if (state is AvailableSlotLoading ||
            state is BookAppointmentLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AvailableSlotFailure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is AvailableSlotSuccess) {
          return ListView.builder(
            itemCount: state.slots.length,
            itemBuilder: (context, index) {
              final slot = state.slots[index];

              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(
                    '${slot.startTime} - ${slot.endTime}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    slot.date.toLocal().toString().split(' ')[0],
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      final token = Prefs.getString(tokenKey);

                      context.read<AvailableSlotCubit>().bookAppointment(
                            slotId: slot.slotId,
                            token: token!,
                            reason: 'Booking from app',
                          );
                    },
                    child: const Text(
                      'Book',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
