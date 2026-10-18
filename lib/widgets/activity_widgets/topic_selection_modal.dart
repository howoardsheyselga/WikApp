import 'package:flutter/material.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1/paksa1_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1/paksa1_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1/paksa1_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1/paksa1_truefalse_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa2/paksa2_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa2/paksa2_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa2/paksa2_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa2/paksa2_truefalse_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa3/paksa3_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa3/paksa3_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa3/paksa3_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa3/paksa3_truefalse_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa4/paksa4_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa4/paksa4_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa4/paksa4_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa4/paksa4_truefalse_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa5/paksa5_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa5/paksa5_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa5/paksa5_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa5/paksa5_truefalse_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa6/paksa6_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa6/paksa6_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa6/paksa6_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa6/paksa6_truefalse_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa7/paksa7_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa7/paksa7_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa7/paksa7_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa7/paksa7_truefalse_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa8/paksa8_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa8/paksa8_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa8/paksa8_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa8/paksa8_truefalse_screen.dart';

class PaksaItem {
  final String title;
  final String imagePath;
  final IconData fallbackIcon;

  const PaksaItem({
    required this.title,
    required this.imagePath,
    this.fallbackIcon = Icons.chat_bubble_outline_rounded,
  });
}

class TopicSelectionModal extends StatefulWidget {
  final String activityType;

  const TopicSelectionModal({super.key, required this.activityType});

  @override
  State<TopicSelectionModal> createState() => _TopicSelectionModalState();
}

class _TopicSelectionModalState extends State<TopicSelectionModal> {
  int _selectedTermIndex = 0; // 0: 1st Term, 1: 2nd Term, 2: 3rd Term
  int _selectedTopicIndex = 0; // 0: Paksa 1, 1: Paksa 2, etc.

  String _formatProgressPercentage(double progress) {
    final double pct = progress * 100;
    if (pct > 0 && pct < 1) {
      return '< 1%';
    }
    return '${pct.round()}%';
  }

  final Map<String, WidgetBuilder> _activityRoutes = {
    // ------------------- PAKSA 1 (1st Term - Term 0, Topic 0) -------------------
    'MULTIPLE CHOICE_0_0': (context) => const Paksa1MultipleChoiceScreen(),
    'PAGTUKOY_0_0': (context) => const Paksa1IdentificationScreen(),
    'IDENTIFICATION_0_0': (context) => const Paksa1IdentificationScreen(),
    'TAMA O MALI_0_0': (context) => const Paksa1TrueFalseScreen(),
    'PAGTATAMBAL_0_0': (context) => const Paksa1MatchingScreen(),
    'MATCHING TYPE_0_0': (context) => const Paksa1MatchingScreen(),

    // ------------------- PAKSA 2 (1st Term - Term 0, Topic 1) -------------------
    'MULTIPLE CHOICE_0_1': (context) => const Paksa2MultipleChoiceScreen(),
    'PAGTUKOY_0_1': (context) => const Paksa2IdentificationScreen(),
    'IDENTIFICATION_0_1': (context) => const Paksa2IdentificationScreen(),
    'TAMA O MALI_0_1': (context) => const Paksa2TrueFalseScreen(),
    'PAGTATAMBAL_0_1': (context) => const Paksa2MatchingScreen(),
    'MATCHING TYPE_0_1': (context) => const Paksa2MatchingScreen(),

    // ------------------- PAKSA 3 (1st Term - Term 0, Topic 2) -------------------
    'MULTIPLE CHOICE_0_2': (context) => const Paksa3MultipleChoiceScreen(),
    'PAGTUKOY_0_2': (context) => const Paksa3IdentificationScreen(),
    'IDENTIFICATION_0_2': (context) => const Paksa3IdentificationScreen(),
    'TAMA O MALI_0_2': (context) => const Paksa3TrueFalseScreen(),
    'PAGTATAMBAL_0_2': (context) => const Paksa3MatchingScreen(),
    'MATCHING TYPE_0_2': (context) => const Paksa3MatchingScreen(),

    // ------------------- PAKSA 4 (1st Term - Term 0, Topic 3) -------------------
    'MULTIPLE CHOICE_0_3': (context) => const Paksa4MultipleChoiceScreen(),
    'PAGTUKOY_0_3': (context) => const Paksa4IdentificationScreen(),
    'IDENTIFICATION_0_3': (context) => const Paksa4IdentificationScreen(),
    'TAMA O MALI_0_3': (context) => const Paksa4TrueFalseScreen(),
    'PAGTATAMBAL_0_3': (context) => const Paksa4MatchingScreen(),
    'MATCHING TYPE_0_3': (context) => const Paksa4MatchingScreen(),

    // ------------------- PAKSA 5 (2nd Term - Term 1, Topic 0) -------------------
    'MULTIPLE CHOICE_1_0': (context) => const Paksa5MultipleChoiceScreen(),
    'PAGTUKOY_1_0': (context) => const Paksa5IdentificationScreen(),
    'IDENTIFICATION_1_0': (context) => const Paksa5IdentificationScreen(),
    'TAMA O MALI_1_0': (context) => const Paksa5TrueFalseScreen(),
    'PAGTATAMBAL_1_0': (context) => const Paksa5MatchingScreen(),
    'MATCHING TYPE_1_0': (context) => const Paksa5MatchingScreen(),

    // ------------------- PAKSA 6 (2nd Term - Term 1, Topic 1) -------------------
    'MULTIPLE CHOICE_1_1': (context) => const Paksa6MultipleChoiceScreen(),
    'PAGTUKOY_1_1': (context) => const Paksa6IdentificationScreen(),
    'IDENTIFICATION_1_1': (context) => const Paksa6IdentificationScreen(),
    'TAMA O MALI_1_1': (context) => const Paksa6TrueFalseScreen(),
    'PAGTATAMBAL_1_1': (context) => const Paksa6MatchingScreen(),
    'MATCHING TYPE_1_1': (context) => const Paksa6MatchingScreen(),

    // ------------------- PAKSA 7 (3rd Term - Term 2, Topic 0) -------------------
    'MULTIPLE CHOICE_2_0': (context) => const Paksa7MultipleChoiceScreen(),
    'PAGTUKOY_2_0': (context) => const Paksa7IdentificationScreen(),
    'IDENTIFICATION_2_0': (context) => const Paksa7IdentificationScreen(),
    'TAMA O MALI_2_0': (context) => const Paksa7TrueFalseScreen(),
    'PAGTATAMBAL_2_0': (context) => const Paksa7MatchingScreen(),
    'MATCHING TYPE_2_0': (context) => const Paksa7MatchingScreen(),

    // ------------------- PAKSA 8 (3rd Term - Term 2, Topic 1) -------------------
    'MULTIPLE CHOICE_2_1': (context) => const Paksa8MultipleChoiceScreen(),
    'PAGTUKOY_2_1': (context) => const Paksa8IdentificationScreen(),
    'IDENTIFICATION_2_1': (context) => const Paksa8IdentificationScreen(),
    'TAMA O MALI_2_1': (context) => const Paksa8TrueFalseScreen(),
    'PAGTATAMBAL_2_1': (context) => const Paksa8MatchingScreen(),
    'MATCHING TYPE_2_1': (context) => const Paksa8MatchingScreen(),
  };

  final Map<int, List<PaksaItem>> _termTopics = const {
    0: [
      PaksaItem(
        title: 'PAKSA 1: INTRODUKSIYON SA MABISANG KOMUNIKASYON',
        imagePath: 'assets/images/paksa1_icon.png',
      ),
      PaksaItem(
        title: 'PAKSA 2: KRITIKAL NA KASANAYAN SA KOMUNIKASYON',
        imagePath: 'assets/images/paksa2_icon.png',
      ),
      PaksaItem(
        title: 'PAKSA 3: URI NG TEKSTO',
        imagePath: 'assets/images/paksa3_icon.png',
      ),
      PaksaItem(
        title: 'PAKSA 4: INGKLUSIBO AT ETIKAL NA DISKURSO',
        imagePath: 'assets/images/paksa4_icon.png',
      ),
    ],
    1: [
      PaksaItem(
        title: 'PAKSA 5: MGA URI NG AKADEMIKONG TEKSTO',
        imagePath: 'assets/images/paksa5_icon.png',
      ),
      PaksaItem(
        title: 'PAKSA 6: TEKNIKAL NA TEKSTO',
        imagePath: 'assets/images/paksa6_icon.png',
      ),
    ],
    2: [
      PaksaItem(
        title: 'PAKSA 7: PANGUNAHING TUNTUNIN SA PAKIKIPAGTALASTASAN',
        imagePath: 'assets/images/paksa7_icon.png',
      ),
      PaksaItem(
        title:
            'PAKSA 8: PANGUNAHING TUNTUNIN SA PAGSUSULAT NANG TEKSTONG PANTRABAHO',
        imagePath: 'assets/images/paksa8_icon.png',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TermData>>(
      valueListenable: dummyTermsNotifier,
      builder: (context, termsData, child) {
        final currentTopics = _termTopics[_selectedTermIndex] ?? [];

        TermData? currentTermData;
        if (_selectedTermIndex < termsData.length) {
          currentTermData = termsData[_selectedTermIndex];
        }

        bool isSelectedTopicLocked = false;
        if (currentTermData != null &&
            _selectedTopicIndex < currentTermData.lessons.length) {
          final lesson = currentTermData.lessons[_selectedTopicIndex];
          isSelectedTopicLocked = lesson.progress < 1.0;
        }

        return Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFDF8),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: const Color(0xFF2D2B2A), width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      'PARA SA: ${widget.activityType}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: Color(0xFFD97757),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF1E293B),
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              const Center(
                child: Text(
                  'Pumili ng Term at Paksa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'PUMILI NG TERM',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '1. Pumili ng Term',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF475569),
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  _buildTermPill(label: '1st Term', index: 0),
                  const SizedBox(width: 10),
                  _buildTermPill(label: '2nd Term', index: 1),
                  const SizedBox(width: 10),
                  _buildTermPill(label: '3rd Term', index: 2),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'PUMILI NG PAKSA',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '2. Pumili ng Paksa (Topic)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF475569),
                ),
              ),
              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF2D2B2A), width: 1.8),
                ),
                child: Column(
                  children: List.generate(currentTopics.length, (index) {
                    final topic = currentTopics[index];
                    final isSelected = _selectedTopicIndex == index;
                    final isLast = index == currentTopics.length - 1;

                    double progress = 0.0;
                    if (currentTermData != null &&
                        index < currentTermData.lessons.length) {
                      progress = currentTermData.lessons[index].progress;
                    }
                    final bool isLocked = progress < 1.0;

                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTopicIndex = index;
                            });
                          },
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? (isLocked
                                      ? const Color(0xFFF1F5F9)
                                      : const Color(0xFFFFEBD8))
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: isLocked
                                        ? const Color(0xFFE2E8F0)
                                        : const Color(0xFFFDE8E1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    topic.imagePath,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        topic.fallbackIcon,
                                        color: isLocked
                                            ? const Color(0xFF64748B)
                                            : const Color(0xFFC86D51),
                                        size: 20,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        topic.title,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: isLocked
                                              ? const Color(0xFF64748B)
                                              : const Color(0xFF0F172A),
                                          height: 1.25,
                                        ),
                                      ),
                                      if (isLocked) ...[
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.lock_outline_rounded,
                                              size: 12,
                                              color: Color(0xFF94A3B8),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Naka-lock • ${_formatProgressPercentage(progress)} Natapos',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF94A3B8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),

                                if (isLocked)
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE2E8F0),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xFF64748B)
                                            : const Color(0xFFCBD5E1),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.lock_rounded,
                                      size: 14,
                                      color: Color(0xFF64748B),
                                    ),
                                  )
                                else
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? const Color(0xFF1E293B)
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xFF1E293B)
                                            : const Color(0xFF64748B),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: isSelected
                                        ? const Icon(
                                            Icons.check_rounded,
                                            size: 14,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (!isLast)
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFE2E8F0),
                          ),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelectedTopicLocked
                        ? const Color(0xFFCBD5E1)
                        : const Color(0xFFD97757),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (isSelectedTopicLocked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Row(
                            children: [
                              Icon(Icons.lock_rounded,
                                  color: Colors.white, size: 18),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Kailangan munang matapos ang pagbabasa (100%) sa paksang ito bago magsimula ng pagsasanay!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: const Color(0xFF2D2B2A),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.pop(context);

                    final routeKey =
                        '${widget.activityType.toUpperCase()}_${_selectedTermIndex}_$_selectedTopicIndex';
                    final screenBuilder = _activityRoutes[routeKey];

                    if (screenBuilder != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: screenBuilder),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Inihahanda pa ang pagsasanay para sa paksang ito!',
                          ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isSelectedTopicLocked
                            ? Icons.lock_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isSelectedTopicLocked
                            ? 'Naka-lock ang Paksa'
                            : 'Magsimula ng Pagsasanay',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      if (!isSelectedTopicLocked) ...[
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Kanselahin',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTermPill({required String label, required int index}) {
    final bool isSelected = _selectedTermIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTermIndex = index;
            _selectedTopicIndex = 0;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFD97757)
                : const Color(0xFFFBEAD8),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFF2D2B2A),
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
        ),
      ),
    );
  }
}