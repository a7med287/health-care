import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/services/get_it_service.dart';
import 'package:health_care/features/auth/data/repos/auth_repo.dart';
import 'package:health_care/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:health_care/features/auth/presentation/views/widgets/login_view_body_block_consumer.dart';
import 'package:health_care/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routName = "LoginView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).login,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: LoginViewBodyBlockConsumer(),
      ),
    );
  }
}
