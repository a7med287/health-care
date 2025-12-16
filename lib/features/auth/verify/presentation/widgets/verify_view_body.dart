import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/auth/verify/presentation/widgets/pin_digits_widget.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../verify_cubit/verify_cubit.dart';
import 'lock_image_widget.dart';
import 'resend_otp_section.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({super.key, required this.email});

  final String email;

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  String otp = "";

  @override
  void initState() {
    super.initState();
    context.read<VerifyCubit>().startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const LockImageWidget(icon: Icons.verified_user_rounded),
            const SizedBox(height: 50),
            const Text(
              "Verify Your Account",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "LibreBaskerville",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
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


            PinDigitsWidget(
              valueChangedCode: (value) {
                otp = value;
              },
            ),
        
            const SizedBox(height: 16),
        

            CustomButton(
              text: "Verify Code",
              onTap: () {
                context.read<VerifyCubit>().verifyEmail(
                  email: widget.email,
                  otp: otp,
                );
              },
              radius: 16,
            ),
            const SizedBox(height: 16),
        
            // 🔹 Resend OTP Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive any code?",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "aago",
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 6),
                ResendOtpSection(email: widget.email),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
