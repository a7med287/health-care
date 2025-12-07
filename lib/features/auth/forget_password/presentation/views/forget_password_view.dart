import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/auth/forget_password/data/services/forget_password_service.dart';
import 'package:health_care/features/auth/forget_password/presentation/views/vview.dart';

import '../../cubit/forget_password_cubit.dart';
import '../../cubit/forget_password_state.dart';


class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29BBCC),
      body: SafeArea(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordOtpSent) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => VerifyOtpView()),
              );
            }
            if (state is ForgetPasswordFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
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
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Forget Password",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
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
                                    .sendOtp(emailController.text.trim());
                              },
                              child: const Text(
                                "Send OTP",
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
