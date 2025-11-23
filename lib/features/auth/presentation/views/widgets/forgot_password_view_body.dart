import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/core/utils/styles.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/core/widgets/custom_text_form_field.dart';
import 'package:health_care/features/auth/presentation/views/confirm_email_view.dart';
import 'package:health_care/generated/l10n.dart';
import '../../../../../core/utils/app_images.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

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
                      children: [
                        Text(
                          S.of(context).changePassword,
                          style: Styles.textStyleBold24.copyWith(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).forgotPasswordHint,
                          textAlign: TextAlign.center,
                          style: Styles.textStyleRegular16.copyWith(
                            color: Colors.grey[600],
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 25),

                        ///   الإيميل
                        const CustomTextFormField(
                          iconData: Icons.email_outlined,

                          textInputType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 25),

                        CustomButton(
                          text: S.of(context).sendResetLink,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConfirmEmailView(),
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
