import 'package:dio/dio.dart';

class LoginService {
  final Dio dio;

  LoginService()
      : dio = Dio(
    BaseOptions(
      baseUrl: "https://d3.deltauniv.edu.eg/api",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      validateStatus: (status) => true,
    ),
  ) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  Future<Response> login({
    required String email,
    required String password,
  }) {
    return dio.post(
      "/Auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}
