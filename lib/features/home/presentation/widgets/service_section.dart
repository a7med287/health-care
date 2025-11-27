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

          // header blue box
          // CustomHeaderBlueBox(),

          const SizedBox(height: 18),

          // horizental service card
          ServiceCards(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// reasable service card 
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // عرض الكارت في ال scroll الأفقي
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 38, color: Color(0xFF03C1E8)),
          const SizedBox(height: 12),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.8,
              color: Colors.grey[600],
              height: 1.3,
            ),
          )
        ],
      ),
    );
  }
}
