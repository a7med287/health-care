class ClinicModel {
  final String id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final int price;
  final String? logoPath;
  final String medicalSpecialty;

  ClinicModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.price,
    required this.logoPath,
    required this.medicalSpecialty,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
      phone: json["phone"] ?? "",
      price: json["price"] ?? 0,
      logoPath: json["logopath"],
      medicalSpecialty: json["medicalspecialty"] ?? "",
    );
  }
}
