class AvailableSlotModel {
  final String slotId;
  final DateTime date;
  final String startTime;
  final String endTime;

  AvailableSlotModel({
    required this.slotId,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory AvailableSlotModel.fromJson(Map<String, dynamic> json) {
    return AvailableSlotModel(
      slotId: json['slotid'] ?? '',
      date: DateTime.parse(json['date']),
      startTime: json['starttime'] ?? '',
      endTime: json['endtime'] ?? '',
    );
  }
}
