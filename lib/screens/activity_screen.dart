import 'package:flutter/material.dart';
import '../widgets/activity_widgets/activity_card.dart';
import '../widgets/activity_widgets/topic_selection_modal.dart';
import '../widgets/home_page_widget/dashboard_header.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  void _showTopicSelectionModal(BuildContext context, String activityType) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return TopicSelectionModal(activityType: activityType);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE), // <-- Fixes the dark screen issue
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),
              const SizedBox(height: 24),

              // Title & Subtitle
              const Text(
                'Mga Aktibidad',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Subukan ang iyong kaalaman!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF475569),
                ),
              ),
              const SizedBox(height: 28),

              // Sub-header
              const Text(
                'PUMILI NG PAGSASANAY',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 16),

              // 2x2 Activity Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.78,
                children: [
                  // 1. Pagtukoy
                  ActivityCard(
                    title: 'Pagtukoy',
                    subtitle: 'Identification',
                    description: 'Isulat ang tamang\nsagot sa patlang.',
                    backgroundColor: const Color(0xFFDE7B59),
                    textColor: Colors.white,
                    imagePath: 'assets/images/identification_icon.png',
                    fallbackIcon: Icons.edit_note_rounded,
                    onTap: () => _showTopicSelectionModal(context, 'PAGTUKOY'),
                  ),

                  // 2. Multiple Choice
                  ActivityCard(
                    title: 'Multiple Choice',
                    subtitle: 'Pagpipilian',
                    description: 'Piliin ang\npinakatamang\nsagot.',
                    backgroundColor: const Color(0xFF1E2B37),
                    textColor: Colors.white,
                    imagePath: 'assets/images/multiplechoice.png',
                    fallbackIcon: Icons.check_circle_outline_rounded,
                    onTap: () =>
                        _showTopicSelectionModal(context, 'MULTIPLE CHOICE'),
                  ),

                  // 3. Tama o Mali
                  ActivityCard(
                    title: 'Tama o Mali',
                    subtitle: 'True or False',
                    description: 'Tukuyin kung tama\no mali ang pahayag.',
                    backgroundColor: const Color(0xFF98D9B6),
                    textColor: const Color(0xFF0F172A),
                    imagePath: 'assets/images/truefalse_icon.png',
                    fallbackIcon: Icons.thumbs_up_down_outlined,
                    onTap: () => _showTopicSelectionModal(context, 'TAMA O MALI'),
                  ),

                  // 4. Pagtatambal
                  ActivityCard(
                    title: 'Pagtatambal',
                    subtitle: 'Matching Type',
                    description: 'Ikonekta ang\nmagkakaugnay na\nsagot.',
                    backgroundColor: const Color(0xFF9A91E8),
                    textColor: const Color(0xFF0F172A),
                    imagePath: 'assets/images/matching.png',
                    fallbackIcon: Icons.extension_outlined,
                    onTap: () => _showTopicSelectionModal(context, 'PAGTATAMBAL'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}