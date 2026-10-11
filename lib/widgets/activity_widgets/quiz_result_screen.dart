import 'package:flutter/material.dart';
import 'package:wikapp_beta/widgets/activity_widgets/answer_review_modal.dart';
import 'package:wikapp_beta/widgets/home_page_widget/dashboard_header.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRetry;
  final List<QuizReviewItem>? reviewItems; // Optional detailed review list

  const QuizResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.onRetry,
    this.reviewItems,
  });

  void _showReviewModal(BuildContext context) {
    if (reviewItems == null || reviewItems!.isEmpty) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AnswerReviewModal(
        reviewItems: reviewItems!,
        score: score,
        total: total,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPassing = score >= (total / 2);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DashboardHeader(),
              const SizedBox(height: 32),

              // Dynamic Illustration
              SizedBox(
                height: 180,
                child: Image.asset(
                  isPassing
                      ? 'assets/images/trophy.png'
                      : 'assets/images/book_sad.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    isPassing
                        ? Icons.emoji_events_rounded
                        : Icons.menu_book_rounded,
                    size: 120,
                    color: const Color(0xFFC86D51),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title & Subtitle
              Text(
                isPassing ? 'Pagbati! Tapos na!' : 'Kaya mo \'yan!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                isPassing
                    ? 'Mahusay ang iyong naging pagsasanay!'
                    : 'May pagkakataon pa para bumawi at mag-aral muli.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF475569),
                ),
              ),
              const SizedBox(height: 32),

              // Main Score Card
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFDF8),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF2D2B2A), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'ANG IYONG ISKOR',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$score / $total',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0F172A),
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'TAMA',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF475569),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Correct / Incorrect Feedback Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isPassing
                              ? Icons.check_circle_rounded
                              : Icons.error_rounded,
                          size: 16,
                          color: isPassing
                              ? const Color(0xFF16A34A)
                              : const Color(0xFFDC2626),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isPassing
                              ? 'Kahanga-hanga!'
                              : 'Kailangan pa ng kaunting pagsasanay',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Stars Section
                    const Text(
                      'MGA BITUING NAKUHA',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isPassing
                            ? const Color(0xFFFFEBD8)
                            : const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isPassing
                                ? 'Nakuhang Bituin: +15 '
                                : 'Walang Nakuhang Bituin (0 ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: isPassing
                                  ? const Color(0xFF92400E)
                                  : const Color(0xFF475569),
                            ),
                          ),
                          Icon(
                            isPassing
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: isPassing
                                ? const Color(0xFFF59E0B)
                                : const Color(0xFF64748B),
                            size: 18,
                          ),
                          if (!isPassing)
                            const Text(
                              ')',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF475569),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    if (isPassing)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF475569),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '+1 sa Streak (6 Araw! 🔥)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else
                      const Text(
                        'bawi tayo sa susunod! (Tuloy pa rin ang Streak!) 🔥',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF475569),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // View Answer Breakdown Button (If review items are present)
              if (reviewItems != null && reviewItems!.isNotEmpty) ...[
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFDF8),
                      side: const BorderSide(
                        color: Color(0xFF2D2B2A),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () => _showReviewModal(context),
                    icon: const Icon(
                      Icons.fact_check_outlined,
                      color: Color(0xFFC86D51),
                      size: 20,
                    ),
                    label: const Text(
                      'Suriin ang mga Sagot',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // Primary Action Buttons based on Pass/Fail
              if (isPassing) ...[
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC86D51),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bumalik sa Mga Aktibidad',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: onRetry,
                    child: const Text(
                      'Subukan Muli',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC86D51),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: onRetry,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Subukan Muli',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE2E8F0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Bumalik sa Mga Aktibidad',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}