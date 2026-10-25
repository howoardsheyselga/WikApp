import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/helpers/quiz_database_helper.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/utils/account_preferences_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _appVersion = '1.0.0';
  String _buildNumber = '1';
  bool _isLoading = true;
  bool _isClearingData = false;

  @override
  void initState() {
    super.initState();
    _fetchAppVersion();
  }

  Future<void> _fetchAppVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      if (mounted) {
        setState(() {
          _appVersion = packageInfo.version;
          _buildNumber = packageInfo.buildNumber;
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _clearAllAppData() async {
    Navigator.pop(context); // Close confirmation dialog

    setState(() {
      _isClearingData = true;
    });

    try {
      // 1. Clear SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // 2. Delete SQLite database files using aliased 'p.join'
      final dbPath = await getDatabasesPath();
      
      final progressDbPath = p.join(dbPath, 'wikapp_progress.db');
      final quizDbPath = p.join(dbPath, 'wikapp_quiz_history.db');

      await deleteDatabase(progressDbPath);
      await deleteDatabase(quizDbPath);

      // 3. Reset cached database singletons in memory
      LessonDatabase.resetDatabase();
      QuizDatabaseHelper.resetDatabase();

      // 4. Force reset in-memory lesson progress and bookmarks using copyWith
      final resetTerms = dummyTermsNotifier.value.map((term) {
        final resetLessons = term.lessons.map((lesson) {
          return lesson.copyWith(
            progress: 0.0,
            status: 'Tapusin ang pagbabasa',
            isBookmarked: false,
          );
        }).toList();
        return TermData(
          id: term.id,
          title: term.title,
          lessons: resetLessons,
        );
      }).toList();
      
      dummyTermsNotifier.value = resetTerms;

      // 5. Trigger all global change notifiers so UI updates instantly
      AccountPreferencesHelper.accountChangeNotifier.value++;
      QuizDatabaseHelper.historyChangeNotifier.value++;

      // Artificial short delay for visual transition feedback
      await Future.delayed(const Duration(milliseconds: 900));

      if (mounted) {
        // 6. Redirect to onboarding screen and clear all previous routes
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/onboarding',
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isClearingData = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nagkaroon ng problema sa pag-clear ng data.'),
            backgroundColor: Color(0xFFEF4444),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showClearDataConfirmationDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFFFFFDF8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text(
          'I-clear ang Lahat ng Data?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        content: const Text(
          'Mawawala ang iyong progreso sa mga aralin, kasaysayan ng pagsasanay, bookmark, at mga detalye ng account. Ibabalik ka nito sa simula.',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF64748B),
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Kanselahin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: _clearAllAppData,
            child: const Text(
              'I-clear',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: _isClearingData
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Color(0xFFC86D51)),
                    SizedBox(height: 16),
                    Text(
                      'Binubura ang lokal na data at inihahanda ang app...',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF0F172A),
                        size: 26,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Mga Setting',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Pamahalaan ang mga detalye at data ng app',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSettingCard(
                      title: 'Bersyon ng App',
                      subtitle: _isLoading
                          ? 'Nag-a-update...'
                          : 'v$_appVersion (Build $_buildNumber)',
                      assetPath: 'assets/images/gearicon.png',
                      fallbackIcon: Icons.info_outline_rounded,
                      bgColor: const Color(0xFFD8EBE4),
                      iconColor: const Color(0xFF388E8E),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: _showClearDataConfirmationDialog,
                      child: _buildSettingCard(
                        title: 'I-clear ang Lokal na Data',
                        subtitle:
                            'Burahin ang progreso, bookmark, at kasaysayan',
                        assetPath: 'assets/images/history.png',
                        fallbackIcon: Icons.delete_sweep_rounded,
                        bgColor: const Color(0xFFFEE2E2),
                        iconColor: const Color(0xFFEF4444),
                        trailing: const Icon(
                          Icons.chevron_right_rounded,
                          color: Color(0xFF94A3B8),
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String subtitle,
    required String assetPath,
    required IconData fallbackIcon,
    required Color bgColor,
    required Color iconColor,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                fallbackIcon,
                size: 26,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}