import 'package:flutter/material.dart';
import 'package:health_care/features/auth/verify/presentation/widgets/pin_digits_widget.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'lock_image_widget.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const LockImageWidget(icon: Icons.attach_email_rounded),
          const SizedBox(height: 50),
          const Text(
            "Verify Your Account",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "LibreBaskerville",
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "We've sent a verification code. Please enter the code to verify your account",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "aago",
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          PinDigitsWidget(valueChangedCode: (value) {}),

          const SizedBox(height: 16),
          CustomButton(text: "Verify Code", onTap: () {},radius: 16,),
        ],
      ),
    );
  }
}
