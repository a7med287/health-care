import 'package:flutter/material.dart';
import 'package:health_care/features/auth/presentation/views/widgets/resgister_view_body_block_consumer.dart';
import 'package:health_care/generated/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String routName = "RegisterView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).register,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RegisterViewBodyBlockConsumer(),
    );
  }
}

