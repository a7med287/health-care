import 'package:bloc/bloc.dart';
import 'package:health_care/features/auth/verify/data/services/verify_email_register.dart';
import 'package:meta/meta.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final VerifyRegister verifyRegister;
  VerifyCubit(this.verifyRegister) : super(VerifyInitial());
  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    emit(VerifyLoading());

    try {
      await verifyRegister.verify(email: email, otp: otp);

      emit(VerifySuccess());
    } catch (e) {
      emit(VerifyFailure(e.toString()));
    }
  }

  Future<void> resendOtp(String email) async {
    emit(ResendOtpLoading());
    try {
      await verifyRegister.resendOtp(email);
      emit(ResendOtpSuccess());
    } catch (e) {
      emit(ResendOtpFailure(e.toString()));
    }
  }
}
