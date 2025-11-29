import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'custom_text_field.dart';
import 'family_health_banner.dart';
import 'head_of_home_page.dart';
import 'recsent_post_section.dart';
import 'service_section.dart';
import 'stats_row.dart';
<<<<<<< HEAD
=======
import 'package:health_care/features/home/presentation/widgets/custom_text_field.dart';
import 'package:health_care/features/home/presentation/widgets/family_health_banner.dart';
import 'package:health_care/features/home/presentation/widgets/head_of_home_page.dart';
import 'package:health_care/features/home/presentation/widgets/recsent_post_section.dart';
import 'package:health_care/features/home/presentation/widgets/service_section.dart';
import 'package:health_care/features/home/presentation/widgets/stats_row.dart';
>>>>>>> Stashed changes
=======
import 'doctors_list_view.dart';
import 'section_header.dart';
>>>>>>> e6a947ea9234984d68edde4e2e8cf8ca9c766e0e

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const double _horizontalPadding = 16.0;
  static const double _sectionSpacing = 20.0;
  static const double _smallSpacing = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
<<<<<<< HEAD
      padding: const EdgeInsets.symmetric(horizontal: 10),
<<<<<<< Updated upstream
=======
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
>>>>>>> e6a947ea9234984d68edde4e2e8cf8ca9c766e0e
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
=======
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


           // sliver
            ServicesSection(),

            SliverToBoxAdapter(child: const SizedBox(height: 20)),

            // sliver
            RecentPostsSliver(),

           
          ],
        ),
>>>>>>> Stashed changes
      ),
    );
  }
}
