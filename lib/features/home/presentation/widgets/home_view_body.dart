import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'family_health_banner.dart';
import 'head_of_home_page.dart';
import 'recsent_post_section.dart';
import 'service_section.dart';
import 'stats_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadOfHomePage(),
                const SizedBox(height: 16),
                const CustomTextField(),
                const SizedBox(height: 20),
                const FamilyHealthBanner(),
                const SizedBox(height: 16),
                const StatsRow(),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const ServicesSection(),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const RecentPostsSliver(),
        ],
      ),
    );
  }
}
