import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa8/paksa8_identification_data.dart';
import 'package:wikapp_beta/widgets/activity_widgets/answer_review_modal.dart';
import 'package:wikapp_beta/widgets/activity_widgets/quiz_result_screen.dart';

class Paksa8IdentificationScreen extends StatefulWidget {
  const Paksa8IdentificationScreen({super.key});

  @override
  State<Paksa8IdentificationScreen> createState() =>
      _Paksa8IdentificationScreenState();
}

class _Paksa8IdentificationScreenState
    extends State<Paksa8IdentificationScreen> {
  int _currentQuestionIndex = 0;
  late List<IdentificationQuestionModel> _shuffledQuestions;
  late List<String> _userAnswers;
  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  void _initializeQuiz() {
    _shuffledQuestions = List.from(Paksa8IdentificationData.questions)
      ..shuffle();
    _userAnswers = List.filled(_shuffledQuestions.length, '');
    _currentQuestionIndex = 0;
    _answerController.clear();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void _handlePrevious() {
    if (_currentQuestionIndex > 0) {
      _userAnswers[_currentQuestionIndex] = _answerController.text.trim();

      setState(() {
        _currentQuestionIndex--;
        _answerController.text = _userAnswers[_currentQuestionIndex];
      });
    }
  }

  void _handleNext() {
    final currentInput = _answerController.text.trim();
    if (currentInput.isEmpty) return;

    _userAnswers[_currentQuestionIndex] = currentInput;

    if (_currentQuestionIndex < _shuffledQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _answerController.text = _userAnswers[_currentQuestionIndex];
      });
    } else {
      int finalScore = 0;
      final List<QuizReviewItem> reviewItems = [];

      for (int i = 0; i < _shuffledQuestions.length; i++) {
        final q = _shuffledQuestions[i];
        final userAnswer = _userAnswers[i].trim();
        final acceptable =
            q.acceptableAnswers.map((a) => a.trim().toLowerCase());
        final isCorrect = acceptable.contains(userAnswer.toLowerCase());

        if (isCorrect) {
          finalScore++;
        }

        reviewItems.add(
          QuizReviewItem(
            questionText: q.questionText,
            userAnswer: userAnswer,
            correctAnswer: q.acceptableAnswers.first,
            isCorrect: isCorrect,
          ),
        );
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            activityType: 'IDENTIFICATION',
            paksaTitle:
                'PAKSA 8: PANGUNAHING TUNTUNIN SA PAGSUSULAT NANG TEKSTONG PANTRABAHO',
            score: finalScore,
            total: _shuffledQuestions.length,
            reviewItems: reviewItems,
            onRetry: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Paksa8IdentificationScreen(),
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
                'Identipikasyon',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'assets/images/note_pencil.png',
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                      Icons.edit_note_rounded,
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
                      const SizedBox(height: 24),

                      const Text(
                        'Iyong Sagot',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 8),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFDF8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF2D2B2A),
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: _answerController,
                          maxLines: 4,
                          onChanged: (_) {
                            setState(() {});
                          },
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'I-type ang iyong sagot dito...',
                            hintStyle: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.all(16),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      const Center(
                        child: Text(
                          'Tiyaking tama ang baybay o ispeling ng iyong isusulat.',
                          textAlign: TextAlign.center,
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
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _answerController,
                builder: (context, value, child) {
                  final bool isInputValid = value.text.trim().isNotEmpty;

                  return Row(
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
                              backgroundColor: isInputValid
                                  ? const Color(0xFFC86D51)
                                  : const Color(0xFFCBD5E1),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: isInputValid ? _handleNext : null,
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}