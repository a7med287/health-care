part of 'booking_cubit.dart';

/// Base sealed class for booking states
/// 
/// This ensures type safety and exhaustive pattern matching
@immutable
sealed class BookingState {}

/// Initial state when the booking cubit is first created
/// 
/// This is the default state before any booking action is performed
final class BookingInitial extends BookingState {}

/// State emitted when a booking request is in progress
/// 
/// This state is shown to the user to indicate that the booking
/// is being processed
class BookingLoading extends BookingState {}

/// State emitted when an appointment is successfully booked
/// 
/// This state indicates that the booking operation completed successfully
/// and the appointment has been confirmed
class BookingSuccess extends BookingState {
  /// Optional message to display to the user
  final String? message;

  BookingSuccess({this.message});
}

/// State emitted when booking fails
/// 
/// This state contains the error message that explains why
/// the booking operation failed
class BookingFailure extends BookingState {
  /// Error message describing the failure reason
  final String errorMessage;

  BookingFailure(this.errorMessage);
}

