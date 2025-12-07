import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import '../verify_cubit/verify_cubit.dart';
import '../verify_cubit/verify_state.dart';

class ResendOtpSection extends StatefulWidget {
  final String email;

  const ResendOtpSection({super.key, required this.email});

  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  late VerifyCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<VerifyCubit>();
    // 🔥 يبدأ العدّاد مباشرة عند فتح الصفحة
    cubit.startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCubit, VerifyState>(
      builder: (context, state) {
        // أثناء العدّاد
        if (state is CountdownTick) {
          return Text(
            "Resend in ${state.seconds}s",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: "LibreBaskerville",
            ),
          );
        }

        // أثناء إرسال OTP
        if (state is ResendOtpLoading) {
          return const Text(
            "Sending...",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          );
        }

        // العدّاد خلص → فعل الزرار
        return InkWell(
          onTap: () {
            cubit.resendOtp(widget.email);
          },
          child: const Text(
            " Resend Code !",
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 16,
              fontFamily: "LibreBaskerville",
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
