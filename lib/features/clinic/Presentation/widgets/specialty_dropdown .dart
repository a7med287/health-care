import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/clinic/Data/clinic_cubit/clinic_cubit.dart';

class SpecialtyDropdown extends StatefulWidget {
  const SpecialtyDropdown({super.key});

  @override
  State<SpecialtyDropdown> createState() => _SpecialtyDropdownState();
}

class _SpecialtyDropdownState extends State<SpecialtyDropdown>
    with SingleTickerProviderStateMixin {
  String? selected;
  bool isOpen = false;

  late AnimationController arrowController;

  final List<String> specialties = [
    "جراحة التجميل والحروق",
    "جراحة المخ والأعصاب",
    "جراحة العظام",
    "أمراض القلب والأوعية الدموية",
    "الجلدية والتناسلية",
    "طب الأطفال وحديثي الولادة",
    "الأسنان",
    "المسالك البولية",
    "النساء والتوليد",
    "الأنف والأذن والحنجرة",
    "طب وجراحة العيون",
    "الباطنة العامة",
  ];

  @override
  void initState() {
    super.initState();
    arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  void toggleDropdown() {
    setState(() => isOpen = !isOpen);
    isOpen ? arrowController.forward() : arrowController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          // ✅ الـ Header
          GestureDetector(
            onTap: toggleDropdown,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.mainColor, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.medical_services,
                      color: AppColors.mainColor, size: 22),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      selected ?? "اختر التخصص",
                      style: TextStyle(
                        fontSize: 14,
                        color: selected == null
                            ? Colors.grey
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5)
                        .animate(arrowController),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: AppColors.mainColor, size: 26),
                  ),
                ],
              ),
            ),
          ),

          // ✅ القائمة المنسدلة مع Animation
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: isOpen ? 260 : 0,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 6),
                itemCount: specialties.length,
                itemBuilder: (context, index) {
                  final item = specialties[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selected = item;
                        isOpen = false;
                      });

                      arrowController.reverse();

                      context
                          .read<ClinicCubit>()
                          .filterBySpecialty(item);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.circle,
                              size: 8, color: AppColors.mainColor),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
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
        ],
      ),
    );
  }
}
