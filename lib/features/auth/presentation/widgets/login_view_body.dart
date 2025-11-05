import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/core/helpers/build_snak_bar.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/core/utils/app_images.dart';
import 'package:health_care/core/utils/styles.dart';
import 'package:health_care/core/widgets/custom_button.dart';
import 'package:health_care/core/widgets/custom_text_form_field.dart';
import 'package:health_care/core/widgets/password_text_filed.dart';
import 'package:health_care/features/auth/presentation/views/forgot_password_view.dart';
import 'package:health_care/features/auth/presentation/views/register_view.dart';
import 'package:health_care/features/home/presentation/views/home_view.dart';
import 'package:health_care/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SizedBox(
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
              bottom: MediaQuery.of(context).size.height * .25,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .48,

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
                            S.of(context).login,
                            style: Styles.textStyleBold24,
                          ),
                          const SizedBox(height: 16),

                          Text(
                            S.of(context).email,
                            style: Styles.textStyleRegular16,
                          ),
                          const SizedBox(height: 8),
                          const CustomTextFormField(
                            iconData: Icons.email_outlined,
                            textInputType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 16),

                          Text(
                            S.of(context).password,
                            style: Styles.textStyleRegular16,
                          ),
                          const SizedBox(height: 8),
                          const PasswordTextFormField(),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordView(),
                                ),
                              );
                            },
                            child: Text(
                              S.of(context).forgotPassword,
                              style: Styles.textStyleRegular16.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            text: S.of(context).login,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                buildSnackBar(context, "Login Successful");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeView(),
                                  ),
                                );
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).Youdonothaveanaccount,
                                style: Styles.textStyleMedium16,
                              ),
                              SizedBox(width: 4),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  S.of(context).registration,
                                  style: Styles.textStyleMedium16.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
