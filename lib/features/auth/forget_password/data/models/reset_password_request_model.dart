class ResetPasswordRequestModel {
  final String email;
  final String token;
  final String expiresAt;
  final String newPassword;

  ResetPasswordRequestModel({
    required this.email,
    required this.token,
    required this.expiresAt,
    required this.newPassword,
  });
}
