import 'package:flutter/material.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';

/// Global reactive state for all terms and lessons
final ValueNotifier<List<TermData>> dummyTermsNotifier =
    ValueNotifier<List<TermData>>([
  TermData(
    id: 'term_1',
    title: '1st Term',
    lessons: [
      LessonData(
        id: 'lesson_101',
        title: 'PAKSA 1: INTRODUKSIYON SA MABISANG KOMUNIKASYON',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color(0xFFC86D51),
        imagePath: 'assets/images/paksa1_icon.png',
        progress: 0.0,
      ),
      LessonData(
        id: 'lesson_102',
        title: 'PAKSA 2: KRITIKAL NA KASANAYAN SA KOMUNIKASYON',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color(0xFFE2A478),
        imagePath: 'assets/images/paksa2_icon.png',
        progress: 0.0,
      ),
      LessonData(
        id: 'lesson_103',
        title: 'PAKSA 3: URI NG TEKSTO',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color(0xFFE5C8A0),
        imagePath: 'assets/images/paksa3_icon.png',
        progress: 0.0,
      ),
      LessonData(
        id: 'lesson_104',
        title: 'PAKSA 4: INGKLUSIBO AT ETIKAL NA DISKURSO',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color.fromARGB(255, 229, 180, 160),
        imagePath: 'assets/images/paksa4_icon.png',
        progress: 0.0,
      ),
    ],
  ),
  TermData(
    id: 'term_2',
    title: '2nd Term',
    lessons: [
      LessonData(
        id: 'lesson_201',
        title: 'PAKSA 5: MGA URI NG AKADEMIKONG TEKSTO',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color(0xFFC86D51),
        imagePath: 'assets/images/paksa5_icon.png',
        progress: 0.0,
      ),
      LessonData(
        id: 'lesson_202',
        title: 'PAKSA 6: TEKNIKAL NA TEKSTO',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color(0xFFE5C8A0),
        imagePath: 'assets/images/paksa6_icon.png',
        progress: 0.0,
      ),
    ],
  ),
  TermData(
    id: 'term_3',
    title: '3rd Term',
    lessons: [
      LessonData(
        id: 'lesson_301',
        title: 'PAKSA 7: PANGUNAHING TUNTUNIN SA PAKIKIPAGTALASTASAN',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color(0xFFC86D51),
        imagePath: 'assets/images/paksa7_icon.png',
        progress: 0.0,
      ),
      LessonData(
        id: 'lesson_302',
        title:
            'PAKSA 8: PANGUNAHING TUNTUNIN SA PAGSUSULAT NANG TEKSTONG PANTRABAHO',
        status: 'Tapusin ang pagbabasa',
        badgeColor: const Color(0xFFE2A478),
        imagePath: 'assets/images/paksa8_icon.png',
        progress: 0.0,
      ),
    ],
  ),
]);

/// 1. Load saved SQLite states into dummyTermsNotifier on app launch
Future<void> loadLessonsFromDatabase() async {
  final currentTerms = dummyTermsNotifier.value;

  final updatedTerms = await Future.wait(currentTerms.map((term) async {
    final updatedLessons = await Future.wait(term.lessons.map((lesson) async {
      final state = await LessonDatabase.instance.getLessonState(lesson.id);
      if (state != null) {
        final double progress = (state['progress'] as num).toDouble();
        final bool isBookmarked = (state['is_bookmarked'] as int) == 1;
        final String status =
            progress >= 1.0 ? 'Tapos na' : 'Tapusin ang pagbabasa';

        return lesson.copyWith(
          progress: progress,
          status: status,
          isBookmarked: isBookmarked,
        );
      }
      return lesson;
    }));

    return TermData(
      id: term.id,
      title: term.title,
      lessons: updatedLessons,
    );
  }));

  dummyTermsNotifier.value = updatedTerms;
}

/// 2. Call this from any screen to update SQLite AND notify the UI
Future<void> updateLessonProgress(String lessonId, double newProgress) async {
  final double clampedProgress = newProgress.clamp(0.0, 1.0);

  // A. Save to SQLite
  await LessonDatabase.instance.updateProgress(lessonId, clampedProgress);

  // B. Update in-memory state to trigger ValueListenableBuilder rebuilds
  final currentTerms = dummyTermsNotifier.value;
  bool updated = false;

  final updatedTerms = currentTerms.map((term) {
    final updatedLessons = term.lessons.map((lesson) {
      if (lesson.id == lessonId) {
        if (clampedProgress > lesson.progress) {
          updated = true;
          final updatedStatus =
              clampedProgress >= 1.0 ? 'Tapos na' : 'Tapusin ang pagbabasa';
          return lesson.copyWith(
            progress: clampedProgress,
            status: updatedStatus,
          );
        }
      }
      return lesson;
    }).toList();

    return TermData(
      id: term.id,
      title: term.title,
      lessons: updatedLessons,
    );
  }).toList();

  if (updated) {
    dummyTermsNotifier.value = updatedTerms; // Triggers UI rebuild on LessonsScreen
  }
}