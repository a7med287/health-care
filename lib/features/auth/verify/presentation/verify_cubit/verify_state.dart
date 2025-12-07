abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {}

class VerifyFailure extends VerifyState {
  final String message;
  VerifyFailure(this.message);
}

class ResendOtpLoading extends VerifyState {}

class ResendOtpSuccess extends VerifyState {}

class ResendOtpFailure extends VerifyState {
  final String message;
  ResendOtpFailure(this.message);
}

class CountdownTick extends VerifyState {
  final int seconds;
  CountdownTick(this.seconds);
}

class CountdownFinished extends VerifyState {}
