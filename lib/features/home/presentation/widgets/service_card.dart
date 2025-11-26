import 'package:flutter/material.dart';
import 'package:health_care/features/home/presentation/widgets/custom_servicee_card.dart';

class ServiceCards extends StatelessWidget {
  const ServiceCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          ServiceCardItem(
            icon: Icons.local_hospital,
            title: "General\nPractitioners",
            text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
          ),
          SizedBox(width: 14),
          ServiceCardItem(
            icon: Icons.pregnant_woman,
            title: "Pregnancy\nSupport",
            text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
          ),
          SizedBox(width: 14),
          ServiceCardItem(
            icon: Icons.restaurant,
            title: "Nutritional\nSupport",
            text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
          ),
          SizedBox(width: 14),
          ServiceCardItem(
            icon: Icons.medication,
            title: "Pharmaceutical\nCare",
            text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
          ),
        ],
      ),
    );
  }
}