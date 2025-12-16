class LocalAppointmentModel {
  final String doctorName;
  final String clinicName;
  final String date;
  final String time;

  LocalAppointmentModel({
    required this.doctorName,
    required this.clinicName,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() => {
        'doctorName': doctorName,
        'clinicName': clinicName,
        'date': date,
        'time': time,
      };

  factory LocalAppointmentModel.fromJson(
      Map<String, dynamic> json) {
    return LocalAppointmentModel(
      doctorName: json['doctorName'],
      clinicName: json['clinicName'],
      date: json['date'],
      time: json['time'],
    );
  }
}
