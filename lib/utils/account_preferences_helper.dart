import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPreferencesHelper {
  static const String _keyName = 'user_name';
  static const String _keyGradeSection = 'user_grade_section';
  static const String _keyAccountId = 'user_account_id';
  static const String _keyRegistrationDate = 'user_registration_date';
  static const String _keyAvatarPath = 'user_avatar_path';
  static const String _keyStars = 'user_stars';
  static const String _keyStreak = 'user_streak';
  static const String _keyLastActiveDate = 'user_last_active_date';

  /// Live Change Notifier to broadcast account & streak/star changes across the app
  static final ValueNotifier<int> accountChangeNotifier = ValueNotifier<int>(0);

  static String _formatFilipinoDate(DateTime date) {
    const months = [
      'Enero', 'Pebrero', 'Marso', 'Abril', 'Mayo', 'Hunyo',
      'Hulyo', 'Agosto', 'Setyembre', 'Oktubre', 'Nobyembre', 'Disyembre'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  static Future<Map<String, String>> getAccountDetails() async {
    final prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString(_keyName);
    String? gradeSection = prefs.getString(_keyGradeSection);
    String? accountId = prefs.getString(_keyAccountId);
    String? regDate = prefs.getString(_keyRegistrationDate);
    String? avatarPath = prefs.getString(_keyAvatarPath);

    if (accountId == null) {
      final randomDigits = Random().nextInt(9000) + 1000;
      accountId = 'WIK-${DateTime.now().year}-$randomDigits';
      await prefs.setString(_keyAccountId, accountId);
    }

    if (regDate == null) {
      regDate = _formatFilipinoDate(DateTime.now());
      await prefs.setString(_keyRegistrationDate, regDate);
    }

    if (avatarPath == null || avatarPath.isEmpty) {
      avatarPath = 'assets/vectors/profile_avatar.png';
      await prefs.setString(_keyAvatarPath, avatarPath);
    }

    if (name == null) {
      name = 'Juan Dela Cruz';
      await prefs.setString(_keyName, name);
    }

    if (gradeSection == null) {
      gradeSection = 'Baitang 5 • Sampaguita';
      await prefs.setString(_keyGradeSection, gradeSection);
    }

    return {
      'name': name,
      'gradeSection': gradeSection,
      'accountId': accountId,
      'regDate': regDate,
      'avatarPath': avatarPath,
      'status': 'Offline / Lokal na Account',
    };
  }

  static Future<void> saveAccountDetails({
    required String name,
    required String gradeSection,
    required String avatarPath,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name.trim());
    await prefs.setString(_keyGradeSection, gradeSection.trim());
    await prefs.setString(_keyAvatarPath, avatarPath);

    accountChangeNotifier.value++;
  }

  /// Fetch total stars and streak count
  static Future<Map<String, int>> getStreakAndStars() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'stars': prefs.getInt(_keyStars) ?? 0,
      'streak': prefs.getInt(_keyStreak) ?? 0,
    };
  }

  /// Records quiz completion: adds +15 stars if passing and calculates daily streak
  static Future<Map<String, int>> recordQuizActivity({required bool isPassing}) async {
    final prefs = await SharedPreferences.getInstance();

    int currentStars = prefs.getInt(_keyStars) ?? 0;
    int currentStreak = prefs.getInt(_keyStreak) ?? 0;
    String? lastActiveStr = prefs.getString(_keyLastActiveDate);

    final now = DateTime.now();
    final todayStr = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    // 1. Add +15 stars if passing
    if (isPassing) {
      currentStars += 15;
      await prefs.setInt(_keyStars, currentStars);
    }

    // 2. Daily Streak Calculation Logic
    if (lastActiveStr == null) {
      currentStreak = 1;
      await prefs.setString(_keyLastActiveDate, todayStr);
      await prefs.setInt(_keyStreak, currentStreak);
    } else {
      final lastActiveDate = DateTime.parse(lastActiveStr);
      final todayDate = DateTime(now.year, now.month, now.day);
      final lastActiveDayOnly = DateTime(lastActiveDate.year, lastActiveDate.month, lastActiveDate.day);

      final difference = todayDate.difference(lastActiveDayOnly).inDays;

      if (difference == 0) {
        // Already completed an activity today — streak remains unchanged
      } else if (difference == 1) {
        // Consecutive day — increment streak
        currentStreak++;
        await prefs.setString(_keyLastActiveDate, todayStr);
        await prefs.setInt(_keyStreak, currentStreak);
      } else if (difference > 1) {
        // Missed a day — reset streak to 1
        currentStreak = 1;
        await prefs.setString(_keyLastActiveDate, todayStr);
        await prefs.setInt(_keyStreak, currentStreak);
      }
    }

    // Broadcast change live to UI widgets
    accountChangeNotifier.value++;

    return {'stars': currentStars, 'streak': currentStreak};
  }
}