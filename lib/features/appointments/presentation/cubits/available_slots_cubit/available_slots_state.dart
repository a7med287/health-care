part of 'available_slots_cubit.dart';

/// Base sealed class for available slots states
/// 
/// This ensures type safety and exhaustive pattern matching
@immutable
sealed class AvailableSlotsState {}

/// Initial state when the available slots cubit is first created
/// 
/// This is the default state before any fetch action is performed
final class AvailableSlotsInitial extends AvailableSlotsState {}

/// State emitted when fetching available slots is in progress
/// 
/// This state is shown to the user to indicate that slots
/// are being loaded from the API
class AvailableSlotsLoading extends AvailableSlotsState {}

/// State emitted when available slots are successfully fetched
/// 
/// This state contains the list of available slots that can be
/// displayed to the user for selection
class AvailableSlotsSuccess extends AvailableSlotsState {
  /// List of available appointment slots
  final List<AvailableSlotModel> slots;

  AvailableSlotsSuccess({required this.slots});
}

/// State emitted when fetching available slots fails
/// 
/// This state contains the error message that explains why
/// the fetch operation failed
class AvailableSlotsFailure extends AvailableSlotsState {
  /// Error message describing the failure reason
  final String errorMessage;

  AvailableSlotsFailure(this.errorMessage);
}

