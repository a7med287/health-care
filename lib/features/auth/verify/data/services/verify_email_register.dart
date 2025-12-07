import 'package:dio/dio.dart';

class LoginService {
  final Dio dio;

  LoginService(this.dio);

  Future<void> login({
    required String email,
    required String otp,
  }) async {
    final response = await dio.post(
      "https://d3.deltauniv.edu.eg/api/Auth/email/verify",
      data: {
        "email": email,
        "Otp": otp,
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Verify Failed");
    }
  }

  Future<void> resendOtp(String email) async {
    final response = await dio.post(
      "https://d3.deltauniv.edu.eg/api/Auth/email/resend-otp?email=$email",
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Resend OTP Failed");
    }
  }
}
