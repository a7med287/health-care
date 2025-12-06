import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/password_text_filed.dart';
import 'dont_have_an_account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'LibreBaskerville',
              ),
            ),
            const SizedBox(height: 8),
            Text(
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
            ),
            const SizedBox(height: 16),
            PasswordTextFormField(),
            TextButton(
              onPressed: () {
                //here
              },
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 12),
            CustomButton(text: "Sign In", onTap: () {}),

            const SizedBox(height: 16),

            DontHaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
