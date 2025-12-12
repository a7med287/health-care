import 'package:dio/dio.dart';
import '../models/booking_request_model.dart';
import 'booking_repo.dart';

/// Implementation of the BookingRepo interface
/// 
/// This class handles the actual API call to book an appointment
/// using Dio for HTTP requests
class BookingRepoImpl extends BookingRepo {
  /// Dio instance configured with base URL and timeout settings
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://d3.deltauniv.edu.eg/api",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  /// Books an appointment by sending a POST request to the API
  /// 
  /// [request] - The booking request model containing slotId and reason
  /// 
  /// Throws an exception if:
  /// - The request is invalid (400)
  /// - The slot is not available (400)
  /// - Network or server errors occur
  @override
  Future<void> bookAppointment(BookingRequestModel request) async {
    try {
      final response = await _dio.post(
        "/Appointments/book",
        data: request.toJson(),
      );

      // Check if the booking was successful
      // API returns 200 (OK) or 201 (Appointment booked successfully)
      if (response.statusCode == 200 || response.statusCode == 201) {
        return; // Booking successful
      } else {
        // Handle unexpected status codes
        throw Exception("Failed to book appointment: ${response.statusCode}");
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        // Server responded with an error status code
        final statusCode = e.response!.statusCode;
        if (statusCode == 400) {
          throw Exception("Invalid request or slot not available");
        } else {
          throw Exception("Failed to book appointment: $statusCode");
        }
      } else {
        // Network or other errors
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      // Handle any other unexpected errors
      throw Exception("Failed to book appointment: ${e.toString()}");
    }
  }
}

