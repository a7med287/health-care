class RegisterRequestModel {
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "fullname": fullName,
      "phoneNumber": phoneNumber,
    };
  }
}
