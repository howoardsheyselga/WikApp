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
import 'package:wikapp_beta/screens/lesson_screens/paksa5_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa5_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa6_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa6_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa7_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa7_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa8_flashcard_screen.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa8_screen.dart';

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
      case 'lesson_201':
        return Paksa5Screen(lesson: lesson);
      case 'lesson_202':
        return Paksa6Screen(lesson: lesson);
      case 'lesson_301':
        return Paksa7Screen(lesson: lesson);
      case 'lesson_302':
        return Paksa8Screen(lesson: lesson);
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
      case 'lesson_201':
        return const Paksa5FlashcardScreen();
      case 'lesson_202':
        return const Paksa6FlashcardScreen();
      case 'lesson_301':
        return const Paksa7FlashcardScreen();
      case 'lesson_302':
        return const Paksa8FlashcardScreen();
      default:
        return Scaffold(
          appBar: AppBar(title: Text('${lesson.title} (Flashcards)')),
          body: Center(
              child: Text('Wala pang Flashcard Screen sa ID: ${lesson.id}')),
        );
    }
  }
}