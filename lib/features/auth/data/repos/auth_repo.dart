import 'package:health_care/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> login(String email, String password);
  Future<bool> register(
    String fullName,
    String email,
    String password,
    String phoneNumber,
  );
}
