import 'package:dio/dio.dart';
import 'package:health_care/features/clinic/Data/models/cllinic_model.dart';
import '../models/clinics_response.dart';

class ClinicService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://d3.deltauniv.edu.eg/api",
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    ),
  );

  Future<List<ClinicModel>> fetchClinics() async {
    final response = await _dio.get("/Appointments/clinics");

    if (response.statusCode == 200) {
      final data = ClinicsResponse.fromJson(response.data);
      return data.clinics;
    } else {
      throw Exception("Failed to load clinics");
    }
  }
}
