import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../core/storage/token_storage.dart';
import '../../data/services/login_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService service;
  final TokenStorage tokenStorage = TokenStorage();

  LoginCubit(this.service) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final response = await service.login(email: email, password: password);

      final data = response.data;
      final int statusCode = data['statusCode'];

      if (statusCode == 200 || statusCode == 201) {
        final auth = data['auth'];

        await tokenStorage.saveToken(
          token: auth['token'],
          refreshToken: auth['refreshtoken'],
          expiry: auth['tokenexpiry'],
        );

        emit(LoginSuccess());
      } else if (statusCode == 202) {
        emit(LoginOtpRequired(data['verification']['email']));
      } else {
        emit(LoginFailure(data['message'] ?? "Login failed"));
      }
    } on DioException {
      emit(LoginFailure("No internet connection"));
    } catch (e) {
      emit(LoginFailure("Unexpected error"));
    }
  }
}
