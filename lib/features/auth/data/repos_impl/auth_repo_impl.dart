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
  
  @override
  Future<bool> register(
    String fullName, 
    String email, 
    String password, 
    String phoneNumber
    ) async {
    var response = await apiServices.post(
      "Auth/register",
      body: {
        "email": email,
        "password": password,
        "fullName": fullName,
        "phoneNumber" : phoneNumber,
      },
      headers: {
        "Content-Type": 'application/json',
        "Accept": "application/json",
      },
    );
    if (response["isSuccess"] == true && response["statusCode"] == 200) {
      return true;
    } else {
      final errors = response["errorCode"];
      if (errors is List) {
        throw Exception(errors.join("\n"));
      }
      throw Exception(response["message"]);
    }
  }
}
