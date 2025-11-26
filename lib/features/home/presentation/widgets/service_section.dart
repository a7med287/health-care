import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header blue box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            decoration: const BoxDecoration(
              color: Color(0xFF03C1E8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // left title
                Expanded(
                  child: Text(
                    "Our Best Services For\nYour Solution",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // right text
                Expanded(
                  child: Text(
                    "Vitae aliquam vestibulum elit adipiscing nascetur dictum. "
                    "Sit a diam id vitae blandit elementum donec.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 13,
                      height: 1.35,
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 18),

          // horizental service card
          SizedBox(
            height: 180, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                ServiceCard(
                  icon: Icons.local_hospital,
                  title: "General\nPractitioners",
                  text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
                ),
                SizedBox(width: 14),
                ServiceCard(
                  icon: Icons.pregnant_woman,
                  title: "Pregnancy\nSupport",
                  text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
                ),
                SizedBox(width: 14),
                ServiceCard(
                  icon: Icons.restaurant,
                  title: "Nutritional\nSupport",
                  text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
                ),
                SizedBox(width: 14),
                ServiceCard(
                  icon: Icons.medication,
                  title: "Pharmaceutical\nCare",
                  text: "Aliquam etiam felis suscipit id auctor mi imperdiet.",
                ),
              ],
            ),
          ),

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
