import 'package:flutter/material.dart';
import '../models/lesson_models.dart';

/// Wrapped in ValueNotifier so changes trigger UI updates automatically
final ValueNotifier<List<TermData>> dummyTermsNotifier = ValueNotifier<List<TermData>>([
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
        status: 'Tapos na',
        badgeColor: const Color(0xFFE5C8A0),
        imagePath: 'assets/images/paksa3_icon.png',
        progress: 0.0,
      ),
      LessonData(
        id: 'lesson_104',
        title: 'PAKSA 4: INGKLUSIBO AT ETIKAL NA DISKURSO',
        status: 'Tapos na',
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
        progress: 0.60,
      ),
      LessonData(
        id: 'lesson_202',
        title: 'PAKSA 6: TEKNIKAL NA TEKSTO',
        status: 'Tapos na',
        badgeColor: const Color(0xFFE5C8A0),
        imagePath: 'assets/images/paksa6_icon.png',
        progress: 1.0,
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
        status: 'Tapos na',
        badgeColor: const Color(0xFFC86D51),
        imagePath: 'assets/images/paksa7_icon.png',
        progress: 1.0,
      ),
      LessonData(
        id: 'lesson_302',
        title: 'PAKSA 8: PANGUNAHING TUNTUNIN SA PAGSUSULAT NANG TEKSTONG PANTRABAHO',
        status: 'Tapos na',
        badgeColor: const Color(0xFFE2A478),
        imagePath: 'assets/images/paksa8_icon.png',
        progress: 1.0,
      ),
    ],
  ),
]);

/// Call this function from any screen to update a lesson's progress
void updateLessonProgress(String lessonId, double newProgress) {
  final currentTerms = dummyTermsNotifier.value;
  
  bool updated = false;
  final updatedTerms = currentTerms.map((term) {
    final updatedLessons = term.lessons.map((lesson) {
      if (lesson.id == lessonId) {
        // Only update if progress increased
        if (newProgress > lesson.progress) {
          updated = true;
          return lesson.copyWith(progress: newProgress);
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
    dummyTermsNotifier.value = updatedTerms; // Triggers UI refresh
  }
}