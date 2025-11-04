import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/core/utils/styles.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/core/widgets/custom_text_form_field.dart';
import 'package:health_care/generated/l10n.dart';
import '../../../../core/utils/app_images.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

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

          // Change password section
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 36),

                      Text(
                        S.of(context).changePassword, 
                        style: Styles.textStyleBold24,
                      ),

                      const SizedBox(height: 12),

                      
                      Text(
                        S.of(context).forgotPasswordHint,
                        style: Styles.textStyleRegular16.copyWith(
                          color: Colors.grey[600], 
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        S.of(context).email,
                        style: Styles.textStyleRegular16,
                      ),
                      const SizedBox(height: 8),

                      const CustomTextFormField(
                        iconData: Icons.email_outlined,
                        textInputType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 36),

                      CustomButton(text: S.of(context).sendResetLink),

                      const SizedBox(height: 36),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).rememberPassword,
                            style: Styles.textStyleMedium16,
                          ),
                          Text(
                            S.of(context).login,
                            style: Styles.textStyleMedium16.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 36),
                    ],
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
