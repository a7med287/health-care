import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';

import '../../../../core/helpers/build_snak_bar.dart';
import '../../../../core/storage/token_storage.dart';
import '../cubits/available_slots_cubit/available_slot_cubit.dart';

class AvailableAppointmentsViewBodyBlockConsumer extends StatelessWidget {
  const AvailableAppointmentsViewBodyBlockConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvailableSlotCubit, AvailableSlotState>(
      listener: (context, state) {
        if (state is BookAppointmentSuccess) {
          buildSnackBar(context, 'Booked successfully');
          Navigator.pop(context);
        }

        if (state is BookAppointmentFailure) {
          debugPrint("error:=========> ${state.message}");
          buildSnackBar(context, 'Booking failed ',isError: true);
        }
      },
      builder: (context, state) {
        if (state is AvailableSlotLoading ||
            state is BookAppointmentLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AvailableSlotFailure) {
          return Center(child: Text(state.message));
        }

        if (state is AvailableSlotSuccess) {
          return ListView.builder(
            itemCount: state.slots.length,
            itemBuilder: (context, index) {
              final slot = state.slots[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    ),
                    onPressed: () async {
                      final token = await TokenStorage().getToken();
                      debugPrint("slot id ==> ${slot.slotId} ");
                      debugPrint("token ==> $token ");

                      context.read<AvailableSlotCubit>().bookAppointment(
                        slotId: slot.slotId,
                        token: token!,
                        reason: 'String',
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
