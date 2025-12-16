import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/auth/login/presentaion/views/login_view.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/shared_prefrences_singletone.dart';

void showLogoutConfirmationDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            title: const Text(
              'Confirm logout',
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Are you sure you want to log out?',
              style: TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Prefs.setBool(isLoggedInKey, false);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView(),));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
