part of 'available_slot_cubit.dart';

@immutable
sealed class AvailableSlotState {}

final class AvailableSlotInitial extends AvailableSlotState {}

class AvailableSlotLoading extends AvailableSlotState {}

class AvailableSlotSuccess extends AvailableSlotState {
  final List<AvailableSlotModel> slots;

  AvailableSlotSuccess(this.slots);
}

class AvailableSlotFailure extends AvailableSlotState {
  final String message;

  AvailableSlotFailure(this.message);
}



class BookAppointmentLoading extends AvailableSlotState {}

class BookAppointmentSuccess extends AvailableSlotState {
  final String appointmentId;
  BookAppointmentSuccess(this.appointmentId);
}

class BookAppointmentFailure extends AvailableSlotState {
  final String message;
  BookAppointmentFailure(this.message);
}
