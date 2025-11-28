import 'package:flutter/material.dart';

class CustomHeaderBlueBox extends StatelessWidget {
  const CustomHeaderBlueBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}