import 'package:flutter/material.dart';
import '../../database/lesson_data.dart';
import '../../database/lesson_database.dart';
import '../../models/lesson_models.dart';
import '../lesson_page_widget/lesson_type_sheet.dart';

class BookmarkCardWidget extends StatelessWidget {
  final LessonData lesson;
  final String termTitle;

  const BookmarkCardWidget({
    super.key,
    required this.lesson,
    required this.termTitle,
  });

  void _openStudyTypeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LessonTypeSheet(lesson: lesson),
    );
  }

  /// Toggle bookmark status in SQLite & update global ValueNotifier
  Future<void> _toggleBookmark(BuildContext context) async {
    final newStatus = await LessonDatabase.instance.toggleBookmark(lesson.id);
    await loadLessonsFromDatabase(); // Triggers live UI rebuild across all screens

    if (context.mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newStatus
                ? 'Naidagdag sa mga Naka-bookmark!'
                : 'Inalis sa mga Naka-bookmark.',
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final int percentage = (lesson.progress * 100).round();
    final bool isComplete = lesson.progress >= 1.0;

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
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => _openStudyTypeSheet(context),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lesson Badge Icon Container
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isComplete
                        ? const Color(0xFF10B981)
                        : lesson.badgeColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      lesson.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.menu_book_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Title, Subtitle Tag & Progress Bar
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Row: Title + Custom Bookmark Ribbon Asset (With Icon Fallback)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              lesson.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                                height: 1.25,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () => _toggleBookmark(context),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Image.asset(
                                'assets/images/bookmark.png',
                                width: 22,
                                height: 26,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                  Icons.bookmark_rounded,
                                  color: Color(0xFF5B67CA), // Blue Bookmark Ribbon
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // Subtitle & Progress Percentage
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Araling Panlipunan • $termTitle',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF64748B),
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

                      // Linear Progress Bar
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}