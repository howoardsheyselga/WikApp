import 'dart:convert';
import 'package:wikapp_beta/widgets/activity_widgets/answer_review_modal.dart';

class QuizHistoryModel {
  final int? id;
  final String paksaTitle; // e.g., "PAKSA 1: INTRODUKSIYON SA MABISANG KOMUNIKASYON"
  final String activityType; // e.g., "MULTIPLE CHOICE", "PAGTUKOY", "TAMA O MALI", "PAGTATAMBAL"
  final int score;
  final int totalQuestions;
  final DateTime timestamp;
  final List<QuizReviewItem> reviewItems;

  QuizHistoryModel({
    this.id,
    required this.paksaTitle,
    required this.activityType,
    required this.score,
    required this.totalQuestions,
    required this.timestamp,
    required this.reviewItems,
  });

  // Calculate percentage
  double get percentage => totalQuestions > 0 ? (score / totalQuestions) * 100 : 0.0;

  // Convert model instance to Map for SQLite
  Map<String, dynamic> toMap() {
    final List<Map<String, dynamic>> reviewJsonList = reviewItems.map((item) {
      return {
        'questionText': item.questionText,
        'userAnswer': item.userAnswer,
        'correctAnswer': item.correctAnswer,
        'isCorrect': item.isCorrect,
      };
    }).toList();

    return {
      if (id != null) 'id': id,
      'paksa_title': paksaTitle,
      'activity_type': activityType,
      'score': score,
      'total_questions': totalQuestions,
      'timestamp': timestamp.toIso8601String(),
      'review_items_json': jsonEncode(reviewJsonList),
    };
  }

  // Create model instance from SQLite Map
  factory QuizHistoryModel.fromMap(Map<String, dynamic> map) {
    final List<dynamic> jsonList = jsonDecode(map['review_items_json'] as String);
    final List<QuizReviewItem> parsedReviewItems = jsonList.map((item) {
      return QuizReviewItem(
        questionText: item['questionText'] as String,
        userAnswer: item['userAnswer'] as String,
        correctAnswer: item['correctAnswer'] as String,
        isCorrect: item['isCorrect'] as bool,
      );
    }).toList();

    return QuizHistoryModel(
      id: map['id'] as int?,
      paksaTitle: map['paksa_title'] as String,
      activityType: map['activity_type'] as String,
      score: map['score'] as int,
      totalQuestions: map['total_questions'] as int,
      timestamp: DateTime.parse(map['timestamp'] as String),
      reviewItems: parsedReviewItems,
    );
  }
}