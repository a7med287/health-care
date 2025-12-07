import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:health_care/features/auth/verify/data/services/verify_email_register.dart';
import 'package:health_care/features/auth/verify/presentation/verify_cubit/verify_state.dart';


class VerifyCubit extends Cubit<VerifyState> {
  final VerifyService repo;

  Timer? _timer;
  int countdown = 60;

  VerifyCubit(this.repo) : super(VerifyInitial());
  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    emit(VerifyLoading());

    try {
      await repo.verify(email: email, otp: otp);

      emit(VerifySuccess());
    } catch (e) {
      emit(VerifyFailure(e.toString()));
    }
  }

  Future<void> resendOtp(String email) async {
    emit(ResendOtpLoading());

    try {
      await repo.resendOtp(email);
      startCountdown();
      emit(ResendOtpSuccess());
    } catch (e) {
      emit(ResendOtpFailure(e.toString()));
    }
  }

  void startCountdown() {
    countdown = 60;

    _timer?.cancel();
    emit(CountdownTick(countdown));

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;

      emit(CountdownTick(countdown));

      if (countdown == 0) {
        timer.cancel();
        emit(CountdownFinished());
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
