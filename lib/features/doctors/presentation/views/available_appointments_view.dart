import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/available_slots_cubit/available_slot_cubit.dart';
import '../../data/services/appointments_service.dart';
import '../widgets/available_slots_builder.dart';

class AvailableAppointmentsView extends StatelessWidget {
  final String doctorId;
  final String doctorName;
  final String clinicName;
  final String token;

  const AvailableAppointmentsView({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.clinicName,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
        body: AvailableAppointmentsViewBodyBlockConsumer(
          doctorName: doctorName,
          clinicName: clinicName,
        ),
      ),
    );
  }
}
