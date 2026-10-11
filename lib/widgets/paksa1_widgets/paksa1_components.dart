import 'package:flutter/material.dart';
import 'package:wikapp_beta/models/paksa1_model.dart';
import 'package:wikapp_beta/screens/activity_screen.dart';

// --- Existing Components ---

class SectionHeader extends StatelessWidget {
  final String title;
  final double baseFontSize;

  const SectionHeader({
    super.key,
    required this.title,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: baseFontSize + 4,
        fontWeight: FontWeight.w900,
        color: const Color(0xFF0F172A),
      ),
    );
  }
}

class HighlightBox extends StatelessWidget {
  final String text;
  final double baseFontSize;

  const HighlightBox({
    super.key,
    required this.text,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF08A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: baseFontSize - 1,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1E293B),
          height: 1.5,
        ),
      ),
    );
  }
}

class SubDetailBox extends StatelessWidget {
  final String label;
  final String value;
  final double fontSize;
  final Color bgColor;
  final Color textColor;

  const SubDetailBox({
    super.key,
    required this.label,
    required this.value,
    required this.fontSize,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: fontSize, color: textColor, height: 1.4),
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class ParaanCard extends StatelessWidget {
  final ParaanItem item;
  final double baseFontSize;

  const ParaanCard({
    super.key,
    required this.item,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
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
              color: Color(0xFFC86D51),
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
          if (item.badExample != null || item.goodExample != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF6EE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.badExample != null) ...[
                    Text(
                      '•  ${item.badExample!}',
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        color: const Color(0xFFEF4444),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  if (item.goodExample != null)
                    Text(
                      '✓  ${item.goodExample!}',
                      style: TextStyle(
                        fontSize: baseFontSize - 2,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF10B981),
                      ),
                    ),
                ],
              ),
            ),
          ],
          if (item.subExamples != null) ...[
            const SizedBox(height: 8),
            ...item.subExamples!.map(
              (sub) => Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '• $sub',
                  style: TextStyle(
                    fontSize: baseFontSize - 2,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ),
            ),
          ],
          if (item.dialogueText1 != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.dialogueRole1}: ${item.dialogueText1}',
                    style: TextStyle(
                      fontSize: baseFontSize - 2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.dialogueRole2}: ${item.dialogueText2}',
                    style: TextStyle(
                      fontSize: baseFontSize - 2,
                      color: const Color(0xFF475569),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (item.audienceContext != null) ...[
            const SizedBox(height: 6),
            Text(
              item.audienceContext!,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF94A3B8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  final String title;
  final String desc;
  final String example;
  final double baseFontSize;

  const CardTile({
    super.key,
    required this.title,
    required this.desc,
    required this.example,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFAF6EE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              example,
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFC86D51),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SalikCard extends StatelessWidget {
  final SalikItem salik;
  final double baseFontSize;

  const SalikCard({
    super.key,
    required this.salik,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
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
            '${salik.number}. ${salik.title}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            salik.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 10),
          SubDetailBox(
            label: 'Sitwasyon:',
            value: salik.sitwasyon,
            fontSize: baseFontSize - 2,
            bgColor: const Color(0xFFF1F5F9),
            textColor: const Color(0xFF1E293B),
          ),
          const SizedBox(height: 6),
          SubDetailBox(
            label: 'Pagpapakahulugan:',
            value: salik.pagpapakahulugan,
            fontSize: baseFontSize - 2,
            bgColor: const Color(0xFFFAF6EE),
            textColor: const Color(0xFF334155),
          ),
          const SizedBox(height: 6),
          Text(
            'Tukoy na Salik: ${salik.tukoyNaSalik}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC86D51),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF08A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Insight: ${salik.insight}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KahalagahanCard extends StatelessWidget {
  final KahalagahanItem item;
  final double baseFontSize;

  const KahalagahanCard({
    super.key,
    required this.item,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          const SizedBox(height: 4),
          Text(
            item.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 10),
          SubDetailBox(
            label: 'Sitwasyon:',
            value: item.sitwasyon,
            fontSize: baseFontSize - 2,
            bgColor: const Color(0xFFFAF6EE),
            textColor: const Color(0xFF1E293B),
          ),
          const SizedBox(height: 6),
          Text(
            item.detail,
            style: TextStyle(
              fontSize: baseFontSize - 2,
              color: const Color(0xFF64748B),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF08A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Insight: ${item.insight}',
              style: TextStyle(
                fontSize: baseFontSize - 2,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HudyatRowCard extends StatelessWidget {
  final HudyatRow row;
  final double baseFontSize;

  const HudyatRowCard({
    super.key,
    required this.row,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                row.uri,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5C8A0).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    row.halimbawa,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF92400E),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            row.pangungusap,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              fontStyle: FontStyle.italic,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}

class EstratehiyaCard extends StatelessWidget {
  final EstratehiyaItem item;
  final double baseFontSize;

  const EstratehiyaCard({
    super.key,
    required this.item,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
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
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.description,
            style: TextStyle(
              fontSize: baseFontSize - 1,
              color: const Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Halimbawa: ${item.halimbawa}',
            style: TextStyle(
              fontSize: baseFontSize - 2,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFC86D51),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom End-of-Lesson Action Options Card
class BottomActionOptions extends StatelessWidget {
  final VoidCallback? onFinishReview;
  final VoidCallback? onTakeQuiz;

  const BottomActionOptions({
    super.key,
    this.onFinishReview,
    this.onTakeQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF10B981),
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Natapos mo na ang aralin!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Pumili ng susunod mong hakbang para sa paksang ito:',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Finish Review Button
              Expanded(
                child: Material(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: onFinishReview ?? () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Finish Review',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // Take a Quiz Button
              Expanded(
                child: Material(
                  color: const Color(0xFFC86D51),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: onTakeQuiz ??
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ActivityScreen(),
                            ),
                          );
                        },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.quiz_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Take a Quiz',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}