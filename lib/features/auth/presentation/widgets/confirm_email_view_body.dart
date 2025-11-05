import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/core/utils/styles.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/features/auth/presentation/views/create_new_password_view.dart';
import 'package:health_care/generated/l10n.dart';

import '../../../../core/utils/app_images.dart';

class ConfirmEmailViewBody extends StatelessWidget {
  const ConfirmEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // back image
          SizedBox(
            width: double.infinity,
            child: Image.asset(Assets.backAuthImage, fit: BoxFit.fill),
          ),

          // logo
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

          // confirm email section
          Positioned(
            bottom: MediaQuery.of(context).size.height * .3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).activationcode,
                          style: Styles.textStyleBold24,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).enterActivationCode,
                          textAlign: TextAlign.center,
                          style: Styles.textStyleRegular16,
                        ),
                        const SizedBox(height: 20),

                        //input code fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            4,
                            (index) => SizedBox(
                              width: 50,
                              height: 50,
                              child: TextField(
                                controller: null,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 3) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        //timer text
                        const SizedBox(height: 20),

                        // Send button
                        CustomButton(
                          text: S.of(context).confirm,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateNewPasswordView(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 12),

                        // Resend text
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            S.of(context).resendCode,
                            style: Styles.textStyleMedium16.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                            ),
                          ),
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
