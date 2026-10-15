import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../../utils/lesson_router.dart';

class LessonTypeSheet extends StatelessWidget {
  final LessonData lesson;

  const LessonTypeSheet({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    // Detect if reading progress is 100% complete
    final bool isFlashcardUnlocked = lesson.progress >= 1.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFFAF6EE),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Drag handle pill
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFCBD5E1),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Subtitle header
          const Text(
            'PUMILI NG PARAAN NG PAG-AARAL',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
              color: Color(0xFF475569),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),

          // Lesson Title
          Text(
            lesson.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Horizontal Option Cards
          Row(
            children: [
              // 1. Scroll Mode Card (Always Unlocked)
              Expanded(
                child: _ModeOptionCard(
                  title: 'Magbasa (Scroll)',
                  subtitle: 'Tuluy-tuloy na pagbabasa sa scroll-type na pahina',
                  backgroundColor: const Color(0xFFFCAE96),
                  textColor: const Color(0xFF1E293B),
                  imagePath: 'assets/images/lesson_book_icon.png',
                  defaultIcon: Icons.article_outlined,
                  isLocked: false,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonRouter.getScrollScreen(lesson),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 14),

              // 2. Flashcard Mode Card (Locked if progress < 100%)
              Expanded(
                child: _ModeOptionCard(
                  title: 'Mag-flashcard',
                  subtitle: isFlashcardUnlocked
                      ? 'Magrebyu at mag-aral gamit ang flashcards'
                      : 'Kailangan muna matapos ang 100% na pagbabasa',
                  backgroundColor: isFlashcardUnlocked
                      ? const Color(0xFFE5C8A0)
                      : const Color(0xFFE2E8F0), // Greyed out background when locked
                  textColor: isFlashcardUnlocked
                      ? const Color(0xFF1E293B)
                      : const Color(0xFF94A3B8), // Muted text when locked
                  imagePath: 'assets/images/lesson_flashcard_icon.png',
                  defaultIcon: Icons.style_rounded,
                  isLocked: !isFlashcardUnlocked,
                  onTap: () {
                    if (!isFlashcardUnlocked) {
                      // SnackBar feedback when tapped while locked
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Row(
                            children: [
                              Icon(Icons.lock_rounded,
                                  color: Colors.white, size: 20),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Tapusin muna ang 100% na pagbabasa para ma-unlock ang Flashcards!',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: const Color(0xFFC86D51),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            LessonRouter.getFlashcardScreen(lesson),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Kanselahin (Cancel) Button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Kanselahin',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ModeOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color textColor;
  final String? imagePath;
  final IconData defaultIcon;
  final bool isLocked;
  final VoidCallback onTap;

  const _ModeOptionCard({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.textColor,
    this.imagePath,
    required this.defaultIcon,
    required this.isLocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          height: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Right Lock Status Badge Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isLocked)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF475569),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                            size: 13,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Naka-lock',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    const SizedBox(height: 24),
                ],
              ),

              // Image Asset (Always shows image/fallback icon, but applies 40% opacity when locked)
              SizedBox(
                height: 80,
                child: Opacity(
                  opacity: isLocked ? 0.4 : 1.0,
                  child: (imagePath != null && imagePath!.isNotEmpty)
                      ? Image.asset(
                          imagePath!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            // Clean fallback if asset is not found
                            return Icon(
                              defaultIcon,
                              size: 64,
                              color: textColor,
                            );
                          },
                        )
                      : Icon(
                          defaultIcon,
                          size: 64,
                          color: textColor,
                        ),
                ),
              ),

              // Title and Subtitle Labels
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      height: 1.3,
                      color: isLocked
                          ? const Color(0xFF64748B)
                          : textColor.withValues(alpha: 0.85),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}