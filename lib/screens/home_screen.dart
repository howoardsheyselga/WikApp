import 'package:flutter/material.dart';
import 'package:wikapp_beta/widgets/home_page_widget/home_banner_carousel.dart';
import '../widgets/home_page_widget/dashboard_header.dart';
import '../widgets/home_page_widget/progress_card.dart';
import '../widgets/home_page_widget/lesson_grid.dart';
import '../widgets/home_page_widget/streak_bar.dart';

class DashboardHomeView extends StatelessWidget {
  final ValueChanged<int>? onSelectTab;

  const DashboardHomeView({super.key, this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardHeader(
            onProfileTap: () => onSelectTab?.call(3),
          ),
          const SizedBox(height: 20),
          const Text(
            'Magandang araw!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          
          // Promotional Banner Carousel
          const BannerCarousel(),
          
          const SizedBox(height: 20),
          const ProgressCard(),
          const SizedBox(height: 24),
          const Text(
            'Mga Aralin ngayon',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          const LessonGrid(),
          const SizedBox(height: 20),
          const StreakBar(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}