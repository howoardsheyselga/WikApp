import 'package:flutter/material.dart';
import '../../models/quiz_history_model.dart';
import '../activity_widgets/answer_review_modal.dart';

class HistoryActivityCard extends StatelessWidget {
  final QuizHistoryModel record;

  const HistoryActivityCard({super.key, required this.record});

  String _formatTime(DateTime timestamp) {
    final hour = timestamp.hour > 12
        ? timestamp.hour - 12
        : (timestamp.hour == 0 ? 12 : timestamp.hour);
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final period = timestamp.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  void _showAnswerReviewModal(BuildContext context) {
    if (record.reviewItems.isEmpty) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AnswerReviewModal(
        reviewItems: record.reviewItems,
        score: record.score,
        total: record.totalQuestions,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color cardBgColor = const Color(0xFFDE7B59);
    String imageAsset = 'assets/images/identification_icon.png';
    IconData fallbackIcon = Icons.edit_note_rounded;
    String description = 'Isulat ang tamang sagot sa patlang.';

    final typeLower = record.activityType.toLowerCase();
    if (typeLower.contains('multiple')) {
      cardBgColor = const Color(0xFF1E2B37);
      imageAsset = 'assets/images/multiplechoice.png';
      fallbackIcon = Icons.check_circle_outline_rounded;
      description = 'Piliin ang pinakatamang sagot.';
    } else if (typeLower.contains('tama') || typeLower.contains('true')) {
      cardBgColor = const Color(0xFF98D9B6);
      imageAsset = 'assets/images/truefalse_icon.png';
      fallbackIcon = Icons.thumbs_up_down_outlined;
      description = 'Tukuyin kung tama o mali ang pahayag.';
    } else if (typeLower.contains('tambal') || typeLower.contains('matching')) {
      cardBgColor = const Color(0xFF9A91E8);
      imageAsset = 'assets/images/matching.png';
      fallbackIcon = Icons.extension_outlined;
      description = 'Ikonekta ang magkakaugnay na sagot.';
    } else if (typeLower.contains('tukoy') || typeLower.contains('identification')) {
      cardBgColor = const Color(0xFFDE7B59);
      imageAsset = 'assets/images/identification_icon.png';
      fallbackIcon = Icons.edit_note_rounded;
      description = 'Isulat ang tamang sagot sa patlang.';
    }

    final timeString = _formatTime(record.timestamp);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => _showAnswerReviewModal(context),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Activity Thumbnail Box with Asset + Fallback Icon
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cardBgColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      fallbackIcon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Activity Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Natapos ang Pagsasanay:\n${record.activityType}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Iskor: ${record.score}/${record.totalQuestions} • $timeString',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF94A3B8),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}