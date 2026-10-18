import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa8/paksa8_data.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/database/lesson_database.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/dashboard.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/paksa1_components.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/reading_guard_wrapper.dart';

class Paksa8Screen extends StatefulWidget {
  final LessonData lesson;

  const Paksa8Screen({super.key, required this.lesson});

  @override
  State<Paksa8Screen> createState() => _Paksa8ScreenState();
}

class _Paksa8ScreenState extends State<Paksa8Screen> {
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
              // Banner Header
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
                    'assets/images/paksa8_header.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.edit_note_rounded,
                          size: 70,
                          color: Color(0xFFC86D51),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title Headers
              const Text(
                Paksa8Data.mainHeader,
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
                Paksa8Data.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 20),

              // Intro Text Paragraph
              Text(
                Paksa8Data.introBody,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 28),

              // Section 1: Pangunahing Tuntunin at Katangian
              SectionHeader(
                title: 'PANGUNAHING TUNTUNIN SA PAGSULAT NG TEKSTONG PANTRABAHO',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa8Data.tuntuninIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              // 4 Katangian List
              ...Paksa8Data.katangianList.map(
                (item) => _buildKatangianCard(item, baseFontSize),
              ),
              const SizedBox(height: 24),

              // Section 2: Dos and Don'ts
              SectionHeader(
                title: 'MGA DAPAT AT HINDI DAPAT GAWIN (DOS & DON\'TS)',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),

              // Dos
              const Text(
                'Mga Dapat Gawin (Dos)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15803D),
                ),
              ),
              const SizedBox(height: 8),
              ...Paksa8Data.dosList.map(
                (item) => _buildDosDontCard(item, isDo: true, baseFontSize: baseFontSize),
              ),
              const SizedBox(height: 18),

              // Don'ts
              const Text(
                'Mga Hindi Dapat Gawin (Don\'ts)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB91C1C),
                ),
              ),
              const SizedBox(height: 8),
              ...Paksa8Data.dontsList.map(
                (item) => _buildDosDontCard(item, isDo: false, baseFontSize: baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 3: Propesyonal na Dokumento sa Trabaho
              SectionHeader(
                title: 'PROPESYONAL NA DOKUMENTO SA TRABAHO',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa8Data.docsIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 16),

              // Document Cards
              ...Paksa8Data.documentsList.map(
                (doc) => _buildDocumentCard(doc, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section Synthesis Container
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
                        Icon(Icons.description_rounded, color: Color(0xFFE5C8A0), size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'BUOD NG ARALIN',
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
                      Paksa8Data.conclusionSynthesis,
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

              // Bottom Action Buttons
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
                          text: 'Mas Tiyak: ',
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

  Widget _buildDosDontCard(
    DosDontsItem item, {
    required bool isDo,
    required double baseFontSize,
  }) {
    final Color titleColor = isDo ? const Color(0xFF15803D) : const Color(0xFFB91C1C);
    final Color bgColor = isDo ? const Color(0xFFF0FDF4) : const Color(0xFFFEF2F2);

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
          Row(
            children: [
              Icon(
                isDo ? Icons.check_circle_rounded : Icons.cancel_rounded,
                color: titleColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${item.number}. ${item.title}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
              ),
            ],
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
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Halimbawa: ${item.example}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(WorkDocumentItem doc, double baseFontSize) {
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
            '${doc.number}. ${doc.title}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            doc.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 12),

          if (doc.templateData != null) ...[
            _buildTemplatePreview(doc, baseFontSize),
          ] else ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF6EE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Halimbawa:\n"${doc.example}"',
                style: TextStyle(
                  fontSize: baseFontSize - 2,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF334155),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTemplatePreview(WorkDocumentItem doc, double baseFontSize) {
    final data = doc.templateData!;

    if (doc.number == 2) {
      // Resume Preview
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF6EE),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                data['name'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
            Center(
              child: Text(
                '${data['address']}\n${data['contact']}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ),
            const Divider(height: 16, thickness: 1),
            const Text(
              'EDUKASYON',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC86D51),
              ),
            ),
            ...((data['education'] as List<String>).map(
              (ed) => Text(
                '• $ed',
                style: TextStyle(fontSize: baseFontSize - 2, color: const Color(0xFF334155)),
              ),
            )),
            const SizedBox(height: 8),
            const Text(
              'MGA KASANAYAN',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC86D51),
              ),
            ),
            ...((data['skills'] as List<String>).map(
              (sk) => Text(
                '• $sk',
                style: TextStyle(fontSize: baseFontSize - 2, color: const Color(0xFF334155)),
              ),
            )),
            const SizedBox(height: 8),
            const Text(
              'MGA GAWAIN AT ORGANISASYON',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC86D51),
              ),
            ),
            ...((data['organizations'] as List<String>).map(
              (org) => Text(
                '• $org',
                style: TextStyle(fontSize: baseFontSize - 2, color: const Color(0xFF334155)),
              ),
            )),
          ],
        ),
      );
    } else if (doc.number == 3) {
      // Application Letter Preview
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF6EE),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['date'] as String,
              style: TextStyle(fontSize: baseFontSize - 2, color: const Color(0xFF64748B)),
            ),
            const SizedBox(height: 6),
            Text(
              data['recipient'] as String,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data['salutation'] as String,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              data['body'] as String,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                color: const Color(0xFF334155),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${data['closing']}\n${data['sender']}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      );
    } else if (doc.number == 4) {
      // Email Preview
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF6EE),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To: ${data['to']}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
              ),
            ),
            Text(
              'Subject: ${data['subject']}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC86D51),
              ),
            ),
            const Divider(height: 12, thickness: 1),
            Text(
              data['body'] as String,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                color: const Color(0xFF334155),
                height: 1.4,
              ),
            ),
          ],
        ),
      );
    } else if (doc.number == 5) {
      // Minutes of the Meeting Preview
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF6EE),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                data['title'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Petsa: ${data['date']} | Oras: ${data['time']}\nLugar: ${data['place']}',
              style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 6),
            Text(
              'Mga Dumalo: ${data['attendees']}',
              style: TextStyle(fontSize: baseFontSize - 2, color: const Color(0xFF334155)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mga Adyenda:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC86D51),
              ),
            ),
            ...((data['agendas'] as List<String>).map(
              (ag) => Text(
                '• $ag',
                style: TextStyle(fontSize: baseFontSize - 2, color: const Color(0xFF334155)),
              ),
            )),
            const SizedBox(height: 8),
            const Text(
              'Mga Napagkasunduan:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC86D51),
              ),
            ),
            ...((data['agreements'] as List<String>).map(
              (agr) => Text(
                '• $agr',
                style: TextStyle(fontSize: baseFontSize - 2, color: const Color(0xFF334155)),
              ),
            )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Inihanda ni:\n${data['preparedBy']}',
                    style: TextStyle(fontSize: baseFontSize - 3, color: const Color(0xFF64748B)),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Pinagtibay ni:\n${data['approvedBy']}',
                    style: TextStyle(fontSize: baseFontSize - 3, color: const Color(0xFF64748B)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return const SizedBox();
  }
}