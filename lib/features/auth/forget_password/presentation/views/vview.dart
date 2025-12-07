import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/forget_password_cubit.dart';
import '../../cubit/forget_password_state.dart';
import 'reset_password_view.dart';

class VerifyOtpView extends StatelessWidget {
  VerifyOtpView({super.key});

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29BBCC),
      body: SafeArea(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordOtpVerified) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => ResetPasswordView()),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Verify OTP",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter OTP",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    state is ForgetPasswordLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff29BBCC),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                context
                                    .read<ForgetPasswordCubit>()
                                    .verifyOtp(otpController.text.trim());
                              },
                              child: const Text(
                                "Verify",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
