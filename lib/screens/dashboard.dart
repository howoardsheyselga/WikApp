import 'package:flutter/material.dart';
import '../widgets/home_page_widget/dashboard_bottom_nav.dart';
import 'home_screen.dart';
import 'lesson_screen.dart';
import 'activity_screen.dart';
import 'profile_screen.dart';

class ActivityDashboardScreen extends StatefulWidget {
  final int initialIndex;

  const ActivityDashboardScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<ActivityDashboardScreen> createState() =>
      _ActivityDashboardScreenState();
}

class _ActivityDashboardScreenState extends State<ActivityDashboardScreen> {
  late int _currentBottomNavIndex;

  @override
  void initState() {
    super.initState();
    _currentBottomNavIndex = widget.initialIndex;
  }

  void _navigateToTab(int index) {
    setState(() {
      _currentBottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardHomeView(onSelectTab: _navigateToTab),
      LessonsScreen(onSelectTab: _navigateToTab),
      ActivityScreen(onSelectTab: _navigateToTab),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: IndexedStack(
          index: _currentBottomNavIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: DashboardBottomNavBar(
        currentIndex: _currentBottomNavIndex,
        onTap: _navigateToTab,
      ),
    );
  }
}