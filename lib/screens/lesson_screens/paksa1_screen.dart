import 'package:flutter/material.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/dashboard.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/reading_guard_wrapper.dart';
import '../../data/paksa1/paksa1_data.dart';
import '../../widgets/paksa1_widgets/paksa1_components.dart';

class Paksa1Screen extends StatefulWidget {
  final LessonData lesson;

  const Paksa1Screen({super.key, required this.lesson});

  @override
  State<Paksa1Screen> createState() => _Paksa1ScreenState();
}

class _Paksa1ScreenState extends State<Paksa1Screen> {
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
              // Header Image Asset
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
                    'assets/images/paksa1_header.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.record_voice_over_rounded,
                          size: 70,
                          color: Color(0xFFC86D51),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                Paksa1Data.mainHeader,
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
                Paksa1Data.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                Paksa1Data.introBody1,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                Paksa1Data.introBody2,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 24),

              SectionHeader(
                title: Paksa1Data.elementsHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 12),
              ...Paksa1Data.elements.map(
                (element) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
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
                        element.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        element.description,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              HighlightBox(
                text: Paksa1Data.elementsClosing,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 28),

              SectionHeader(
                title: Paksa1Data.katangianHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFC86D51).withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: Paksa1Data.katangianList
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '•  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC86D51),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: baseFontSize - 1,
                                      color: const Color(0xFF1E293B),
                                      height: 1.4,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '${item.title}: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: item.description),
                                    ],
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

              SectionHeader(
                title: Paksa1Data.paanoHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 6),
              Text(
                Paksa1Data.paanoIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  color: const Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa1Data.paanoList.map(
                (item) => ParaanCard(item: item, baseFontSize: baseFontSize),
              ),
              const SizedBox(height: 28),

              SectionHeader(
                title: Paksa1Data.meaningHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa1Data.meaningBody1,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                Paksa1Data.meaningBody2,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              Text(
                Paksa1Data.paanoNangyayariTitle,
                style: TextStyle(
                  fontSize: baseFontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFC86D51),
                ),
              ),
              const SizedBox(height: 10),
              CardTile(
                title: Paksa1Data.denotativeTitle,
                desc: Paksa1Data.denotativeDesc,
                example: Paksa1Data.denotativeExample,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 10),
              CardTile(
                title: Paksa1Data.connotativeTitle,
                desc: Paksa1Data.connotativeDesc,
                example: Paksa1Data.connotativeExample,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 28),

              SectionHeader(
                title: Paksa1Data.salikHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa1Data.salikList.map(
                (salik) => SalikCard(salik: salik, baseFontSize: baseFontSize),
              ),
              const SizedBox(height: 28),

              SectionHeader(
                title: Paksa1Data.kahalagahanHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa1Data.kahalagahanList.map(
                (k) => KahalagahanCard(item: k, baseFontSize: baseFontSize),
              ),
              const SizedBox(height: 28),

              SectionHeader(
                title: Paksa1Data.hudyatHeading,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa1Data.hudyatIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              Text(
                Paksa1Data.hudyatLayuninTitle,
                style: TextStyle(
                  fontSize: baseFontSize + 1,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 6),
              ...Paksa1Data.hudyatLayuninBullets.map(
                (bullet) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
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
                          bullet,
                          style: TextStyle(
                            fontSize: baseFontSize - 1,
                            color: const Color(0xFF475569),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                Paksa1Data.hudyatKahalagahanTitle,
                style: TextStyle(
                  fontSize: baseFontSize + 1,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa1Data.hudyatKahalagahanList.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                Paksa1Data.uriHudyatTitle,
                style: TextStyle(
                  fontSize: baseFontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa1Data.hudyatRows.map(
                (row) => HudyatRowCard(row: row, baseFontSize: baseFontSize),
              ),
              const SizedBox(height: 28),

              SectionHeader(
                title: Paksa1Data.estratehiyaTitle,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa1Data.estratehiyaDef,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                Paksa1Data.estratehiyaSubheading,
                style: TextStyle(
                  fontSize: baseFontSize + 1,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFC86D51),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa1Data.estratehiyaList.map(
                (e) => EstratehiyaCard(item: e, baseFontSize: baseFontSize),
              ),
              const SizedBox(height: 28),

              SectionHeader(
                title: Paksa1Data.scriptTitle,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: Paksa1Data.scriptLines
                      .map(
                        (line) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE5C8A0),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  line.speaker,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  line.text,
                                  style: TextStyle(
                                    fontSize: baseFontSize - 1,
                                    color: Colors.white,
                                    height: 1.4,
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
              const SizedBox(height: 12),
              HighlightBox(
                text: Paksa1Data.scriptAnalysis1,
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              HighlightBox(
                text: Paksa1Data.scriptAnalysis2,
                baseFontSize: baseFontSize,
              ),

              const SizedBox(height: 32),

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
}