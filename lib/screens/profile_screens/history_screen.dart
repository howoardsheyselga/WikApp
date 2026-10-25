import 'package:flutter/material.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/helpers/quiz_database_helper.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/models/quiz_history_model.dart';
import 'package:wikapp_beta/widgets/profile_widgets/history_card_widget.dart';
import 'package:wikapp_beta/widgets/profile_widgets/history_lesson_card_widget.dart';

/// Unified Model for Timeline Sorting inside History Screen
class HistoryItem {
  final DateTime timestamp;
  final QuizHistoryModel? quizRecord;
  final LessonData? lesson;

  bool get isQuiz => quizRecord != null;

  HistoryItem.quiz(this.quizRecord)
      : lesson = null,
        timestamp = quizRecord!.timestamp;

  HistoryItem.lesson(this.lesson, this.timestamp) : quizRecord = null;
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryItem> _unifiedHistory = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAllHistory();

    // Listen live to BOTH quiz database insertions and lesson progress updates
    QuizDatabaseHelper.historyChangeNotifier.addListener(_loadAllHistory);
    dummyTermsNotifier.addListener(_loadAllHistory);
  }

  @override
  void dispose() {
    QuizDatabaseHelper.historyChangeNotifier.removeListener(_loadAllHistory);
    dummyTermsNotifier.removeListener(_loadAllHistory);
    super.dispose();
  }

  /// Load and merge Quiz attempts and Lesson progress chronologically
  Future<void> _loadAllHistory() async {
    // 1. Fetch Quiz History Records from SQLite
    final quizRecords =
        await QuizDatabaseHelper.instance.getAllHistoryRecords();

    // 2. Fetch Lesson States from SQLite
    final lessonStates = await LessonDatabase.instance.getAllLessonStates();

    // 3. Flatten current in-memory lessons for quick lookups
    final allLessons = dummyTermsNotifier.value.expand((t) => t.lessons).toList();

    List<HistoryItem> items = [];

    // Add quiz attempts
    for (var quiz in quizRecords) {
      items.add(HistoryItem.quiz(quiz));
    }

    // Add active lesson reading progress based on SQLite timestamps
    for (var state in lessonStates) {
      final String lessonId = state['id'] as String;
      final double progress = (state['progress'] as num).toDouble();
      final String updatedAtStr = state['updated_at'] as String;

      if (progress > 0) {
        final lesson = allLessons.firstWhere(
          (l) => l.id == lessonId,
          orElse: () => LessonData(
            id: lessonId,
            title: 'PAKSA: Aralin',
            status: 'Tapusin ang pagbabasa',
            badgeColor: const Color(0xFFC86D51),
            imagePath: 'assets/images/paksa1_icon.png',
            progress: progress,
          ),
        );

        final updatedLesson = lesson.copyWith(progress: progress);
        final timestamp = DateTime.parse(updatedAtStr);

        items.add(HistoryItem.lesson(updatedLesson, timestamp));
      }
    }

    // 4. Sort all items descending (newest first)
    items.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    if (mounted) {
      setState(() {
        _unifiedHistory = items;
        _isLoading = false;
      });
    }
  }

  String _getDateCategory(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final historyDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (historyDate == today) {
      return 'Ngayong Araw';
    } else if (historyDate == today.subtract(const Duration(days: 1))) {
      return 'Kahapon';
    } else {
      return 'Maaagang Aktibidad';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Group combined history items by date
    final Map<String, List<HistoryItem>> groupedItems = {};
    for (var item in _unifiedHistory) {
      final category = _getDateCategory(item.timestamp);
      groupedItems.putIfAbsent(category, () => []).add(item);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.arrow_back_rounded,
                    color: Color(0xFF0F172A), size: 26),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 16),

              // Screen Title
              const Text(
                'Kasaysayan ng Aktibidad',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Iyong mga natapos na pagsasanay at aralin',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 24),

              _isLoading
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child:
                            CircularProgressIndicator(color: Color(0xFFC86D51)),
                      ),
                    )
                  : groupedItems.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 60),
                            child: Text(
                              'Wala pang kasaysayan ng aktibidad.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: groupedItems.entries.map((entry) {
                            final sectionTitle = entry.key;
                            final itemsList = entry.value;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sectionTitle,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ...itemsList.map((item) {
                                  if (item.isQuiz) {
                                    return HistoryActivityCard(
                                        record: item.quizRecord!);
                                  } else {
                                    return HistoryLessonCard(
                                      lesson: item.lesson!,
                                      updatedAt: item.timestamp,
                                    );
                                  }
                                }),
                                const SizedBox(height: 16),
                              ],
                            );
                          }).toList(),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}