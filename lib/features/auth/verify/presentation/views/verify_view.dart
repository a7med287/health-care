import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/auth/verify/data/services/verify_email_register.dart';
import 'package:health_care/features/auth/verify/presentation/verify_cubit/verify_cubit.dart';

import '../widgets/verify_view_body_block_consumer.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(VerifyRegister(Dio())),
      child: Scaffold(

          body: VerifyViewBodyBlockConsumer(email: email)
      ),
    );
  }
}




