import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/available_slot_model.dart';
import '../../../data/repo/available_slots_repo.dart';

part 'available_slots_state.dart';

/// Cubit for managing available appointment slots state and operations
/// 
/// This cubit handles the business logic for fetching available slots,
/// including making API calls and managing loading, success, and error states
class AvailableSlotsCubit extends Cubit<AvailableSlotsState> {
  /// Repository instance for making available slots API calls
  final AvailableSlotsRepo availableSlotsRepo;

  /// Initializes the AvailableSlotsCubit with a repository
  /// 
  /// [availableSlotsRepo] - The repository implementation for fetching slots
  AvailableSlotsCubit(this.availableSlotsRepo) : super(AvailableSlotsInitial());

  /// Fetches available appointment slots for a doctor on a specific date
  /// 
  /// This method:
  /// 1. Emits AvailableSlotsLoading state
  /// 2. Calls the repository to fetch available slots
  /// 3. Emits AvailableSlotsSuccess with the slots on success
  /// 4. Emits AvailableSlotsFailure on error
  /// 
  /// [doctorId] - The unique identifier of the doctor
  /// [date] - The date to check availability (format: YYYY-MM-DD)
  Future<void> fetchAvailableSlots({
    required String doctorId,
    required String date,
  }) async {
    // Emit loading state to show progress indicator
    emit(AvailableSlotsLoading());

    try {
      // Call repository to fetch available slots
      final slots = await availableSlotsRepo.getAvailableSlots(
        doctorId: doctorId,
        date: date,
      );

      // Emit success state with the fetched slots
      emit(AvailableSlotsSuccess(slots: slots));
    } catch (e) {
      // Emit failure state with error message
      emit(AvailableSlotsFailure(e.toString()));
    }
  }

  /// Resets the cubit to initial state
  /// 
  /// This can be useful when switching doctors or dates
  /// to clear the previous state
  void reset() {
    emit(AvailableSlotsInitial());
  }
}

