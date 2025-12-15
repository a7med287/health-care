import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/auth/forget_password/cubit/forget_password_cubit.dart';
import 'package:health_care/features/auth/forget_password/data/services/forget_password_service.dart';
import 'package:health_care/features/splash/presentation/views/splash_view.dart';
import 'core/services/shared_prefrences_singletone.dart';
import 'features/doctors/data/services/appointments_service.dart';
import 'generated/l10n.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const HealthCare());

}

class HealthCare extends StatelessWidget {
  const HealthCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ForgetPasswordCubit(
            ForgetPasswordService(Dio()),
          ),
        ),


        RepositoryProvider<AppointmentsService>(
          create: (_) => AppointmentsService(
            Dio(
              BaseOptions(
                baseUrl: 'https://d3.deltauniv.edu.eg/api',
                connectTimeout: const Duration(seconds: 20),
                receiveTimeout: const Duration(seconds: 20),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        supportedLocales: S.delegate.supportedLocales,

        // تغيير اللغة
        locale: const Locale("en"),

        theme: ThemeData(
          fontFamily: "Tajawal",
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.primaryColor,
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),

        home: const SplashView(),
      ),
    );
  }
}
