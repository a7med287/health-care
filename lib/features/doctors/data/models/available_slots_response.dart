import 'available_slot_model.dart';

class AvailableSlotsResponse {
  final List<AvailableSlotModel> slots;

  AvailableSlotsResponse({required this.slots});

  factory AvailableSlotsResponse.fromJson(Map<String, dynamic> json) {
    return AvailableSlotsResponse(
      slots: (json['value'] as List)
          .map((e) => AvailableSlotModel.fromJson(e))
          .toList(),
    );
  }
}
