import 'package:flutter/material.dart';
import 'package:wikapp_beta/screens/lesson_screens/paksa1_screen.dart';
import '../database/lesson_data.dart';
import '../models/lesson_models.dart';
import '../widgets/home_page_widget/dashboard_header.dart';
import '../widgets/lesson_page_widget/term_section.dart';

class LessonsScreen extends StatelessWidget {
const LessonsScreen({super.key, this.onSelectTab});
  final ValueChanged<int>? onSelectTab;

  // Helper method to open Paksa1Screen
  Future<void> openLesson(BuildContext context, LessonData lesson) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Paksa1Screen(lesson: lesson),
      ),
    );

    // If user tapped "Take a Quiz", switch to Activity Tab (Index 2)
    if (result == 'take_quiz') {
      onSelectTab?.call(2);
    }
  }

  /// Calculates total progress across all terms and lessons dynamically
  double _calculateTotalProgress(List<TermData> terms) {
    if (terms.isEmpty) return 0.0;
    final allLessons = terms.expand((t) => t.lessons).toList();
    if (allLessons.isEmpty) return 0.0;
    final total = allLessons.fold<double>(0.0, (sum, l) => sum + l.progress);
    return total / allLessons.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: ValueListenableBuilder<List<TermData>>(
          valueListenable: dummyTermsNotifier,
          builder: (context, terms, child) {
            final double courseProgress = _calculateTotalProgress(terms);
            final int coursePercentage = (courseProgress * 100).round();

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardHeader(),
                  const SizedBox(height: 20),
                  const Text(
                    'Mga Aralin',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Araling Panlipunan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Overall Course Progress Banner
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Kabuuan ng Pag-unlad',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '$coursePercentage%',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE5C8A0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: courseProgress,
                            minHeight: 8,
                            backgroundColor:
                                Colors.white.withValues(alpha: 0.15),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFE5C8A0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // List of Term Sections
                  ...terms.map((term) => TermSection(term: term)),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}