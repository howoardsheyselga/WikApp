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

  final List<Widget> _screens = const [
    DashboardHomeView(),
    LessonsScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: IndexedStack(
          index: _currentBottomNavIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: DashboardBottomNavBar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });
        },
      ),
    );
  }
}