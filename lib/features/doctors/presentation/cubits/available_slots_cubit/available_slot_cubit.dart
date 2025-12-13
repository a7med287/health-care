import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/available_slot_model.dart';
import '../../../data/services/appointments_service.dart';

part 'available_slot_state.dart';

class AvailableSlotCubit extends Cubit<AvailableSlotState> {
  final AppointmentsService service;

  AvailableSlotCubit(this.service) : super(AvailableSlotInitial());

  Future<void> getAvailableSlots({
    required String doctorId,
    required String token,
  }) async {
    emit(AvailableSlotLoading());
    try {
      final response = await service.getAvailableSlots(
        doctorId: doctorId,
        token: token,
      );
      emit(AvailableSlotSuccess(response.slots));
    } catch (e) {
      emit(AvailableSlotFailure(e.toString()));
    }
  }

  Future<void> bookAppointment({
    required String slotId,
    required String reason,
    required String token,
  }) async {
    emit(BookAppointmentLoading());
    try {
      final appointmentId = await service.bookAppointment(
        slotId: slotId,
        reason: reason,
        token: token,
      );
      emit(BookAppointmentSuccess(appointmentId));
    } catch (e) {
      emit(BookAppointmentFailure(e.toString()));
    }
  }

}
