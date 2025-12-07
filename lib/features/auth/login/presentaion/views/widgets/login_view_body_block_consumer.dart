import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/helpers/build_snak_bar.dart';
import '../../../../../../core/storage/token_storage.dart';
import '../../../../verify/presentation/views/verify_view.dart';
import '../../login_cubit/login_cubit.dart';
import 'login_view_body.dart';

class LoginViewBodyBlockConsumer extends StatelessWidget {
  const LoginViewBodyBlockConsumer({super.key});

  @override
  Widget build(BuildContext context)  {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async{
        if (state is LoginSuccess) {
          buildSnackBar(context, "Login Successful");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
          final token = await TokenStorage().getToken();
          print(" token is: $token");
        }

        if (state is LoginOtpRequired) {
          buildSnackBar(context, "Verify your email");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => VerifyView(email: state.email)),
          );
        }

        if (state is LoginFailure) {
          buildSnackBar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
