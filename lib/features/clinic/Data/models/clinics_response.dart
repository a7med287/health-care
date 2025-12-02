
import 'package:health_care/features/clinic/Data/models/cllinic_model.dart';

class ClinicsResponse {
  final int statusCode;
  final String message;
  final int pageIndex;
  final int pageSize;
  final int count;
  final List<ClinicModel> clinics;

  ClinicsResponse({
    required this.statusCode,
    required this.message,
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.clinics,
  });

  factory ClinicsResponse.fromJson(Map<String, dynamic> json) {
    return ClinicsResponse(
      statusCode: json["statusCode"],
      message: json["message"],
      pageIndex: json["pageindex"],
      pageSize: json["pagesize"],
      count: json["count"],
      clinics: (json["list"] as List)
          .map((e) => ClinicModel.fromJson(e))
          .toList(),
    );
  }
}
