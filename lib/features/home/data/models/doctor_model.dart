class DoctorModel {
  final String id;
  final String name;
  final String specialization;
  final String qualifications;
  final int yearsOfExperience;
  final int trustedPatients;
  final String location;
  final String hospital;
  final String description;
  final double consultationFeeMin;
  final double consultationFeeMax;
  final String imageUrl;
  final bool isVerified;
  final double rating;

  const DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.qualifications,
    required this.yearsOfExperience,
    required this.trustedPatients,
    required this.location,
    required this.hospital,
    required this.description,
    required this.consultationFeeMin,
    required this.consultationFeeMax,
    required this.imageUrl,
    this.isVerified = false,
    this.rating = 0.0,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      qualifications: json['qualifications'] ?? '',
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
      trustedPatients: json['trustedPatients'] ?? 0,
      location: json['location'] ?? '',
      hospital: json['hospital'] ?? '',
      description: json['description'] ?? '',
      consultationFeeMin: (json['consultationFeeMin'] ?? 0).toDouble(),
      consultationFeeMax: (json['consultationFeeMax'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      isVerified: json['isVerified'] ?? false,
      rating: (json['rating'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'qualifications': qualifications,
      'yearsOfExperience': yearsOfExperience,
      'trustedPatients': trustedPatients,
      'location': location,
      'hospital': hospital,
      'description': description,
      'consultationFeeMin': consultationFeeMin,
      'consultationFeeMax': consultationFeeMax,
      'imageUrl': imageUrl,
      'isVerified': isVerified,
      'rating': rating,
    };
  }

  String get fullLocation => '$hospital, $location';
  String get consultationFeeRange => 
      '\$${consultationFeeMin.toInt()}-\$${consultationFeeMax.toInt()}/ Consultation';
}

