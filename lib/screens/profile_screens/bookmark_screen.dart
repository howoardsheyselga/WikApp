import 'package:flutter/material.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/widgets/profile_widgets/bookmark_card_widget.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    loadLessonsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: ValueListenableBuilder<List<TermData>>(
          valueListenable: dummyTermsNotifier,
          builder: (context, terms, child) {
            // Filter all bookmarked lessons across all terms
            final List<Map<String, dynamic>> bookmarkedItems = [];

            for (var term in terms) {
              for (var lesson in term.lessons) {
                if (lesson.isBookmarked) {
                  bookmarkedItems.add({
                    'lesson': lesson,
                    'termTitle': term.title,
                  });
                }
              }
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF0F172A),
                      size: 26,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 16),

                  // Header Title & Subtitle
                  const Text(
                    'Mga Bookmark',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Mga naka-save na aralin at paksa',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Bookmarked List or Empty State
                  bookmarkedItems.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 80),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.bookmark_outline_rounded,
                                  size: 64,
                                  color: Color(0xFF94A3B8),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Wala pang naka-bookmark na aralin.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'I-tap ang bookmark icon sa paksa para i-save ito rito.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: bookmarkedItems.length,
                          itemBuilder: (context, index) {
                            final item = bookmarkedItems[index];
                            final LessonData lesson = item['lesson'];
                            final String termTitle = item['termTitle'];

                            return Dismissible(
                              key: ValueKey('bookmark_${lesson.id}'),
                              direction: DismissDirection.endToStart, // Swipe left to remove
                              background: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEF4444), // Red removal banner
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                alignment: Alignment.centerRight,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Alisin',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.delete_outline_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (direction) async {
                                // 1. Remove bookmark in SQLite
                                await LessonDatabase.instance
                                    .toggleBookmark(lesson.id);
                                // 2. Refresh global ValueNotifier state
                                await loadLessonsFromDatabase();

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Inalis ang "${lesson.title}" sa mga bookmark.',
                                      ),
                                      duration: const Duration(seconds: 3),
                                      behavior: SnackBarBehavior.floating,
                                      action: SnackBarAction(
                                        label: 'I-undo',
                                        textColor: const Color(0xFFF79C6F),
                                        onPressed: () async {
                                          // Re-add bookmark
                                          await LessonDatabase.instance
                                              .toggleBookmark(lesson.id);
                                          await loadLessonsFromDatabase();
                                        },
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: BookmarkCardWidget(
                                lesson: lesson,
                                termTitle: termTitle,
                              ),
                            );
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}