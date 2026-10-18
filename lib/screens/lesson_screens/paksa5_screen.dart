import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa5/paksa5_data.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/dashboard.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/paksa1_components.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/reading_guard_wrapper.dart';

class Paksa5Screen extends StatefulWidget {
  final LessonData lesson;

  const Paksa5Screen({super.key, required this.lesson});

  @override
  State<Paksa5Screen> createState() => _Paksa5ScreenState();
}

class _Paksa5ScreenState extends State<Paksa5Screen> {
  bool isBookmarked = false;
  double fontSizeMultiplier = 1.0;
  late double _readingProgress;
  late double _lastSavedProgress;

  @override
  void initState() {
    super.initState();
    _readingProgress = widget.lesson.progress;
    _lastSavedProgress = widget.lesson.progress;
    isBookmarked = widget.lesson.isBookmarked;
    _loadStateFromDatabase();
  }

  /// Synchronize initial state with SQLite database
  Future<void> _loadStateFromDatabase() async {
    final state =
        await LessonDatabase.instance.getLessonState(widget.lesson.id);
    if (state != null && mounted) {
      final double savedProgress = (state['progress'] as num).toDouble();
      setState(() {
        _readingProgress = savedProgress;
        _lastSavedProgress = savedProgress;
        isBookmarked = (state['is_bookmarked'] as int) == 1;
      });
    }
  }

  /// Handles scroll progress updates smoothly and writes to SQLite every 5% threshold or at 100%
  void _handleProgressUpdate(double newProgress) {
    if (newProgress <= _readingProgress) return;

    // 1. Live UI update in memory
    setState(() {
      _readingProgress = newProgress;
    });

    // 2. Persist to SQLite & update global notifier when threshold reached or completed
    if ((newProgress - _lastSavedProgress >= 0.05) || newProgress >= 1.0) {
      _lastSavedProgress = newProgress;
      updateLessonProgress(widget.lesson.id, newProgress);
    }
  }

  /// Toggle bookmark status in SQLite and notify user
  Future<void> _handleBookmarkToggle() async {
    final newStatus =
        await LessonDatabase.instance.toggleBookmark(widget.lesson.id);

    if (mounted) {
      setState(() {
        isBookmarked = newStatus;
      });

      // Refresh global provider state
      await loadLessonsFromDatabase();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newStatus
                ? 'Naidagdag sa mga Naka-bookmark!'
                : 'Inalis sa mga Naka-bookmark.',
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _toggleFontSize() {
    setState(() {
      if (fontSizeMultiplier == 1.0) {
        fontSizeMultiplier = 1.15;
      } else if (fontSizeMultiplier == 1.15) {
        fontSizeMultiplier = 1.3;
      } else {
        fontSizeMultiplier = 1.0;
      }
    });
  }

  @override
  void dispose() {
    // Save any unsaved final progress when popping off the screen
    if (_readingProgress > _lastSavedProgress) {
      updateLessonProgress(widget.lesson.id, _readingProgress);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double baseFontSize = 15.0 * fontSizeMultiplier;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.lesson.title,
          style: const TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: const Text(
              'AA',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            onPressed: _toggleFontSize,
            tooltip: 'Baguhin ang Laki ng Titik',
          ),
          IconButton(
            icon: Icon(
              isBookmarked
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_outline_rounded,
              color: isBookmarked
                  ? const Color(0xFFC86D51)
                  : const Color(0xFF1E293B),
            ),
            onPressed: _handleBookmarkToggle,
            tooltip: 'I-bookmark ang Paksa',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            height: 4,
            width: double.infinity,
            color: const Color(0xFFE2E8F0),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: _readingProgress,
              child: Container(color: const Color(0xFFC86D51)),
            ),
          ),
        ),
      ),
      body: ReadingGuardWrapper(
        currentProgress: _readingProgress,
        onProgressUpdated: _handleProgressUpdate,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image Banner
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1E4D3),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/paksa5_header.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.school_rounded,
                          size: 70,
                          color: Color(0xFFC86D51),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Titles
              const Text(
                Paksa5Data.mainHeader,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: Color(0xFFC86D51),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.lesson.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                Paksa5Data.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 20),

              // Intro Section Card
              SectionHeader(
                title: 'Ano ang Akademikong Teksto?',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 10),
              Text(
                Paksa5Data.defBody,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              // History & Importance
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFC86D51).withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kasaysayan at Kahalagahan:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC86D51),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Paksa5Data.kasaysayanBody,
                      style: TextStyle(
                        fontSize: baseFontSize - 1,
                        color: const Color(0xFF475569),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      Paksa5Data.kahalagahanBody,
                      style: TextStyle(
                        fontSize: baseFontSize - 1,
                        color: const Color(0xFF334155),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Section 2: Pangunahing Uri ng Akademikong Sulatin
              SectionHeader(
                title: 'Pangunahing Uri ng Akademikong Sulatin',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa5Data.pangunahingUriList.map(
                (item) => _buildUriCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 3: Iba Pang Uri ng Akademikong Sulatin
              SectionHeader(
                title: 'Iba Pang Uri ng Akademikong Sulatin',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa5Data.ibaPangUriList.map(
                (item) => _buildUriCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 4: Nilalaman, Estruktura, at Wika
              SectionHeader(
                title: 'Nilalaman, Estruktura, at Wika',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa5Data.pillarsIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),

              // Nilalaman Subsections
              ...Paksa5Data.nilalamanSubsections.map(
                (sub) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sub['title']!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sub['desc']!,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        sub['example']!,
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Pagsusuri ng Nilalaman Card
              const Text(
                'Pagsusuri ng Nilalaman:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa5Data.pagsusuriNilalamanList.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF6EE),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFC86D51).withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['desc']!,
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          color: const Color(0xFF334155),
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Estruktura Section
              const Text(
                'Estruktura ng Akademikong Teksto:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa5Data.estrukturaParts.map(
                (part) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        part['title']!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        part['desc']!,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        part['example']!,
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFFC86D51),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Cohesive Devices Table Box
              const Text(
                'Paggamit ng Pandugtong (Cohesive Devices):',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: Paksa5Data.pandugtongCategories
                      .map(
                        (cat) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${cat['type']}: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC86D51),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cat['words']!,
                                  style: TextStyle(
                                    fontSize: baseFontSize - 1,
                                    color: const Color(0xFF334155),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 28),

              // Section 5: Paraphrasing & APA References
              SectionHeader(
                title: 'Paraphrasing at Reperensiya (APA 7th)',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 12),
              const Text(
                'Mga Hakbang sa Pagbubuod:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 6),
              ...Paksa5Data.buodSteps.map(
                (step) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    step,
                    style: TextStyle(
                      fontSize: baseFontSize - 1,
                      color: const Color(0xFF475569),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Mga Halimbawa ng Reperensiya (APA 7th Edition):',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa5Data.referenceExamples.map(
                (ref) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ref.typeName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pormula: ${ref.formula}',
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Halimbawa:\n${ref.example}',
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // AI Declaration Policy Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.smart_toy_rounded,
                            color: Color(0xFFE5C8A0), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Paggamit ng AI at Deklarasyon',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Paksa5Data.aiDeclarationText,
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        color: const Color(0xFFCBD5E1),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Bottom Action Options (Finish Review / Take a Quiz)
              BottomActionOptions(
                onFinishReview: () async {
                  _lastSavedProgress = 1.0;
                  setState(() {
                    _readingProgress = 1.0;
                  });
                  await updateLessonProgress(widget.lesson.id, 1.0);
                  if (mounted) Navigator.pop(context);
                },
                onTakeQuiz: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ActivityDashboardScreen(initialIndex: 2),
                    ),
                    (route) => false,
                  );
                },
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUriCard(UriSulatinItem item, double baseFontSize) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.number}. ${item.title}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
              height: 1.45,
            ),
          ),
          if (item.details != null) ...[
            const SizedBox(height: 8),
            Text(
              item.subLabel ?? 'Mga Detalye:',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            ...item.details!.map(
              (detail) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  '• $detail',
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    color: const Color(0xFF334155),
                  ),
                ),
              ),
            ),
          ],
          if (item.example != null) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF6EE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Halimbawa: ${item.example!}',
                style: TextStyle(
                  fontSize: baseFontSize - 2,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                  height: 1.35,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}