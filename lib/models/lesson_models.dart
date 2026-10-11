import 'package:flutter/material.dart';

class LessonData {
  final String id;
  final String title;
  final String status;
  final Color badgeColor;
  final String imagePath;
  final double progress;

  LessonData({
    required this.id,
    required this.title,
    required this.status,
    required this.badgeColor,
    required this.imagePath,
    this.progress = 0.0,
  });

  /// Allows updating progress and automatically deriving status
  LessonData copyWith({
    String? status,
    double? progress,
  }) {
    final double newProgress = (progress ?? this.progress).clamp(0.0, 1.0);
    
    // Automatically set status based on progress if not explicitly passed
    String derivedStatus = status ?? this.status;
    if (status == null) {
      if (newProgress >= 1.0) {
        derivedStatus = 'Tapos na';
      } else if (newProgress > 0) {
        derivedStatus = 'Tapusin ang pagbabasa';
      } else {
        derivedStatus = 'Hindi pa nasisimulan';
      }
    }

    return LessonData(
      id: id,
      title: title,
      status: derivedStatus,
      badgeColor: badgeColor,
      imagePath: imagePath,
      progress: newProgress,
    );
  }
}

class TermData {
  final String id;
  final String title;
  final List<LessonData> lessons;

  TermData({
    required this.id,
    required this.title,
    required this.lessons,
  });

  double get overallProgress {
    if (lessons.isEmpty) return 0.0;
    final total = lessons.fold<double>(0.0, (sum, lesson) => sum + lesson.progress);
    return total / lessons.length;
  }
}