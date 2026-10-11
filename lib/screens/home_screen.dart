import 'package:flutter/material.dart';
import 'package:wikapp_beta/widgets/home_page_widget/home_banner_carousel.dart';
import '../widgets/home_page_widget/dashboard_header.dart';
import '../widgets/home_page_widget/progress_card.dart';
import '../widgets/home_page_widget/lesson_grid.dart';
import '../widgets/home_page_widget/streak_bar.dart';

class DashboardHomeView extends StatelessWidget {
  const DashboardHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DashboardHeader(),
          SizedBox(height: 20),
          Text(
            'Magandang araw!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: 16),
          
          // Promotional Banner Carousel
          BannerCarousel(),
          
          SizedBox(height: 20),
          ProgressCard(),
          SizedBox(height: 24),
          Text(
            'Mga Aralin ngayon',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: 16),
          LessonGrid(),
          SizedBox(height: 20),
          StreakBar(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}