import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/doctoe_model.dart';
import '../../../data/repo/repo.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {

  final DoctorRepo doctorRepo;

  DoctorCubit(this.doctorRepo) : super(DoctorInitial());

  Future<void> getDoctors({required String clinicId}) async {
    emit(DoctorLoading());

    try {
      final doctorsList = await doctorRepo.fetchDoctors(clinicId: clinicId);
      emit(DoctorSuccess(doctors: doctorsList));
    } catch (e) {
      emit(DoctorFailure(e.toString()));
    }
  }
}
