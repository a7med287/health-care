import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/helpers/build_snak_bar.dart';
import 'package:health_care/features/auth/login/presentaion/views/login_view.dart';
import 'package:health_care/features/auth/verify/presentation/widgets/verify_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../verify_cubit/verify_cubit.dart';

class VerifyViewBodyBlockConsumer extends StatelessWidget {
  const VerifyViewBodyBlockConsumer({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifySuccess) {
          buildSnackBar(context, "Verified Successful, Login");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        } else if (state is VerifyFailure) {
          buildSnackBar(context, state.errorMessage, isError: true);
          debugPrint(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is VerifyLoading,
          child: VerifyViewBody(email: email,),
        );
      },
    );
  }
}
