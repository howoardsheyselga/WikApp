import 'package:flutter/material.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/models/lesson_models.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String category;
  final String imagePath;

  const ProgressCard({
    super.key,
    this.title = 'Ang Iyong Progreso',
    this.category = 'Araling Panlipunan',
    this.imagePath = 'assets/images/dash_progress.png',
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TermData>>(
      valueListenable: dummyTermsNotifier,
      builder: (context, terms, child) {
        // Calculate total progress across all terms and lessons
        int totalLessons = 0;
        double totalProgressSum = 0.0;

        for (var term in terms) {
          for (var lesson in term.lessons) {
            totalLessons++;
            totalProgressSum += lesson.progress;
          }
        }

        final double overallProgress =
            totalLessons > 0 ? totalProgressSum / totalLessons : 0.0;
        final int percentage = (overallProgress * 100).round();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: overallProgress,
                        minHeight: 10,
                        backgroundColor: const Color(0xFFFFEDD5),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF1E293B),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$percentage%',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Image.asset(
                imagePath,
                width: 70,
                height: 70,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox(width: 70, height: 70),
              ),
            ],
          ),
        );
      },
    );
  }
}