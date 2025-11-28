import 'package:flutter/material.dart';
import 'package:health_care/features/home/presentation/widgets/service_card.dart';
<<<<<<< Updated upstream
=======
import 'package:health_care/features/home/presentation/widgets/header_blue_box.dart';

>>>>>>> Stashed changes
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

          // horizental service cards
          ServiceCards(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}



