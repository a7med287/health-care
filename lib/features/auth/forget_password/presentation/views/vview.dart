import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/helpers/build_snak_bar.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/features/auth/verify/presentation/widgets/pin_digits_widget.dart';

import '../../../verify/presentation/widgets/lock_image_widget.dart';
import '../../cubit/forget_password_cubit.dart';
import '../../cubit/forget_password_state.dart';
import 'reset_password_view.dart';

class VerifyOtpView extends StatelessWidget {
  VerifyOtpView({super.key});

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordOtpVerified) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => ResetPasswordView()),
              );

              buildSnackBar(
                context,
                "Email verified Successful, reset your password",
              );
            }
            if(state is ForgetPasswordOtpFailure){
              buildSnackBar(context, "OTP is Not correct",isError: true);
            }

          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    const LockImageWidget(icon: Icons.verified_user_rounded),
                    const SizedBox(height: 40),
                    const Text(
                      "Verify your email",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "LibreBaskerville",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "We have sent you the OTP, enter it now to continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "aago",
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),

                    PinDigitsWidget(
                      controller: otpController,
                      valueChangedCode: (value) {
                        otpController.text = value;
                      },
                    ),

                    SizedBox(height: 16,),
                    state is ForgetPasswordLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(text: "Verify", onTap: (){
                        context
                          .read<ForgetPasswordCubit>()
                          .verifyOtp(
                        otpController.text.trim(),
                      );
                    },),


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
