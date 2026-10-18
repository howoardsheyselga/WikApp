import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa7/paksa7_data.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/dashboard.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/paksa1_components.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/reading_guard_wrapper.dart';

class Paksa7Screen extends StatefulWidget {
  final LessonData lesson;

  const Paksa7Screen({super.key, required this.lesson});

  @override
  State<Paksa7Screen> createState() => _Paksa7ScreenState();
}

class _Paksa7ScreenState extends State<Paksa7Screen> {
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
                    'assets/images/paksa7_header.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.business_center_rounded,
                          size: 70,
                          color: Color(0xFFC86D51),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Header Titles
              const Text(
                Paksa7Data.mainHeader,
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
                Paksa7Data.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 20),

              // Intro Text Paragraph
              Text(
                Paksa7Data.introBody,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 28),

              // Section 1: Pangunahing Tuntunin sa Pakikipagtalastasan
              SectionHeader(
                title: 'PANGUNAHING TUNTUNIN SA PAKIKIPAGTALASTASAN',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa7Data.tuntuninIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 20),

              // 1. Wika (Language Register)
              _buildSubTitle('1. Wika (Language Register)'),
              const SizedBox(height: 6),
              Text(
                Paksa7Data.registerIntro,
                style: TextStyle(
                  fontSize: baseFontSize - 1,
                  color: const Color(0xFF475569),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa7Data.registerList.map(
                (item) => _buildRegisterCard(item, baseFontSize),
              ),
              const SizedBox(height: 24),

              // 2. Tono (Tone of Communication)
              _buildSubTitle('2. Tono (Tone of Communication)'),
              const SizedBox(height: 6),
              Text(
                Paksa7Data.tonoIntro,
                style: TextStyle(
                  fontSize: baseFontSize - 1,
                  color: const Color(0xFF475569),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa7Data.tonoList.map(
                (item) => _buildTonoCard(item, baseFontSize),
              ),
              const SizedBox(height: 24),

              // 3. Konteksto (Context)
              _buildSubTitle('3. Konteksto (Context)'),
              const SizedBox(height: 6),
              Text(
                Paksa7Data.kontekstoIntro,
                style: TextStyle(
                  fontSize: baseFontSize - 1,
                  color: const Color(0xFF475569),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa7Data.kontekstoList.map(
                (item) => _buildKontekstoCard(item, baseFontSize),
              ),
              const SizedBox(height: 24),

              // 4. Feedback
              _buildSubTitle('4. Feedback'),
              const SizedBox(height: 6),
              Text(
                Paksa7Data.feedbackIntro,
                style: TextStyle(
                  fontSize: baseFontSize - 1,
                  color: const Color(0xFF475569),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa7Data.feedbackList.map(
                (item) => _buildFeedbackCard(item, baseFontSize),
              ),
              const SizedBox(height: 24),

              // 5. Noise o Hadlang sa Komunikasyon
              _buildSubTitle('5. Noise o Hadlang sa Komunikasyon'),
              const SizedBox(height: 6),
              Text(
                Paksa7Data.noiseIntro,
                style: TextStyle(
                  fontSize: baseFontSize - 1,
                  color: const Color(0xFF475569),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              ...Paksa7Data.noiseList.map(
                (item) => _buildNoiseCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 2: Kahalagahan ng Pag-aaral ng Komunikasyon
              SectionHeader(
                title: 'KAHALAGAHAN NG PAG-AARAL NG KOMUNIKASYON',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa7Data.kahalagahanIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa7Data.kahalagahanList.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Section 3: Sitwasyonal na Halimbawa ng Interaktibong Komunikasyon
              SectionHeader(
                title: 'MGA HALIMBAWA NG INTERAKTIBONG KOMUNIKASYON',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa7Data.halimbawaList.map(
                (item) => _buildScenarioCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 4: Interview, Pulong, at Tawag sa Telepono
              SectionHeader(
                title: 'INTERVIEW, PULONG, AT TAWAG SA TELEPONO',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa7Data.interviewIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              // Mahahalagang Termino at Konsepto
              const Text(
                'Mahahalagang Termino at Konsepto:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa7Data.interviewTermList.map(
                (term) => Container(
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
                        '${term.number}. ${term.title}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        term.description,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.4,
                        ),
                      ),
                      if (term.subItems != null) ...[
                        const SizedBox(height: 8),
                        ...term.subItems!.map(
                          (sub) => Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 2),
                            child: Text(
                              '• $sub',
                              style: TextStyle(
                                fontSize: baseFontSize - 2,
                                color: const Color(0xFF334155),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Kahalagahan ng Pag-unawa sa Interview, Pulong, at Telepono
              const Text(
                'Kahalagahan ng Pag-unawa sa Interview, Pulong, at Telepono:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 10),
              ...Paksa7Data.interviewImportanceList.map(
                (imp) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        imp['title']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        imp['desc']!,
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          color: const Color(0xFF475569),
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sitwasyon A: Interview & STAR Method
              _buildSubTitle('A. INTERVIEW (Behavioral Question & STAR Method)'),
              const SizedBox(height: 10),
              _buildStarMethodCard(baseFontSize),
              const SizedBox(height: 24),

              // Sitwasyon B: Pulong (Meeting Efficiency)
              _buildSubTitle('B. PULONG (Epektibo vs Hindi Epektibong Pulong)'),
              const SizedBox(height: 10),
              _buildPulongCard(baseFontSize),
              const SizedBox(height: 24),

              // Sitwasyon C: Tawag sa Telepono
              _buildSubTitle('C. TAWAG SA TELEPONO'),
              const SizedBox(height: 10),
              ...Paksa7Data.phoneCallExamples.map(
                (phoneEx) => _buildPhoneCallCard(phoneEx, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 5: Pagkakauugnay ng Wika, Tono, at Aktibong Pakikinig (Synthesis)
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
                        Icon(Icons.hub_rounded, color: Color(0xFFE5C8A0), size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'PAGKAKAUUGNAY NG WIKA, TONO, AT PAKIKINIG',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Paksa7Data.conclusionSynthesis,
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

  Widget _buildSubTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
    );
  }

  Widget _buildRegisterCard(RegisterItem item, double baseFontSize) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.number}. ${item.title}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
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
          const SizedBox(height: 6),
          Text(
            'Halimbawa: ${item.example}',
            style: TextStyle(
              fontSize: baseFontSize - 2,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTonoCard(TonoItem item, double baseFontSize) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.number}. ${item.title}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
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
          const SizedBox(height: 6),
          Text(
            'Halimbawa: ${item.example}',
            style: TextStyle(
              fontSize: baseFontSize - 2,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKontekstoCard(KontekstoItem item, double baseFontSize) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          const SizedBox(height: 6),
          Text(
            item.example,
            style: TextStyle(
              fontSize: baseFontSize - 2,
              fontStyle: FontStyle.italic,
              color: const Color(0xFFC86D51),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackCard(FeedbackItem item, double baseFontSize) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.number}. ${item.title}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
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
          if (item.example != null) ...[
            const SizedBox(height: 6),
            Text(
              'Halimbawa: ${item.example!}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNoiseCard(NoiseItem item, double baseFontSize) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.number}. ${item.title}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB91C1C),
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
          if (item.example != null) ...[
            const SizedBox(height: 6),
            Text(
              item.example!,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF1E293B),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildScenarioCard(Map<String, dynamic> item, double baseFontSize) {
    final int num = item['number'] as int;
    final String title = item['title'] as String;
    final String situation = item['situation'] as String;

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
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
            'Halimbawa $num: $title',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Sitwasyon: $situation',
            style: TextStyle(
              fontSize: baseFontSize - 1,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          if (item.containsKey('desc')) ...[
            const SizedBox(height: 4),
            Text(
              item['desc'] as String,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                color: const Color(0xFF475569),
              ),
            ),
          ],
          const SizedBox(height: 12),

          if (item.containsKey('bad')) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFFCA5A5).withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hindi Angkop / Hindi Epektibo:',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB91C1C),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item['bad'] as String,
                    style: TextStyle(
                      fontSize: baseFontSize - 2,
                      color: const Color(0xFF7F1D1D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],

          if (item.containsKey('good')) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF86EFAC).withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mas Angkop / Mas Epektibo:',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF15803D),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item['good'] as String,
                    style: TextStyle(
                      fontSize: baseFontSize - 2,
                      color: const Color(0xFF14532D),
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (item.containsKey('analysis')) ...[
            const SizedBox(height: 10),
            const Text(
              'Pagsusuri:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 2),
            ...((item['analysis'] as List<String>).map(
              (p) => Text(
                '• $p',
                style: TextStyle(
                  fontSize: baseFontSize - 2,
                  color: const Color(0xFF475569),
                ),
              ),
            )),
          ],

          if (item.containsKey('point')) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF6EE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Mahalagang Punto: ${item['point'] as String}',
                style: TextStyle(
                  fontSize: baseFontSize - 2,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC86D51),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStarMethodCard(double baseFontSize) {
    final starData = Paksa7Data.starMethodExample;
    final Map<String, String> starMap =
        starData['star'] as Map<String, String>;

    return Container(
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
            'Tanong sa Behavioral Interview: ${starData['question']}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF2F2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Mahinang Sagot: ${starData['weak']}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                color: const Color(0xFFB91C1C),
              ),
            ),
          ),
          const SizedBox(height: 10),

          const Text(
            'Mas Estrukturadong Sagot gamit ang STAR Method:',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF15803D),
            ),
          ),
          const SizedBox(height: 6),
          ...starMap.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    color: const Color(0xFF334155),
                  ),
                  children: [
                    TextSpan(
                      text: '${e.key}: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC86D51),
                      ),
                    ),
                    TextSpan(text: e.value),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            starData['point'] as String,
            style: TextStyle(
              fontSize: baseFontSize - 2,
              fontStyle: FontStyle.italic,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPulongCard(double baseFontSize) {
    final pulongData = Paksa7Data.pulongExample;
    final badPulong = pulongData['bad'] as Map<String, dynamic>;
    final goodPulong = pulongData['good'] as Map<String, dynamic>;

    return Container(
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF2F2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hindi Epektibo (${badPulong['situation']}):',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB91C1C),
                  ),
                ),
                const SizedBox(height: 4),
                ...((badPulong['results'] as List<String>).map(
                  (r) => Text(
                    '• $r',
                    style: TextStyle(
                      fontSize: baseFontSize - 2,
                      color: const Color(0xFF7F1D1D),
                    ),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Epektibong Pulong (May Organisasyon):',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF15803D),
                  ),
                ),
                const SizedBox(height: 4),
                ...((goodPulong['features'] as List<String>).map(
                  (f) => Text(
                    '• $f',
                    style: TextStyle(
                      fontSize: baseFontSize - 2,
                      color: const Color(0xFF14532D),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneCallCard(
      Map<String, dynamic> phoneEx, double baseFontSize) {
    return Container(
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
            phoneEx['title'] as String,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 6),
          if (phoneEx.containsKey('bad')) ...[
            Text(
              'Hindi Epektibo: ${phoneEx['bad']}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFB91C1C),
              ),
            ),
            const SizedBox(height: 4),
          ],
          if (phoneEx.containsKey('good')) ...[
            Text(
              'Mas Epektibo: ${phoneEx['good']}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF15803D),
              ),
            ),
            const SizedBox(height: 6),
          ],
          if (phoneEx.containsKey('situation')) ...[
            Text(
              'Sitwasyon: ${phoneEx['situation']}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                color: const Color(0xFF334155),
              ),
            ),
            const SizedBox(height: 4),
          ],
          if (phoneEx.containsKey('results')) ...[
            ...((phoneEx['results'] as List<String>).map(
              (r) => Text(
                '• $r',
                style: TextStyle(
                  fontSize: baseFontSize - 2,
                  color: const Color(0xFFB91C1C),
                ),
              ),
            )),
            const SizedBox(height: 4),
          ],
          if (phoneEx.containsKey('point')) ...[
            Text(
              'Mahalagang Punto: ${phoneEx['point']}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF64748B),
              ),
            ),
          ],
          if (phoneEx.containsKey('aral')) ...[
            Text(
              'Aral: ${phoneEx['aral']}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFC86D51),
              ),
            ),
          ],
        ],
      ),
    );
  }
}