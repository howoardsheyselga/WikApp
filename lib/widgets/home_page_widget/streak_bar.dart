import 'package:flutter/material.dart';
import 'package:wikapp_beta/utils/account_preferences_helper.dart';

class StreakBar extends StatefulWidget {
  const StreakBar({super.key});

  @override
  State<StreakBar> createState() => _StreakBarState();
}

class _StreakBarState extends State<StreakBar> {
  int _streakDays = 0;
  int _starsCount = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
    AccountPreferencesHelper.accountChangeNotifier.addListener(_loadStats);
  }

  @override
  void dispose() {
    AccountPreferencesHelper.accountChangeNotifier.removeListener(_loadStats);
    super.dispose();
  }

  Future<void> _loadStats() async {
    final stats = await AccountPreferencesHelper.getStreakAndStars();
    if (mounted) {
      setState(() {
        _streakDays = stats['streak'] ?? 0;
        _starsCount = stats['stars'] ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
            text: TextSpan(
              text: 'Streak: ',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '$_streakDays araw 🔥',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Color(0xFFCBD5E1),
              shape: BoxShape.circle,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Mga Bituin: ',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '$_starsCount ⭐',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}