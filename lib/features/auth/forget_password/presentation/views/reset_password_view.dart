import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/helpers/build_snak_bar.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/core/widgets/password_text_filed.dart';
import 'package:health_care/features/auth/login/presentaion/views/login_view.dart';
import '../../../verify/presentation/widgets/lock_image_widget.dart';
import '../../cubit/forget_password_cubit.dart';
import '../../cubit/forget_password_state.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordResetSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginView()),
              );
              buildSnackBar(context, "Reset Password Successful");
            }
            if(state is ForgetPasswordResetFailure){
              buildSnackBar(context, "Reset Failed",isError: true);
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      children: [
                        const LockImageWidget(icon: Icons.password),
                        const SizedBox(height: 40),
                        const Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "LibreBaskerville",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Enter your new password to continue",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "aago",
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),

                        PasswordTextFormField(controller: passController),
                        SizedBox(height: 16),

                        state is ForgetPasswordLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                text: "Reset Password",
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    context
                                        .read<ForgetPasswordCubit>()
                                        .resetPassword(
                                          passController.text.trim(),
                                        );
                                  } else {
                                    setState(() {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    });
                                  }
                                },
                              ),
                        SizedBox(height: 64),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
