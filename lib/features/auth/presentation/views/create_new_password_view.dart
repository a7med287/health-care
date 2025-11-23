import 'package:flutter/material.dart';
import 'package:health_care/features/auth/presentation/views/widgets/create_new_password_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const CreateNewPasswordBody(),
    );
  }
}
