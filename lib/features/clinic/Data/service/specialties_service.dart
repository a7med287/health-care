import 'package:dio/dio.dart';

class SpecialtiesService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://d3.deltauniv.edu.eg/api"),
  );

  Future<List<String>> fetchSpecialties() async {
    final response = await _dio.get("/Appointments/specialties");

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => e["name"].toString())
          .toList();
    } else {
      throw Exception("Failed to load specialties");
    }
  }
}
