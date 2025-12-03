import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cllinic_model.dart';
import '../service/clinic_service.dart';
import 'clinic_state.dart';

class ClinicCubit extends Cubit<ClinicState> {
  final ClinicService clinicService;
  List<ClinicModel> _allClinics = []; // مخزّن النسخة الأصلية

  ClinicCubit(this.clinicService) : super(ClinicInitial());

  /// جلب كل العيادات من الباك (تُستدعى عند فتح الصفحة)
  Future<void> getAllClinics() async {
    emit(ClinicLoading());
    try {
      _allClinics = await clinicService.fetchClinics();
      emit(ClinicSuccess(_allClinics));
    } catch (e) {
      emit(ClinicFailure(e.toString()));
    }
  }

  /// فلترة محليًا بحسب اسم التخصص
  Future<void> filterBySpecialty(String? specialty) async {
    // لو specialty == null أو empty -> نعرض الكل
    if (specialty == null || specialty.trim().isEmpty) {
      emit(ClinicSuccess(_allClinics));
      return;
    }

    emit(ClinicLoading());
    try {
      final filtered = _allClinics
          .where((c) =>
              (c.medicalSpecialty ?? "").trim().toLowerCase() ==
              specialty.trim().toLowerCase())
          .toList();

      emit(ClinicSuccess(filtered));
    } catch (e) {
      emit(ClinicFailure(e.toString()));
    }
  }
}
