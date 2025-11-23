import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:health_care/features/auth/data/models/user_model.dart';
import 'package:health_care/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      var user = await authRepo.login(email, password);
      emit(LoginSuccess(userModel: user));
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains("Invalid email or password") ||
          errorMessage.contains("الوصول غير مصرح به")) {
        emit(
          LoginFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "اسم المستخدم أو كلمة المرور غير صحيحة"
                    : "email or password is not correct",
          ),
        );
      } else if (errorMessage.contains("لا يوجد اتصال بالإنترنت")) {
        emit(
          LoginFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? " لا يوجد اتصال بالإنترنت"
                    : "No Internet connection",
          ),
        );
      } else if (errorMessage.contains("Email not confirmed")) {
        emit(
          LoginFailure(
            errorMessage:
                Intl.getCurrentLocale() == "ar"
                    ? "البريد الإلكتروني غير مؤكد"
                    : "Email not confirmed",
          ),
        );
      } else {
        emit(LoginFailure(errorMessage: "حصل خطأ: $errorMessage"));
      }
    }
  }
}
