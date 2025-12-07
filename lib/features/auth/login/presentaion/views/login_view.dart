import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/auth/login/data/services/login_services.dart';
import 'package:health_care/features/auth/login/presentaion/login_cubit/login_cubit.dart';
import 'package:health_care/features/auth/login/presentaion/views/widgets/login_view_body_block_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginService()),
      child: Scaffold(body: LoginViewBodyBlockConsumer()),
    );
  }
}
