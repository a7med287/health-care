import 'package:dio/dio.dart';
import '../model/register_request_model.dart';

class RegisterService {
  final Dio dio;

  RegisterService(this.dio);

  Future<void> register(RegisterRequestModel model) async {
    try {
      final response = await dio.post(
        "https://d3.deltauniv.edu.eg/api/Auth/register",
        data: model.toJson(),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("حدث خطأ غير متوقع");
      }

    } on DioException catch (e) {
     // back_end errors 
      if (e.response != null) {
        final data = e.response?.data;

        if (data is Map && data["message"] != null) {
          throw Exception(data["message"]);
        } else {
          throw Exception("بيانات غير صالحة");
        }

      } else {
      // intenet errors 
        throw Exception("تحقق من الاتصال بالإنترنت");
      }
    } catch (e) {
      throw Exception("حدث خطأ ما");
    }
  }
}
