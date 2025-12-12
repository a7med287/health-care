/// Model representing the request body for booking an appointment
/// 
/// This model is used to send booking data to the API endpoint
/// POST /api/Appointments/book
class BookingRequestModel {
  /// The ID of the time slot to book
  final String slotId;
  
  /// The reason for the appointment visit
  final String reason;

  BookingRequestModel({
    required this.slotId,
    required this.reason,
  });

  /// Converts the model to JSON format for API request
  Map<String, dynamic> toJson() {
    return {
      "slotid": slotId,
      "reason": reason,
    };
  }
}

