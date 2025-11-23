import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:health_care/constants.dart';
import 'package:health_care/core/helpers/build_snak_bar.dart';
import 'package:health_care/core/services/shared_prefrences_singletone.dart';
import 'package:health_care/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:health_care/features/home/presentation/views/home_view.dart';

import '../../cubits/login_cubit/login_cubit.dart';

class LoginViewBodyBlockConsumer extends StatelessWidget {
  const LoginViewBodyBlockConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          buildSnackBar(context, "Logged in Success");
          //Prefs.setBool(kIsLoggedIn, true);
          final savedToken = Prefs.getString(tokenKey);
          debugPrint("token: $savedToken");
          Navigator.pushReplacementNamed(context, HomeView.routName);
        }
        if (state is LoginFailure) {
          buildSnackBar(context, state.errorMessage, isError: true);
          debugPrint(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
