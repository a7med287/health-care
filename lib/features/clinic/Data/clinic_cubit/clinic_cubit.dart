import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/clinic/Data/clinic_cubit/clinic_state.dart';
import 'package:health_care/features/clinic/Data/service/clinic_service.dart';


class ClinicCubit extends Cubit<ClinicState> {
  final ClinicService clinicService;

  ClinicCubit(this.clinicService) : super(ClinicInitial());

  Future<void> getClinics() async {
    emit(ClinicLoading());
    try {
      final clinics = await clinicService.fetchClinics();
      emit(ClinicSuccess(clinics));
    } catch (e) {
      emit(ClinicFailure(e.toString()));
    }
  }
}
