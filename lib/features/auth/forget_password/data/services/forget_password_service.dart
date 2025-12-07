import 'package:dio/dio.dart';

class ForgetPasswordService {
  final Dio dio;
  ForgetPasswordService(this.dio);

  Future<void> sendOtp(String email) async {
    final url =
        "https://d3.deltauniv.edu.eg/api/Auth/password/forgot?email=$email";

    final response = await dio.post(url);

    if (response.statusCode != 202) {
      throw Exception(response.data["message"]);
    }
  }

  Future<String> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await dio.post(
      "https://d3.deltauniv.edu.eg/api/Auth/password/verifyotp",
      data: {
        "email": email,
        "otp": otp,
      },
    );

    if (response.statusCode == 200) {
      return response.data["resettoken"];
    } else {
      throw Exception(response.data["message"]);
    }
  }

  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
  }) async {
    final response = await dio.post(
      "https://d3.deltauniv.edu.eg/api/Auth/password/reset",
      data: {
        "email": email,
        "token": token,
        "newPassword": newPassword,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.data["message"]);
    }
  }
}
