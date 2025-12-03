part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorSuccess extends DoctorState {
  final List<DoctorsModel> doctors;

  DoctorSuccess({required this.doctors});


}

class DoctorFailure extends DoctorState {
  final String errorMessage;

  DoctorFailure(this.errorMessage);

}