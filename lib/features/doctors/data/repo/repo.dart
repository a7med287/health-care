import 'package:health_care/features/doctors/data/models/doctoe_model.dart';

abstract class DoctorRepo{
  Future<List<DoctorsModel>> fetchDoctors({required String clinicId});
}