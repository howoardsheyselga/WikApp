import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa2/paksa2_data.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/dashboard.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/paksa1_components.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/reading_guard_wrapper.dart';

class Paksa2Screen extends StatefulWidget {
  final LessonData lesson;

  const Paksa2Screen({super.key, required this.lesson});

  @override
  State<Paksa2Screen> createState() => _Paksa2ScreenState();
}

class _Paksa2ScreenState extends State<Paksa2Screen> {
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
                    'assets/images/paksa2_header.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.psychology_rounded,
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
                Paksa2Data.mainHeader,
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
                Paksa2Data.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 20),

              // Introductory Paragraph
              Text(
                Paksa2Data.introBody,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              // Intro Examples Box
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
                      'Halimbawa ng Kritikal na Pagsusuri:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC86D51),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...Paksa2Data.introExamples.map(
                      (ex) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '• ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC86D51),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ex,
                                style: TextStyle(
                                  fontSize: baseFontSize - 1,
                                  color: const Color(0xFF475569),
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Section 1: Kritikal na Kasanayan
              SectionHeader(
                title: Paksa2Data.kasanayanHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa2Data.kasanayanList.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 14),
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
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAF6EE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: baseFontSize - 2,
                              color: const Color(0xFF334155),
                              height: 1.4,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Halimbawa: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC86D51),
                                ),
                              ),
                              TextSpan(text: item.example),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Section 2: Sosyal at Kultural na Pananaw
              SectionHeader(
                title: Paksa2Data.sosyoKulturalHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa2Data.sosyoKulturalIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 20),

              // Kontekstong Sosyal
              Text(
                Paksa2Data.sosyalSubheading,
                style: TextStyle(
                  fontSize: baseFontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFC86D51),
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa2Data.kontekstoSosyalList.map(
                (item) => _buildContextCard(item, baseFontSize),
              ),
              const SizedBox(height: 24),

              // Kontekstong Kultural
              Text(
                Paksa2Data.kulturalSubheading,
                style: TextStyle(
                  fontSize: baseFontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFC86D51),
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa2Data.kontekstoKulturalList.map(
                (item) => _buildContextCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 3: Iba Pang Konteksto
              SectionHeader(
                title: Paksa2Data.ibaPangKontekstoHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa2Data.ibaPangKontekstoList.map(
                (item) => _buildContextCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 4: Hudyat ng Bias
              SectionHeader(
                title: Paksa2Data.biasHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa2Data.biasIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                Paksa2Data.biasWordsSubheading,
                style: TextStyle(
                  fontSize: baseFontSize + 1,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFC86D51),
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa2Data.biasWordsList.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFF1F5F9)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.number}. ${item.title}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.example,
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFFC86D51),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Section 5: Mga Teknik ng Pagkiling
              Text(
                Paksa2Data.biasTechniquesSubheading,
                style: TextStyle(
                  fontSize: baseFontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa2Data.biasTechniquesList.map(
                (tech) => Container(
                  margin: const EdgeInsets.only(bottom: 14),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '${tech.number}. ${tech.title}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC86D51),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5C8A0)
                                  .withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tech.uri,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF92400E),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Kahulugan: ${tech.description}',
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAF6EE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halimbawa:\n${tech.example}',
                              style: TextStyle(
                                fontSize: baseFontSize - 2,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E293B),
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              tech.explanation,
                              style: TextStyle(
                                fontSize: baseFontSize - 2,
                                color: const Color(0xFF64748B),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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

  Widget _buildContextCard(ContextItem item, double baseFontSize) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
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
            item.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
              height: 1.5,
            ),
          ),
          if (item.examples.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF6EE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Halimbawa:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC86D51),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...item.examples.map(
                    (ex) => Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        '• $ex',
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          color: const Color(0xFF334155),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}