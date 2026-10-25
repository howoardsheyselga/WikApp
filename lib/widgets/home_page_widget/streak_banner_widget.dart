import 'package:flutter/material.dart';
import 'package:wikapp_beta/utils/account_preferences_helper.dart';

class StreakBannerWidget extends StatefulWidget {
  const StreakBannerWidget({super.key});

  @override
  State<StreakBannerWidget> createState() => _StreakBannerWidgetState();
}

class _StreakBannerWidgetState extends State<StreakBannerWidget> {
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF7ED), Color(0xFFFFEDD5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF97316).withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEA580C).withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Streak section
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFED7AA),
                  shape: BoxShape.circle,
                ),
                child: const Text('🔥', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DAILY STREAK',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFC2410C),
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$_streakDays Araw',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF7C2D12),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 1,
            height: 32,
            color: const Color(0xFFFDBA74).withValues(alpha: 0.6),
          ),
          // Stars section
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF08A),
                  shape: BoxShape.circle,
                ),
                child: const Text('⭐', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MGA BITUIN',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFCA8A04),
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$_starsCount',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF713F12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}