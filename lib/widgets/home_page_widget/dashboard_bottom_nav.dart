import 'package:flutter/material.dart';

class DashboardBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const DashboardBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1E293B),
        unselectedItemColor: const Color(0xFF94A3B8),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0,
        items: [
          _buildNavItem(
            iconPath: 'assets/vectors/home.png',
            label: 'Home',
            isSelected: currentIndex == 0,
          ),
          _buildNavItem(
            iconPath: 'assets/vectors/open-book.png',
            label: 'Mga Aralin',
            isSelected: currentIndex == 1,
          ),
          _buildNavItem(
            iconPath: 'assets/vectors/activity.png',
            label: 'Mga Aktibidad',
            isSelected: currentIndex == 2,
          ),
          _buildNavItem(
            iconPath: 'assets/vectors/user.png',
            label: 'Profile',
            isSelected: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF94A3B8),
        colorBlendMode: BlendMode.srcIn,
        errorBuilder: (context, error, stackTrace) =>
            const SizedBox(width: 24, height: 24),
      ),
      label: label,
    );
  }
}