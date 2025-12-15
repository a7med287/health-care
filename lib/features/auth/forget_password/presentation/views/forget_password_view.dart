import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/auth/forget_password/presentation/views/vview.dart';
import '../../../verify/presentation/widgets/lock_image_widget.dart';
import '../../cubit/forget_password_cubit.dart';
import '../../cubit/forget_password_state.dart';


class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
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
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const LockImageWidget(icon: Icons.email),
                  const SizedBox(height: 40),
                  const Text(
                    "Forgot Your Password",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "LibreBaskerville",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Text(
                      "Don’t worry! If you’ve forgotten your password,Write your email address and we’ll send you a verification code to reset",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "aago",
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32,),
                  Container(
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: AlignmentGeometry.topRight,
                        end: AlignmentGeometry.bottomLeft,
                        colors: [
                          AppColors.darkMainColor,
                          AppColors.mainColor
                        ],
                      ),
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
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
            
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.white
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
                                    backgroundColor: Colors.white,
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
                                  child:  Text(
                                    "Send OTP",
                                    style: TextStyle(fontSize: 16,color: AppColors.mainColor,fontWeight: FontWeight.bold ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
