import 'package:flutter/material.dart';
// reasable service card 
class ServiceCardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const ServiceCardItem({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomServiceCard(icon: icon, title: title, text: text);
  }
}


class CustomServiceCard extends StatelessWidget {
  const CustomServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
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
