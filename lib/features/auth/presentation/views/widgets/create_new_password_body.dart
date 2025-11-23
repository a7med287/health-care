import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/core/utils/app_images.dart';
import 'package:health_care/core/utils/styles.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/core/widgets/password_text_filed.dart';
import 'package:health_care/features/auth/presentation/views/login_view.dart';
import 'package:health_care/generated/l10n.dart';

class CreateNewPasswordBody extends StatelessWidget {
  const CreateNewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(Assets.backAuthImage, fit: BoxFit.fill),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * .09,
            child: Column(
              children: [
                SvgPicture.asset(Assets.logo),
                SvgPicture.asset(Assets.textLogo),
              ],
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * .3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).createNewPassword,
                          style: Styles.textStyleBold24,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          S.of(context).newPassword,
                          style: Styles.textStyleRegular16,
                        ),
                        const SizedBox(height: 8),
                        const PasswordTextFormField(),
                        const SizedBox(height: 16),
                        Text(
                          S.of(context).confirmPassword,
                          style: Styles.textStyleRegular16,
                        ),
                        const SizedBox(height: 8),
                        const PasswordTextFormField(),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: S.of(context).save,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
