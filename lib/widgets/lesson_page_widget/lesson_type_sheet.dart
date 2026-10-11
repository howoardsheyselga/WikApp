import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../../utils/lesson_router.dart';

class LessonTypeSheet extends StatelessWidget {
  final LessonData lesson;

  const LessonTypeSheet({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
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
              // Scroll Mode Card
              Expanded(
                child: _ModeOptionCard(
                  title: 'Magbasa (Scroll)',
                  subtitle: 'Tuluy-tuloy na pagbabasa sa scroll-type na pahina',
                  backgroundColor: const Color(0xFFFCAE96),
                  textColor: const Color(0xFF1E293B),
                  imagePath: 'assets/images/lesson_book_icon.png',
                  defaultIcon: Icons.article_outlined,
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

              // Flashcard Mode Card
              Expanded(
                child: _ModeOptionCard(
                  title: 'Mag-flashcard',
                  subtitle: 'Magrebyu at mag-aral gamit ang flashcards',
                  backgroundColor: const Color(0xFFE5C8A0),
                  textColor: const Color(0xFF1E293B),
                  imagePath: 'assets/images/lesson_flashcard_icon.png',
                  defaultIcon: Icons.style_rounded,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonRouter.getFlashcardScreen(lesson),
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
  final VoidCallback onTap;

  const _ModeOptionCard({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.textColor,
    this.imagePath,
    required this.defaultIcon,
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Large Image / Icon Display
              SizedBox(
                height: 90,
                child: (imagePath != null && imagePath!.isNotEmpty)
                    ? Image.asset(
                        imagePath!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            defaultIcon,
                            size: 72,
                            color: textColor,
                          );
                        },
                      )
                    : Icon(
                        defaultIcon,
                        size: 72,
                        color: textColor,
                      ),
              ),

              // Text Labels
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
                      color: textColor.withValues(alpha: 0.85),
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