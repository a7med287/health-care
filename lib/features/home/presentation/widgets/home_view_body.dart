import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'family_health_banner.dart';
import 'head_of_home_page.dart';
import 'recsent_post_section.dart';
import 'service_section.dart';
import 'stats_row.dart';
import 'doctors_list_view.dart';
import 'section_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const double _horizontalPadding = 16.0;
  static const double _sectionSpacing = 20.0;
  static const double _smallSpacing = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadOfHomePage(),
                const SizedBox(height: _sectionSpacing),
                const CustomTextField(),
                const SizedBox(height: _sectionSpacing),
                const FamilyHealthBanner(),
                const SizedBox(height: _sectionSpacing),
                const StatsRow(),
                const SizedBox(height: _sectionSpacing),
                const SectionHeader(
                  title: 'Top Doctors',
                  showSeeAll: true,
                ),
                const SizedBox(height: _smallSpacing),
                const DoctorsListView(),
                const SizedBox(height: _sectionSpacing),
              ],
            ),
          ),
          const ServicesSection(),
          const SliverToBoxAdapter(
            child: SizedBox(height: _sectionSpacing),
          ),
          const RecentPostsSliver(),
          const SliverToBoxAdapter(
            child: SizedBox(height: _sectionSpacing),
          ),
        ],
      ),
    );
  }
}
