part of 'verify_cubit.dart';

@immutable
sealed class VerifyState {}

final class VerifyInitial extends VerifyState {}
class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {}

class VerifyFailure extends VerifyState {
  final String errorMessage;

  VerifyFailure(this.errorMessage);

}

class ResendOtpLoading extends VerifyState {}

class ResendOtpSuccess extends VerifyState {}

class ResendOtpFailure extends VerifyState {
  final String errorMessage;
  ResendOtpFailure(this.errorMessage);
}