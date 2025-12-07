abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordOtpSent extends ForgetPasswordState {}

class ForgetPasswordOtpVerified extends ForgetPasswordState {}

class ForgetPasswordResetSuccess extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;
  ForgetPasswordFailure(this.error);
}
