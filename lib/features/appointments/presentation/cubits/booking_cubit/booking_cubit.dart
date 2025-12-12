import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/booking_request_model.dart';
import '../../../data/repo/booking_repo.dart';

part 'booking_state.dart';

/// Cubit for managing appointment booking state and operations
/// 
/// This cubit handles the business logic for booking appointments,
/// including making API calls and managing loading, success, and error states
class BookingCubit extends Cubit<BookingState> {
  /// Repository instance for making booking API calls
  final BookingRepo bookingRepo;

  /// Initializes the BookingCubit with a booking repository
  /// 
  /// [bookingRepo] - The repository implementation for booking operations
  BookingCubit(this.bookingRepo) : super(BookingInitial());

  /// Books an appointment with the provided slot ID and reason
  /// 
  /// This method:
  /// 1. Emits BookingLoading state
  /// 2. Calls the repository to book the appointment
  /// 3. Emits BookingSuccess on success
  /// 4. Emits BookingFailure on error
  /// 
  /// [slotId] - The ID of the time slot to book
  /// [reason] - The reason for the appointment visit
  Future<void> bookAppointment({
    required String slotId,
    required String reason,
  }) async {
    // Emit loading state to show progress indicator
    emit(BookingLoading());

    try {
      // Create booking request model
      final request = BookingRequestModel(
        slotId: slotId,
        reason: reason,
      );

      // Call repository to book the appointment
      await bookingRepo.bookAppointment(request);

      // Emit success state with confirmation message
      emit(BookingSuccess(
        message: "Appointment booked successfully",
      ));
    } catch (e) {
      // Emit failure state with error message
      emit(BookingFailure(e.toString()));
    }
  }

  /// Resets the cubit to initial state
  /// 
  /// This can be useful after showing success/error messages
  /// to prepare for the next booking attempt
  void reset() {
    emit(BookingInitial());
  }
}

