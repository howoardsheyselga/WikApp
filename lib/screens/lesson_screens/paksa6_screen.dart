import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa6/paksa6_data.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/dashboard.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/paksa1_components.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/reading_guard_wrapper.dart';

class Paksa6Screen extends StatefulWidget {
  final LessonData lesson;

  const Paksa6Screen({super.key, required this.lesson});

  @override
  State<Paksa6Screen> createState() => _Paksa6ScreenState();
}

class _Paksa6ScreenState extends State<Paksa6Screen> {
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
                    'assets/images/paksa6_header.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.precision_manufacturing_rounded,
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
                Paksa6Data.mainHeader,
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
                Paksa6Data.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 20),

              // Intro Section
              SectionHeader(
                title: 'Ano ang Teknikal na Teksto?',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 10),
              Text(
                Paksa6Data.defBody,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 28),

              // Section 1: 6 Katangian ng Teknikal na Teksto
              SectionHeader(
                title: 'Mga Katangian ng Teknikal na Teksto',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa6Data.katangianIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa6Data.katangianList.map(
                (item) => _buildKatangianCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 2: 6 Uri ng Teknikal na Teksto
              SectionHeader(
                title: 'Mga Uri ng Teknikal na Teksto',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa6Data.uriTeknikalIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa6Data.uriTeknikalList.map(
                (item) => _buildUriTeknikalCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 3: Tekstong Biswal
              SectionHeader(
                title: 'Tekstong Biswal sa Teknikal na Teksto',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa6Data.tekstongBiswalIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa6Data.biswalList.map(
                (biswal) => _buildBiswalCard(biswal, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 4: 9 Pamantayan ng Epektibong Tekstong Biswal
              SectionHeader(
                title: 'Pamantayan ng Epektibong Tekstong Biswal',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa6Data.pamantayanIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa6Data.pamantayanList.map(
                (p) => Container(
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
                        '${p.number}. ${p.title}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        p.description,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAF6EE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          p.evaluationQuestion,
                          style: TextStyle(
                            fontSize: baseFontSize - 2,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            color: const Color(0xFFC86D51),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Summary Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.summarize_rounded,
                            color: Color(0xFFE5C8A0), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Buod ng Aralin',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Paksa6Data.buodBody,
                      style: TextStyle(
                        fontSize: baseFontSize - 1,
                        height: 1.6,
                        color: const Color(0xFFF1F5F9),
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

  Widget _buildKatangianCard(KatangianItem item, double baseFontSize) {
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
          if (item.bulletPoints != null) ...[
            const SizedBox(height: 8),
            ...item.bulletPoints!.map(
              (bp) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '• $bp',
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    color: const Color(0xFF334155),
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ],
          if (item.badExample != null && item.goodExample != null) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF6EE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        color: const Color(0xFF334155),
                      ),
                      children: [
                        const TextSpan(
                          text: 'Iwasan: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB91C1C),
                          ),
                        ),
                        TextSpan(text: '"${item.badExample!}"'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        color: const Color(0xFF334155),
                      ),
                      children: [
                        const TextSpan(
                          text: 'Mas Malinaw: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF15803D),
                          ),
                        ),
                        TextSpan(text: '"${item.goodExample!}"'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (item.note != null) ...[
            const SizedBox(height: 8),
            Text(
              item.note!,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF64748B),
                height: 1.35,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildUriTeknikalCard(UriTeknikalItem item, double baseFontSize) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${item.number}. ${item.title}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC86D51),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC86D51),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Karaniwang Bahagi:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 4),
          ...item.parts.map(
            (part) => Text(
              '• $part',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                color: const Color(0xFF334155),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFAF6EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mga Halimbawa:',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC86D51),
                  ),
                ),
                const SizedBox(height: 2),
                ...item.examples.map(
                  (ex) => Text(
                    '• $ex',
                    style: TextStyle(
                      fontSize: baseFontSize - 2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBiswalCard(TekstongBiswalItem biswal, double baseFontSize) {
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
            '${biswal.number}. ${biswal.title}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            biswal.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Gamit at Layunin:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 4),
          ...biswal.uses.map(
            (use) => Text(
              '• $use',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                color: const Color(0xFF334155),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFAF6EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kailan Pinakamainam Gamitin?\n${biswal.bestUsedWhen}',
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Halimbawa: ${biswal.example}',
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFFC86D51),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}