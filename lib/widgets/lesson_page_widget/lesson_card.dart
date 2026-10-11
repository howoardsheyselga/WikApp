import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../lesson_page_widget/lesson_type_sheet.dart';

class LessonCard extends StatelessWidget {
  final LessonData lesson;

  const LessonCard({super.key, required this.lesson});

  void _openStudyTypeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LessonTypeSheet(lesson: lesson),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int percentage = (lesson.progress * 100).round();
    final bool isComplete = lesson.progress >= 1.0;

    final String displayStatus = isComplete
        ? 'Tapos na'
        : (lesson.progress > 0 ? lesson.status : 'Hindi pa nasisimulan');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => _openStudyTypeSheet(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                // Thumbnail / Badge Container with padding & BoxFit.contain
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(8), // Inner margin for cropped icons
                  decoration: BoxDecoration(
                    color: isComplete ? const Color(0xFF10B981) : lesson.badgeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      lesson.imagePath,
                      fit: BoxFit.contain, // Fits entire image without cropping
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.white,
                          size: 28,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Details + Progress Bar
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            displayStatus,
                            style: TextStyle(
                              fontSize: 13,
                              color: isComplete
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFF64748B),
                              fontWeight: isComplete
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                          Text(
                            '$percentage%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isComplete
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Progress Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: lesson.progress,
                          minHeight: 6,
                          backgroundColor: const Color(0xFFF1F5F9),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            isComplete
                                ? const Color(0xFF10B981)
                                : lesson.badgeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF94A3B8),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}