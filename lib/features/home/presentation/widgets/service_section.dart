import 'package:flutter/material.dart';
import 'package:health_care/features/home/presentation/widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Blue Box (إذا هتستخدمه لاحقًا)
          // const CustomHeaderBlueBox(),

          const SizedBox(height: 18),

          // Horizontal service cards
          const ServiceCards(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
