import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/helpers/build_snak_bar.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/core/widgets/custom_text_form_field.dart';
import 'package:health_care/features/auth/forget_password/presentation/views/vview.dart';
import '../../../verify/presentation/widgets/lock_image_widget.dart';
import '../../cubit/forget_password_cubit.dart';
import '../../cubit/forget_password_state.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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

            buildSnackBar(context, "OTP sent Successful");
          }
          if (state is ForgetPasswordFailure) {
           buildSnackBar(context, "Email is not correct", isError: true);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      const LockImageWidget(icon: Icons.lock_person),
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
                      const Text(
                        "Don't worry! it happens. Please enter the address associated with your account",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "aago",
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),

                      CustomTextFormField(
                        textController: emailController,
                        iconData: Icons.email,
                        textInputType: TextInputType.emailAddress,
                        hintText: "Email",
                      ),

                      SizedBox(height: 16),

                      state is ForgetPasswordLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: "Send OTP",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.read<ForgetPasswordCubit>().sendOtp(
                                    emailController.text.trim(),
                                  );
                                } else {
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
                                  });
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
