import 'package:health_care/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> login(String email, String password);
}
