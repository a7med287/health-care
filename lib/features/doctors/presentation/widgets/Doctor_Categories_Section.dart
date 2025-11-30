import 'package:flutter/material.dart';

class DoctorCategoriesSection extends StatelessWidget {
  final String selectedSpecialty;
  final ValueChanged<String> onCategoryChanged;

  const DoctorCategoriesSection({
    super.key,
    required this.selectedSpecialty,
    required this.onCategoryChanged,
  });

  // قائمة التخصصات ثابتة هنا لأنها خاصة بالـ UI
  final List<Map<String, dynamic>> categories = const [
    {"name": "All", "icon": Icons.list},
    {"name": "Cardiologist", "icon": Icons.favorite},
    {"name": "Dermatologist", "icon": Icons.face},
    {"name": "Pediatrician", "icon": Icons.child_care},
    {"name": "Neurologist", "icon": Icons.psychology},
    {"name": "Dentist", "icon": Icons.medical_services},
    {"name": "Orthopedic Surgeon", "icon": Icons.accessible},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Specialties",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedSpecialty == category['name'];

              return GestureDetector(
                onTap: () => onCategoryChanged(category['name']),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey.shade300,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ]
                        : [],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        category['icon'],
                        color: isSelected ? Colors.white : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        category['name'],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}