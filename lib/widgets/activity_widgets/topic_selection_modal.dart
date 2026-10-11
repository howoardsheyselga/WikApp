import 'package:flutter/material.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1_identification_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1_matching_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1_multiplechoice_screen.dart';
import 'package:wikapp_beta/screens/activity_screens/paksa1_truefalse_screen.dart';

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

  /// =========================================================================
  /// CENTRAL QUIZ ROUTE REGISTRY
  /// Format Key: 'ACTIVITY_TYPE_TERMINDEX_TOPICINDEX'
  /// Term Index: 0 (1st Term), 1 (2nd Term), 2 (3rd Term)
  /// Topic Index: 0-indexed relative to each term list
  /// =========================================================================
  final Map<String, WidgetBuilder> _activityRoutes = {
    // ------------------- PAKSA 1 (1st Term - Term 0, Topic 0) -------------------
    'MULTIPLE CHOICE_0_0': (context) => const Paksa1MultipleChoiceScreen(),
    'PAGTUKOY_0_0': (context) => const Paksa1IdentificationScreen(),
    'IDENTIFICATION_0_0': (context) => const Paksa1IdentificationScreen(),
    'TAMA O MALI_0_0': (context) => const Paksa1TrueFalseScreen(),
    'PAGTATAMBAL_0_0': (context) => const Paksa1MatchingScreen(),

    // ------------------- FUTURE SCREENS PLACEHOLDER -------------------
    // Simply uncomment and add your imported screens as you build them!
    
    // 'TAMA O MALI_0_0': (context) => const Paksa1TrueFalseScreen(),
    // 'PAGTATAMBAL_0_0': (context) => const Paksa1MatchingScreen(),

    // 'MULTIPLE CHOICE_0_1': (context) => const Paksa2MultipleChoiceScreen(),
    // 'PAGTUKOY_0_1': (context) => const Paksa2IdentificationScreen(),
  };

  // Complete List of 8 Paksa grouped by Term
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
    final currentTopics = _termTopics[_selectedTermIndex] ?? [];

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
          // Header with Close Button
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

          // Title
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

          // Term Section Header
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

          // Term Selection Pills
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

          // Topic Section Header
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

          // Topics List Box
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
                              ? const Color(0xFFFFEBD8)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            // Topic Image Asset with Fallback Icon
                            Container(
                              width: 38,
                              height: 38,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDE8E1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                topic.imagePath,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    topic.fallbackIcon,
                                    color: const Color(0xFFC86D51),
                                    size: 20,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Topic Title Text
                            Expanded(
                              child: Text(
                                topic.title,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F172A),
                                  height: 1.25,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // Radio Check Indicator
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

          // Primary CTA Button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD97757),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // Close bottom sheet

                // Construct Route Lookup Key
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Magsimula ng Pagsasanay',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Cancel Button
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
  }

  Widget _buildTermPill({required String label, required int index}) {
    final bool isSelected = _selectedTermIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTermIndex = index;
            _selectedTopicIndex = 0; // Reset topic index on term switch
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