import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

class ClinicSpecialityDropdown extends StatefulWidget {
  const ClinicSpecialityDropdown({super.key});

  @override
  State<ClinicSpecialityDropdown> createState() =>
      _ClinicSpecialityDropdownState();
}

class _ClinicSpecialityDropdownState extends State<ClinicSpecialityDropdown>
    with SingleTickerProviderStateMixin {
  String? selectedSpeciality;

  late AnimationController arrowController;

  final List<Map<String, dynamic>> specialities = [
    {"name": "جراحة المخ والأعصاب", "icon": Icons.psychology},
    {"name": "جراحة العظام", "icon": Icons.accessibility_new},
    {"name": "الباطنة", "icon": Icons.monitor_heart},
    {"name": "الجلدية والتناسلية", "icon": Icons.face_retouching_natural},
    {"name": "الأطفال", "icon": Icons.child_care},
    {"name": "القلب", "icon": Icons.favorite},
    {"name": "الأسنان", "icon": Icons.medical_services},
  ];

  @override
  void initState() {
    super.initState();
    arrowController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لأن التخصصات بالعربي
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.mainColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedSpeciality,
            hint: const Text(
              "اختر التخصص",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            isExpanded: true,

            icon: RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(arrowController),
              child: const Icon(Icons.keyboard_arrow_down,
                  size: 22, color: AppColors.mainColor),
            ),

            // عندما يفتح المنيو
            onTap: () {
              arrowController.forward();
            },

            items: specialities.map((item) {
              return DropdownMenuItem<String>(
                value: item["name"],
                child: Row(
                  children: [
                    Icon(item["icon"], size: 20, color: AppColors.mainColor),
                    const SizedBox(width: 10),
                    Text(
                      item["name"],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            onChanged: (value) {
              setState(() {
                selectedSpeciality = value;
              });
              arrowController.reverse();
            },
          ),
        ),
      ),
    );
  }
}
