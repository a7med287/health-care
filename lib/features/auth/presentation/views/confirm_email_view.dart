import 'package:flutter/material.dart';
import 'widgets/confirm_email_view_body.dart';

class ConfirmEmailView extends StatelessWidget {
  const ConfirmEmailView({super.key});

  static const String routName = "ConfirmEmailView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: const ConfirmEmailViewBody());
  }
}

