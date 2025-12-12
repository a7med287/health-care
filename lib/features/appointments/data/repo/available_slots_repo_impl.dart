import 'package:dio/dio.dart';
import '../models/available_slot_model.dart';
import 'available_slots_repo.dart';

/// Implementation of the AvailableSlotsRepo interface
/// 
/// This class handles the actual API call to fetch available slots
/// using Dio for HTTP requests
class AvailableSlotsRepoImpl extends AvailableSlotsRepo {
  /// Dio instance configured with base URL and timeout settings
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://d3.deltauniv.edu.eg/api",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  /// Fetches available slots by sending a GET request to the API
  /// 
  /// [doctorId] - The ID of the doctor
  /// [date] - The date in YYYY-MM-DD format
  /// 
  /// Returns a list of available slots
  /// Throws an exception if:
  /// - Invalid doctor ID or date (400)
  /// - No available slots found (404)
  /// - Network or server errors occur
  @override
  Future<List<AvailableSlotModel>> getAvailableSlots({
    required String doctorId,
    required String date,
  }) async {
    try {
      final response = await _dio.get(
        "/Appointments/available-slots/$doctorId",
        queryParameters: {
          'date': date,
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response data
        final data = response.data;
        
        // Handle different response formats
        if (data is List) {
          // If the API returns a list of slots
          return data
              .map((slot) => AvailableSlotModel.fromJson(slot))
              .toList();
        } else if (data is Map<String, dynamic>) {
          // If the API returns an object with a slots array
          final slots = data['slots'] ?? data['value'] ?? data['data'] ?? [];
          if (slots is List) {
            return slots
                .map((slot) => AvailableSlotModel.fromJson(slot))
                .toList();
          }
        }
        
        // If no slots found in the response
        return [];
      } else {
        throw Exception("Failed to fetch available slots: ${response.statusCode}");
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        if (statusCode == 400) {
          throw Exception("Invalid doctor ID or date");
        } else if (statusCode == 404) {
          throw Exception("No available slots found");
        } else {
          throw Exception("Failed to fetch available slots: $statusCode");
        }
      } else {
        // Network or other errors
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      // Handle any other unexpected errors
      throw Exception("Failed to fetch available slots: ${e.toString()}");
    }
  }
}

