import 'package:flutter/material.dart';

import '../widgets/verify_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: VerifyViewBody()
    );
  }
}


