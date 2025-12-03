class DoctorsModel {
  final String userId;
  final String fullName;
  final String email;
  final String clinicName;

  DoctorsModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.clinicName,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      userId: json['userid'] ?? '',
      fullName: json['fullname'] ?? '',
      email: json['email'] ?? '',
      clinicName: json['clinicname'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userid': userId,
      'fullname': fullName,
      'email': email,
      'clinicname': clinicName,
    };
  }
}
