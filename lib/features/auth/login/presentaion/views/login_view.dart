import 'package:flutter/material.dart';
import 'package:health_care/features/auth/login/presentaion/views/widgets/login_view_body.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody()
    );
  }
}

