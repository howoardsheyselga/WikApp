import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa4/paksa4_data.dart';
import 'package:wikapp_beta/database/lesson_data.dart';
import 'package:wikapp_beta/models/lesson_models.dart';
import 'package:wikapp_beta/screens/dashboard.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/paksa1_components.dart';
import 'package:wikapp_beta/widgets/paksa1_widgets/reading_guard_wrapper.dart';

class Paksa4Screen extends StatefulWidget {
  final LessonData lesson;

  const Paksa4Screen({super.key, required this.lesson});

  @override
  State<Paksa4Screen> createState() => _Paksa4ScreenState();
}

class _Paksa4ScreenState extends State<Paksa4Screen> {
  bool isBookmarked = false;
  double fontSizeMultiplier = 1.0;
  late double _readingProgress;

  @override
  void initState() {
    super.initState();
    _readingProgress = widget.lesson.progress;
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
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
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
        onProgressUpdated: (newProgress) {
          setState(() {
            _readingProgress = newProgress;
          });
          updateLessonProgress(widget.lesson.id, newProgress);
        },
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
                    'assets/images/paksa4_header.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.diversity_3_rounded,
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
                Paksa4Data.mainHeader,
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
                Paksa4Data.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 20),

              // Intro Text Paragraph
              Text(
                Paksa4Data.introBody,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 20),

              // Section: INGKLUSIBO AT ETIKAL NA DISKURSO (Depinisyon)
              SectionHeader(
                title: 'INGKLUSIBO AT ETIKAL NA DISKURSO',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 12),
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
                      'Depinisyon:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC86D51),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF334155),
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Ingklusibo - ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          TextSpan(text: Paksa4Data.ingklusiboDef),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF334155),
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Etikal - ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          TextSpan(text: Paksa4Data.etikalDef),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Section 1: 5 Pundasyon ng Ingklusibo at Etikal na Diskurso
              SectionHeader(
                title: 'Mga Pundasyon ng Ingklusibo at Etikal na Diskurso',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa4Data.pundasyonIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa4Data.pundasyonList.map(
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

              // Section 2: Mga Halimbawa ng Etikal at Ingklusibong Paggamit ng Wika
              SectionHeader(
                title: 'Mga Halimbawa ng Etikal at Ingklusibong Paggamit ng Wika',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa4Data.comparisonList.map(
                (item) => _buildComparisonCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 3: Mga Prinsipyo sa Wika
              SectionHeader(
                title: 'Mga Prinsipyo sa Wika: Paano Maging Ingklusibo',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa4Data.prinsipyoIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa4Data.prinsipyoList.map(
                (item) => _buildPrinsipyoCard(item, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 4: Pamamaraan sa Etikal na Pakikipag-usap
              SectionHeader(
                title: 'Pamamaraan sa Etikal na Pakikipag-usap',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 14),
              ...Paksa4Data.pamamaraanList.map(
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
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC86D51),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['desc']!,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.45,
                        ),
                      ),
                      if (item.containsKey('example')) ...[
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAF6EE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            item['example']!,
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
                ),
              ),
              const SizedBox(height: 28),

              // Section 5: Mga Hudyat
              SectionHeader(
                title: 'MGA HUDYAT PARA SA INGKLUSIBO AT ETIKAL NA KOMUNIKASYON',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa4Data.hudyatIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa4Data.hudyatList.map(
                (hudyat) => _buildHudyatCard(hudyat, baseFontSize),
              ),
              const SizedBox(height: 28),

              // Section 6: Mga Salita at Pariralang Dapat Iwasan
              SectionHeader(
                title: 'Mga Salita at Pariralang Dapat Iwasan',
                baseFontSize: baseFontSize,
              ),
              const SizedBox(height: 8),
              Text(
                Paksa4Data.iwasanIntro,
                style: TextStyle(
                  fontSize: baseFontSize,
                  height: 1.6,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 14),
              ...Paksa4Data.iwasanList.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFEF4444).withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB91C1C),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['desc'] as String,
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: const Color(0xFF475569),
                          height: 1.4,
                        ),
                      ),
                      if (item.containsKey('items')) ...[
                        const SizedBox(height: 8),
                        ...((item['items'] as List<String>).map(
                          (subItem) => Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 4),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.cancel_outlined,
                                  size: 14,
                                  color: Color(0xFFB91C1C),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  subItem,
                                  style: TextStyle(
                                    fontSize: baseFontSize - 1,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFB91C1C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                      if (item.containsKey('example')) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF2F2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            item['example'] as String,
                            style: TextStyle(
                              fontSize: baseFontSize - 2,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xFF991B1B),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Final Summary Card (Paragraph from the document footer)
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  Paksa4Data.conclusionBody,
                  style: TextStyle(
                    fontSize: baseFontSize - 1,
                    height: 1.6,
                    color: const Color(0xFFF1F5F9),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Bottom Action Options (Finish Review / Take a Quiz)
              BottomActionOptions(
                onFinishReview: () {
                  updateLessonProgress(widget.lesson.id, 1.0);
                  Navigator.pop(context);
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

  Widget _buildComparisonCard(SampleComparisonItem item, double baseFontSize) {
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
            '${item.number}. ${item.title}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 12),

          // Comparison Box: Hindi Etikal vs Etikal
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF2F2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFFCA5A5).withValues(alpha: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hindi Etikal o Ingklusibo:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB91C1C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.badExample,
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    color: const Color(0xFF7F1D1D),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF86EFAC).withValues(alpha: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Etikal at Ingklusibong Paggamit:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF15803D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.goodExample,
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    color: const Color(0xFF14532D),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.explanation,
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF166534),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrinsipyoCard(PrinsipyoItem item, double baseFontSize) {
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
            '${item.number}. ${item.title}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
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
          if (item.avoidExample != null || item.preferredExample != null) ...[
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
                  if (item.avoidExample != null) ...[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          color: const Color(0xFF334155),
                          height: 1.4,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Iwasan:\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB91C1C),
                            ),
                          ),
                          TextSpan(text: item.avoidExample),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                  if (item.preferredExample != null) ...[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: baseFontSize - 2,
                          color: const Color(0xFF334155),
                          height: 1.4,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Mas Angkop:\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF15803D),
                            ),
                          ),
                          TextSpan(text: item.preferredExample),
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
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHudyatCard(HudyatItem hudyat, double baseFontSize) {
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
            '${hudyat.number}. ${hudyat.title}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            hudyat.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),

          // Example Box
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
                if (hudyat.subExamples1 != null) ...[
                  Text(
                    hudyat.subLabel1 ?? 'Pagkilala:',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC86D51),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...hudyat.subExamples1!.map(
                    (ex) => Text(
                      '• $ex',
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        color: const Color(0xFF334155),
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                if (hudyat.subExamples2 != null) ...[
                  Text(
                    hudyat.subLabel2 ?? 'Magalang na Pagtutol:',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC86D51),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...hudyat.subExamples2!.map(
                    (ex) => Text(
                      '• $ex',
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        color: const Color(0xFF334155),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
                if (hudyat.mainExamples != null) ...[
                  const Text(
                    'Halimbawa:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC86D51),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...hudyat.mainExamples!.map(
                    (ex) => Text(
                      '• $ex',
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        color: const Color(0xFF334155),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}