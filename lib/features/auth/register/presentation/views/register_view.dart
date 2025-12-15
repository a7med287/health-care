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


class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(RegisterService(Dio())),
      child: Scaffold(
        //backgroundColor: AppColors.mainColor,
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

                  child: Form(
                    key: _formKey,
                    autovalidateMode: autovalidateMode,

                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        // logo && icon
                        const Icon(
                          Icons.medical_services,
                          size: 70,
                          color: AppColors.mainColor,
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LibreBaskerville',
                          ),
                        ),

                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: AlignmentGeometry.topRight,
                              end: AlignmentGeometry.bottomLeft,
                              colors: [
                                AppColors.darkMainColor,
                                AppColors.mainColor
                              ],
                            ),
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .1),
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
                                         if(_formKey.currentState!.validate()){
                                           _formKey.currentState!.save();

                                           final model = RegisterRequestModel(
                                             email: emailController.text,
                                             password: passwordController.text,
                                             fullName: nameController.text,
                                             phoneNumber: phoneController.text,
                                           );

                                           context.read<RegisterCubit>().register(
                                             model,
                                           );
                                         }else{
                                           setState(() {
                                             autovalidateMode =AutovalidateMode.always;
                                           });
                                         }
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
                                            fontSize: 19,
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
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(

        validator: (value) {
          if (value!.isEmpty) {
            return "This is Required";
          }
          return null;
        },
        controller: controller,
        obscureText: isPassword,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white
          ),
          prefixIcon: Icon(
            icon,
            color:  Colors.white ,
          ),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(color:AppColors.mainColor),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: color),
    );
  }
}
