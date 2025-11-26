import 'package:flutter/material.dart';
import 'package:health_care/features/home/presentation/widgets/custom_text_field.dart';
import 'package:health_care/features/home/presentation/widgets/family_health_banner.dart';

import 'package:health_care/features/home/presentation/widgets/head_of_home_page.dart';
import 'package:health_care/features/home/presentation/widgets/recsent_post_section.dart';
import 'package:health_care/features/home/presentation/widgets/service_section.dart';
import 'package:health_care/features/home/presentation/widgets/stats_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadOfHomePage(),

                  const SizedBox(height: 16),

                  //  البحث
                  CustomTextField(),

                  const SizedBox(height: 20),

                  const FamilyHealthBanner(),

                  const SizedBox(height: 16),

                  const StatsRow(),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            ServicesSection(),

             SliverToBoxAdapter(child: const SizedBox(height: 20)),

            RecentPostsSliver(),

           
          ],
        ),
      ),
    );
  }
}
