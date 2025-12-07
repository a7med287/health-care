import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/auth/forget_password/data/services/forget_password_service.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordService service;

  String? email;
  String? resetToken;

  ForgetPasswordCubit(this.service) : super(ForgetPasswordInitial());

  Future<void> sendOtp(String userEmail) async {
    emit(ForgetPasswordLoading());

    try {
      email = userEmail;
      await service.sendOtp(userEmail);
      emit(ForgetPasswordOtpSent());
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString()));
    }
  }

  Future<void> verifyOtp(String otp) async {
    emit(ForgetPasswordLoading());

    try {
      resetToken = await service.verifyOtp(
        email: email!,
        otp: otp,
      );
      emit(ForgetPasswordOtpVerified());
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString()));
    }
  }

  Future<void> resetPassword(String newPassword) async {
    emit(ForgetPasswordLoading());

    try {
      await service.resetPassword(
        email: email!,
        token: resetToken!,
        newPassword: newPassword,
      );
      emit(ForgetPasswordResetSuccess());
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString()));
    }
  }
}
