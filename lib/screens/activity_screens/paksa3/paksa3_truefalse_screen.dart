import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa3/paksa3_truefalse_data.dart';
import 'package:wikapp_beta/widgets/activity_widgets/answer_review_modal.dart';
import 'package:wikapp_beta/widgets/activity_widgets/quiz_result_screen.dart';

class Paksa3TrueFalseScreen extends StatefulWidget {
  const Paksa3TrueFalseScreen({super.key});

  @override
  State<Paksa3TrueFalseScreen> createState() => _Paksa3TrueFalseScreenState();
}

class _Paksa3TrueFalseScreenState extends State<Paksa3TrueFalseScreen> {
  int _currentQuestionIndex = 0;
  late List<TrueFalseQuestionModel> _shuffledQuestions;
  late List<bool?> _userAnswers; // true = Tama, false = Mali, null = Unselected

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  void _initializeQuiz() {
    _shuffledQuestions = List.from(Paksa3TrueFalseData.questions)..shuffle();
    _userAnswers = List.filled(_shuffledQuestions.length, null);
    _currentQuestionIndex = 0;
  }

  void _handlePrevious() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _handleNext() {
    if (_userAnswers[_currentQuestionIndex] == null) return;

    if (_currentQuestionIndex < _shuffledQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      int finalScore = 0;
      final List<QuizReviewItem> reviewItems = [];

      for (int i = 0; i < _shuffledQuestions.length; i++) {
        final q = _shuffledQuestions[i];
        final userAnsBool = _userAnswers[i];
        final isCorrect = userAnsBool == q.isTrue;

        if (isCorrect) {
          finalScore++;
        }

        final String userAnsText = userAnsBool == null
            ? '(Walang sagot)'
            : (userAnsBool ? 'Tama' : 'Mali');
        final String correctAnsText = q.isTrue ? 'Tama' : 'Mali';

        reviewItems.add(
          QuizReviewItem(
            questionText: q.questionText,
            userAnswer: userAnsText,
            correctAnswer: correctAnsText,
            isCorrect: isCorrect,
          ),
        );
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            activityType: 'TAMA O MALI',
            paksaTitle: 'PAKSA 3: URI NG TEKSTO',
            score: finalScore,
            total: _shuffledQuestions.length,
            reviewItems: reviewItems,
            onRetry: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Paksa3TrueFalseScreen(),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _shuffledQuestions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _shuffledQuestions.length;
    final selectedAnswer = _userAnswers[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const Expanded(
              child: Text(
                'Tama o Mali',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Text(
              '${_currentQuestionIndex + 1}/${_shuffledQuestions.length}',
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF1E293B)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: const Color(0xFFE2E8F0),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFFC86D51),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFDF8),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: const Color(0xFF2D2B2A),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDE8E1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'TANONG ${_currentQuestionIndex + 1} NG ${_shuffledQuestions.length}',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.8,
                                  color: Color(0xFFC86D51),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    currentQuestion.questionText,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF0F172A),
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFDE8E1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/chat_bubbles.png',
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                      Icons.chat_bubble_outline_rounded,
                                      color: Color(0xFFC86D51),
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildOptionCard(
                        letter: 'A',
                        label: 'Tama',
                        isSelected: selectedAnswer == true,
                        onTap: () {
                          setState(() {
                            _userAnswers[_currentQuestionIndex] = true;
                          });
                        },
                      ),
                      const SizedBox(height: 12),

                      _buildOptionCard(
                        letter: 'B',
                        label: 'Mali',
                        isSelected: selectedAnswer == false,
                        onTap: () {
                          setState(() {
                            _userAnswers[_currentQuestionIndex] = false;
                          });
                        },
                      ),
                      const SizedBox(height: 10),

                      const Center(
                        child: Text(
                          'Pumili ng iyong sagot para magpatuloy.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Actions (Nakaraan & Susunod)
              Row(
                children: [
                  if (_currentQuestionIndex > 0) ...[
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 54,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFF2D2B2A),
                              width: 1.8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: _handlePrevious,
                          child: const Text(
                            'Nakaraan',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedAnswer == null
                              ? const Color(0xFFCBD5E1)
                              : const Color(0xFFC86D51),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: selectedAnswer == null ? null : _handleNext,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentQuestionIndex <
                                      _shuffledQuestions.length - 1
                                  ? 'Isumite ang Sagot'
                                  : 'Tapusin at Suriin',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String letter,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: isSelected ? const Color(0xFFFFEBD8) : const Color(0xFFFFFDF8),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFC86D51)
                  : const Color(0xFF2D2B2A),
              width: isSelected ? 2.2 : 1.8,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFFDE8E1) : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFC86D51)
                        : const Color(0xFF2D2B2A),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: isSelected
                      ? const Icon(
                          Icons.check_rounded,
                          size: 18,
                          color: Color(0xFFC86D51),
                        )
                      : Text(
                          letter,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 14),

              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}