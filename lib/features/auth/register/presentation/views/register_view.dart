import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/auth/register/cubit/register_cubit.dart';
import 'package:health_care/features/auth/register/cubit/register_state.dart';
import 'package:health_care/features/auth/register/data/model/register_request_model.dart';
import 'package:health_care/features/auth/register/data/services/register_service.dart';
import 'package:health_care/features/home/presentation/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(RegisterService(Dio())),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SafeArea(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) async {
              if (state is RegisterSuccess) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('user_name', nameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("✅ تم إنشاء الحساب بنجاح"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              }

              if (state is RegisterFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            },

            builder: (context, state) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // logo && icon
                      const Icon(
                        Icons.medical_services,
                        size: 70,
                        color: Colors.white,
                      ),

                      const SizedBox(height: 10),

                      // title
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _customField(
                              controller: nameController,
                              hint: "Full Name",
                              icon: Icons.person,
                            ),

                            _customField(
                              controller: emailController,
                              hint: "Email",
                              icon: Icons.email,
                            ),

                            _customField(
                              controller: phoneController,
                              hint: "Phone",
                              icon: Icons.phone,
                            ),

                            _customField(
                              controller: passwordController,
                              hint: "Password",
                              icon: Icons.lock,
                              isPassword: true,
                            ),

                            const SizedBox(height: 20),

                            // loading
                            state is RegisterLoading
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    width: double.infinity,
                                    height: 52,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        final model = RegisterRequestModel(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          fullName: nameController.text,
                                          phoneNumber: phoneController.text,
                                        );

                                        context.read<RegisterCubit>().register(
                                          model,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.mainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),

                            const SizedBox(height: 15),

                            // login text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account? "),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  //  custom field
  Widget _customField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.mainColor, width: .8),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.mainColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
