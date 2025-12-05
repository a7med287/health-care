import 'package:dio/dio.dart';
import 'package:health_care/features/auth/register/data/model/register_request_model.dart';


class RegisterService {
  final Dio dio;

  RegisterService(this.dio);

  Future<void> register(RegisterRequestModel model) async {
    final response = await dio.post(
      "https://d3.deltauniv.edu.eg/api/Auth/register",
      data: model.toJson(),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Register Failed");
    }
  }
}
