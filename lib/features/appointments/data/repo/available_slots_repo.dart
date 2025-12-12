import '../models/available_slot_model.dart';

/// Abstract repository interface for fetching available appointment slots
/// 
/// This interface defines the contract for retrieving available slots
/// and allows for easy testing and dependency injection
abstract class AvailableSlotsRepo {
  /// Fetches available appointment slots for a doctor on a specific date
  /// 
  /// [doctorId] - The unique identifier of the doctor
  /// [date] - The date to check availability (format: YYYY-MM-DD)
  /// 
  /// Returns a list of AvailableSlotModel representing available time slots
  /// Throws an exception if the request fails
  Future<List<AvailableSlotModel>> getAvailableSlots({
    required String doctorId,
    required String date,
  });
}

