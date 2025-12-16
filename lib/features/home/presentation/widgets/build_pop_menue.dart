import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

import 'logout_dialog.dart';


Widget buildPopupMenu(BuildContext context) {
  return PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert, color: Colors.black54),
    itemBuilder:
        (BuildContext context) => [
          const PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: AppColors.mainColor,
                ), // Added icon for visual appeal
                SizedBox(width: 8),
                Text('Logout', style: TextStyle(color: AppColors.mainColor)),
              ],
            ),
          ),
        ],
    onSelected: (String value) {
      if (value == 'logout') {
        showLogoutConfirmationDialog(context);
      }
    },
  );
}
