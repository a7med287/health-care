import '../models/booking_request_model.dart';

/// Abstract repository interface for appointment booking operations
/// 
/// This interface defines the contract for booking appointments
/// and allows for easy testing and dependency injection
abstract class BookingRepo {
  /// Books an appointment for the current user (patient) in the specified slot
  /// 
  /// [request] - The booking request containing slotId and reason
  /// 
  /// Returns a Future that completes when the booking is successful
  /// Throws an exception if the booking fails
  Future<void> bookAppointment(BookingRequestModel request);
}

