import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color badgeColor;
  final VoidCallback onTap;

  const LessonCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.badgeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 48,
                    height: 48,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(width: 48, height: 48),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonGrid extends StatelessWidget {
  const LessonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: LessonCard(
                title: 'Flashcards',
                imagePath: 'assets/images/flashcard.png',
                badgeColor: const Color(0xFF64748B),
                onTap: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LessonCard(
                title: 'Pagsusulit',
                imagePath: 'assets/images/quizes.png',
                badgeColor: const Color(0xFF64748B),
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: LessonCard(
                title: 'Mga Tala',
                imagePath: 'assets/images/handout.png',
                badgeColor: const Color(0xFF64748B),
                onTap: () {},
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }
}