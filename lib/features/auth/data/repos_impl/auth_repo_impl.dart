import 'package:health_care/core/services/api_services.dart';
import 'package:health_care/core/services/database_services.dart';
import 'package:health_care/features/auth/data/models/user_model.dart';
import 'package:health_care/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServices apiServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl(this.databaseServices, {required this.apiServices});
  @override
  Future<UserModel> login(String email, String password) async {
    var response = await apiServices.post(
      "Auth/login",
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
      body: {"email": email, "password": password},
    );

    if (response["statusCode"] != null && response["statusCode"] != 200) {
      throw Exception(response["message"] ?? "Login failed");
    }

    final token = response["auth"]["token"];
    await databaseServices.saveToken(token);

    var user = UserModel.fromJson(response["user"]);

    return user;
  }
}
