import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wikapp_beta/screens/profile_screens/account_screen.dart';
import 'package:wikapp_beta/screens/profile_screens/bookmark_screen.dart';
import 'package:wikapp_beta/screens/profile_screens/history_screen.dart';
import 'package:wikapp_beta/screens/profile_screens/settings_screen.dart';
import 'package:wikapp_beta/utils/account_preferences_helper.dart';
import '../widgets/home_page_widget/dashboard_header.dart';
import '../database/lesson_data.dart';
import '../models/lesson_models.dart';
import '../helpers/quiz_database_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _completedQuizzesCount = 0;
  String _userName = 'Juan Dela Cruz';
  String _userGradeSection = 'Baitang 5 • Sampaguita';
  String _avatarPath = 'assets/vectors/profile_avatar.png';

  @override
  void initState() {
    super.initState();
    _loadActivityHistoryCount();
    _loadAccountData();

    // Listen live to quiz history and account setting changes
    QuizDatabaseHelper.historyChangeNotifier.addListener(_loadActivityHistoryCount);
    AccountPreferencesHelper.accountChangeNotifier.addListener(_loadAccountData);
  }

  @override
  void dispose() {
    QuizDatabaseHelper.historyChangeNotifier.removeListener(_loadActivityHistoryCount);
    AccountPreferencesHelper.accountChangeNotifier.removeListener(_loadAccountData);
    super.dispose();
  }

  Future<void> _loadActivityHistoryCount() async {
    final records = await QuizDatabaseHelper.instance.getAllHistoryRecords();
    if (mounted) {
      setState(() {
        _completedQuizzesCount = records.length;
      });
    }
  }

  Future<void> _loadAccountData() async {
    try {
      final details = await AccountPreferencesHelper.getAccountDetails();
      if (mounted) {
        setState(() {
          _userName = details['name'] ?? 'Juan Dela Cruz';
          _userGradeSection = details['gradeSection'] ?? 'Baitang 5 • Sampaguita';
          _avatarPath = details['avatarPath'] ?? 'assets/vectors/profile_avatar.png';
        });
      }
    } catch (_) {}
  }

  Widget _buildAvatarWidget(String path, {required double size}) {
    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.person_rounded, size: 50, color: Colors.white),
      );
    } else {
      return Image.file(
        File(path),
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.person_rounded, size: 50, color: Colors.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: ValueListenableBuilder<List<TermData>>(
          valueListenable: dummyTermsNotifier,
          builder: (context, terms, child) {
            int totalLessons = 0;
            int completedLessons = 0;
            double totalProgressSum = 0.0;

            for (var term in terms) {
              for (var lesson in term.lessons) {
                totalLessons++;
                totalProgressSum += lesson.progress;
                if (lesson.progress >= 1.0) {
                  completedLessons++;
                }
              }
            }

            final double overallProgress =
                totalLessons > 0 ? totalProgressSum / totalLessons : 0.0;
            final int progressPercentage = (overallProgress * 100).round();

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardHeader(showProfileAvatar: false),
                  const SizedBox(height: 20),

                  const Text(
                    'Aking Profile',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Avatar & Name Card
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AccountScreen(),
                              ),
                            );
                            _loadAccountData();
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF6B6291),
                                ),
                                child: CircleAvatar(
                                  radius: 44,
                                  backgroundColor: const Color(0xFFD6D0F2),
                                  child: ClipOval(
                                    child: _buildAvatarWidget(_avatarPath, size: 80),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.12),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.edit_rounded,
                                  size: 16,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _userName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _userGradeSection,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Progress Summary Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF79C6F),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Aking Progreso',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Kabuuang Progreso',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            Text(
                              '$progressPercentage%',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: overallProgress,
                            minHeight: 10,
                            backgroundColor: const Color(0xFFE28353),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFB8562B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Stats Cards Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          number: completedLessons.toString(),
                          label: 'Mga Natapos\nna Aralin',
                          bgColor: const Color(0xFFFDC79B),
                          assetPath: 'assets/images/bookcheck.png',
                          fallbackIcon: Icons.menu_book_rounded,
                          iconColor: const Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildStatCard(
                          number: _completedQuizzesCount.toString(),
                          label: 'Mga\nPagsasanay',
                          bgColor: const Color(0xFFB2E0DF),
                          assetPath: 'assets/images/checklist.png',
                          fallbackIcon: Icons.assignment_rounded,
                          iconColor: const Color(0xFF388E8E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Navigation Options
                  _buildMenuItem(
                    title: 'Mga Bookmark',
                    assetPath: 'assets/images/bookmark.png',
                    fallbackIcon: Icons.bookmark_rounded,
                    iconColor: const Color(0xFF5B67CA),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookmarkScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    title: 'Kasaysayan ng Aktibidad',
                    assetPath: 'assets/images/history.png',
                    fallbackIcon: Icons.calendar_month_rounded,
                    iconColor: const Color(0xFFE26D5C),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    title: 'Impormasyon ng Account',
                    assetPath: 'assets/images/idicon.png',
                    fallbackIcon: Icons.badge_rounded,
                    iconColor: const Color(0xFFC08A5E),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountScreen(),
                        ),
                      );
                      _loadAccountData();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    title: 'Mga Setting',
                    assetPath: 'assets/images/gearicon.png',
                    fallbackIcon: Icons.settings_rounded,
                    iconColor: const Color(0xFFD97757),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String number,
    required String label,
    required Color bgColor,
    required String assetPath,
    required IconData fallbackIcon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF334155),
                  height: 1.25,
                ),
              ),
            ],
          ),
          Image.asset(
            assetPath,
            width: 44,
            height: 44,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Icon(
              fallbackIcon,
              size: 40,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String assetPath,
    required IconData fallbackIcon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          onTap: onTap,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Image.asset(
            assetPath,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Icon(
              fallbackIcon,
              size: 28,
              color: iconColor,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFF94A3B8),
            size: 22,
          ),
        ),
      ),
    );
  }
}