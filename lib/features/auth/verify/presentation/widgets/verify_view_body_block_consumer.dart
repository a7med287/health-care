import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/helpers/build_snak_bar.dart';
import 'package:health_care/features/auth/login/presentaion/views/login_view.dart';
import 'package:health_care/features/auth/verify/presentation/widgets/verify_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../verify_cubit/verify_cubit.dart';
import '../verify_cubit/verify_state.dart';

class VerifyViewBodyBlockConsumer extends StatelessWidget {
  const VerifyViewBodyBlockConsumer({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifySuccess) {
          buildSnackBar(context, "Verified Successful, Login");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        } else if (state is VerifyFailure) {
          buildSnackBar(context, "OTP is not correct", isError: true);
          debugPrint(state.message);
        }
        if (state is ResendOtpSuccess) {
          buildSnackBar(context, "Otp Resend Successful");
        } else if (state is ResendOtpFailure) {
          buildSnackBar(context, state.message, isError: true);
          debugPrint(state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is VerifyLoading || state is ResendOtpLoading,
          child: SafeArea(child: VerifyViewBody(email: email,)),
        );
      },
    );
  }
}
