import 'package:health_care/features/clinic/Data/models/cllinic_model.dart';

abstract class ClinicState {}

class ClinicInitial extends ClinicState {}

class ClinicLoading extends ClinicState {}

class ClinicSuccess extends ClinicState {
  final List<ClinicModel> clinics;
  ClinicSuccess(this.clinics);
}

class ClinicFailure extends ClinicState {
  final String error;
  ClinicFailure(this.error);
}
