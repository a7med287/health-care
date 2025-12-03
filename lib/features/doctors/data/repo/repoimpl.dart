
import 'package:dio/dio.dart';
import 'package:health_care/features/doctors/data/repo/repo.dart';

import '../models/doctoe_model.dart';


class DoctorRepoImpl extends DoctorRepo{


  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://d3.deltauniv.edu.eg/api",
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    ),
  );

  @override
  Future<List<DoctorsModel>> fetchDoctors({required String clinicId}) async {
    final response = await _dio.get("/Appointments/doctors/$clinicId");

    if (response.statusCode == 200) {

      final List<dynamic> list = response.data["value"];
      return list.map((e) => DoctorsModel.fromJson(e)).toList();

    } else {
      throw Exception("Failed to load doctors");
    }

  }

}