import 'package:flutter/material.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa1_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa1_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa2_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa2_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa3_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa3_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa4_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa4_screen.dart';

class LessonRouter {
  /// Returns the Scroll screen for a lesson ID
  static Widget getScrollScreen(LessonData lesson) {
    switch (lesson.id) {
      case 'lesson_101':
        return Paksa1Screen(lesson: lesson);
      case 'lesson_102':
        return Paksa2Screen(lesson: lesson);
      case 'lesson_103':
        return Paksa3Screen(lesson: lesson);
      case 'lesson_104':
        return Paksa4Screen(lesson: lesson);
      default:
        return Scaffold(
          appBar: AppBar(title: Text('${lesson.title} (Scroll)')),
          body: Center(
              child: Text('Wala pang Scroll Screen sa ID: ${lesson.id}')),
        );
    }
  }

  /// Returns the Flashcard screen for a lesson ID
  static Widget getFlashcardScreen(LessonData lesson) {
    switch (lesson.id) {
      case 'lesson_101':
        return const Paksa1FlashcardScreen();
      case 'lesson_102':
        return const Paksa2FlashcardScreen();
      case 'lesson_103':
        return const Paksa3FlashcardScreen();
      case 'lesson_104':
        return const Paksa4FlashcardScreen();
      default:
        return Scaffold(
          appBar: AppBar(title: Text('${lesson.title} (Flashcards)')),
          body: Center(
              child: Text('Wala pang Flashcard Screen sa ID: ${lesson.id}')),
        );
    }
  }
}