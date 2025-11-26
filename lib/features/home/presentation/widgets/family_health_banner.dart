import 'package:flutter/material.dart';
import 'package:health_care/core/utils/app_colors.dart';

class FamilyHealthBanner extends StatelessWidget {
  const FamilyHealthBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffE2E9EA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "We Care About\n your Health",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                
                SizedBox(height: 8,),
                Text(
                  "Vitae aliquam vestibulum elit adipiscing massa diam in dignissim.\n"
                  "Risus tellus libero elementum aliquam etiam.\n"
                  "Lectus adipiscing est auctor mi quisque nunc non viverra est.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 8
                    ,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.withOpacity(0.6),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/bannerpc.png',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
