import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/available_slots_cubit/available_slot_cubit.dart';
import '../../data/services/appointments_service.dart';
import '../widgets/available_slots_builder.dart';

class AvailableAppointmentsView extends StatelessWidget {
  final String doctorId;
  final String token;

  const AvailableAppointmentsView({
    super.key,
    required this.doctorId,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AvailableSlotCubit>(
      create: (context) => AvailableSlotCubit(
        context.read<AppointmentsService>(),
      )..getAvailableSlots(
        doctorId: doctorId,
        token: token,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Available Appointments'),
        ),
        body: const AvailableAppointmentsViewBodyBlockConsumer(),
      ),
    );
  }
}
