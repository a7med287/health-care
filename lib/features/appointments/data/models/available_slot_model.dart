/// Model representing an available appointment slot
/// 
/// This model contains the slot information returned from the API
/// when fetching available slots for a doctor on a specific date
class AvailableSlotModel {
  /// The unique identifier of the slot (used for booking)
  final String slotId;
  
  /// The display text for the slot (e.g., "09:00 AM - 09:30 AM")
  final String displayText;
  
  /// Optional: Start time of the slot
  final String? startTime;
  
  /// Optional: End time of the slot
  final String? endTime;

  AvailableSlotModel({
    required this.slotId,
    required this.displayText,
    this.startTime,
    this.endTime,
  });

  /// Creates an AvailableSlotModel from JSON response
  /// 
  /// The API response format may vary, so this handles common formats:
  /// - If the response is a string, it's used as both ID and display text
  /// - If the response is an object, it extracts slotId and time information
  factory AvailableSlotModel.fromJson(dynamic json) {
    if (json is String) {
      // If the API returns just a string (time slot)
      return AvailableSlotModel(
        slotId: json,
        displayText: json,
      );
    } else if (json is Map<String, dynamic>) {
      // If the API returns an object with slot details
      return AvailableSlotModel(
        slotId: json['slotId'] ?? json['id'] ?? json['slotid'] ?? '',
        displayText: json['displayText'] ?? 
                     json['time'] ?? 
                     json['slot'] ?? 
                     '${json['startTime'] ?? ''} - ${json['endTime'] ?? ''}',
        startTime: json['startTime']?.toString(),
        endTime: json['endTime']?.toString(),
      );
    } else {
      // Fallback for unexpected formats
      return AvailableSlotModel(
        slotId: json.toString(),
        displayText: json.toString(),
      );
    }
  }

  /// Converts the model to JSON format
  Map<String, dynamic> toJson() {
    return {
      'slotId': slotId,
      'displayText': displayText,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
    };
  }
}

