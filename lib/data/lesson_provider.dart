import 'package:flutter/material.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';

final ValueNotifier<List<TermData>> termsNotifier = ValueNotifier<List<TermData>>([]);

/// Call to record reading progress and update both DB and active UI
Future<void> updateLessonProgress(String lessonId, double newProgress) async {
  await LessonDatabase.instance.updateProgress(lessonId, newProgress);
  await loadLessonsFromDatabase(); // Refresh UI state
}

/// Call to toggle bookmark status in SQLite and refresh UI
Future<bool> toggleLessonBookmark(String lessonId) async {
  final newState = await LessonDatabase.instance.toggleBookmark(lessonId);
  await loadLessonsFromDatabase(); // Refresh UI state
  return newState;
}