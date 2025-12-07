import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:health_care/features/auth/login/presentaion/login_cubit/login_cubit.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/password_text_filed.dart';
import 'dont_have_an_account_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              Center(
                child: const Icon(
                  Icons.medical_services,
                  size: 70,
                  color: AppColors.mainColor,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibreBaskerville',
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sign in to your account",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'aago',
                ),
              ),

              const SizedBox(height: 32),

              CustomTextFormField(
                hintText: "Email",
                iconData: Icons.email_outlined,
                textInputType: TextInputType.emailAddress,
                onSaved: (value) => email = value ?? "",
              ),

              const SizedBox(height: 16),

              PasswordTextFormField(onSaved: (value) => password = value ?? ""),

              TextButton(
                onPressed: () {
                  // Forgot password
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordView(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              CustomButton(
                text: "Sign In",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<LoginCubit>().login(
                      email: email,
                      password: password,
                    );
                  }
                },
              ),

              const SizedBox(height: 16),

              const DontHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
