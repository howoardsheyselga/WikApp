import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa8/paksa8_matching_data.dart';
import 'package:wikapp_beta/widgets/activity_widgets/answer_review_modal.dart';
import 'package:wikapp_beta/widgets/activity_widgets/quiz_result_screen.dart';

class Paksa8MatchingScreen extends StatefulWidget {
  const Paksa8MatchingScreen({super.key});

  @override
  State<Paksa8MatchingScreen> createState() => _Paksa8MatchingScreenState();
}

class _Paksa8MatchingScreenState extends State<Paksa8MatchingScreen> {
  // Map of Term ID -> Matched Option Key ('A'-'J')
  final Map<int, String> _userMatches = {};

  // Part 0 = Bahagi 1 (1-5), Part 1 = Bahagi 2 (6-10)
  int _currentPart = 0;

  // Option Carousel Page Controller
  final PageController _optionPageController = PageController();
  int _optionPageIndex = 0;

  @override
  void dispose() {
    _optionPageController.dispose();
    super.dispose();
  }

  void _assignMatch(int termId, String optionKey) {
    setState(() {
      _userMatches.removeWhere((key, value) => value == optionKey);
      _userMatches[termId] = optionKey;
    });
  }

  void _removeMatch(int termId) {
    setState(() {
      _userMatches.remove(termId);
    });
  }

  bool _isPartComplete(int partIndex) {
    final startId = partIndex * 5 + 1;
    final endId = startId + 4;
    for (int id = startId; id <= endId; id++) {
      if (!_userMatches.containsKey(id) || _userMatches[id]!.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _goToPreviousPart() {
    if (_currentPart > 0) {
      setState(() {
        _currentPart--;
      });
    }
  }

  void _handleNextPartOrFinish() {
    if (_currentPart == 0) {
      if (!_isPartComplete(0)) return;
      setState(() {
        _currentPart = 1;
      });
    } else {
      if (!_isPartComplete(1)) return;

      int score = 0;
      final List<QuizReviewItem> reviewItems = [];

      for (final termModel in Paksa8MatchingData.terms) {
        final userKey = _userMatches[termModel.id];
        final correctKey = termModel.correctOptionKey;
        final isCorrect = userKey == correctKey;

        if (isCorrect) score++;

        final userOption = Paksa8MatchingData.options.firstWhere(
          (o) => o.key == userKey,
          orElse: () => const MatchingOptionModel(key: '', description: ''),
        );

        final correctOption = Paksa8MatchingData.options.firstWhere(
          (o) => o.key == correctKey,
        );

        final String userAnsText = userKey != null && userKey.isNotEmpty
            ? '${userOption.key}. ${userOption.description}'
            : '(Walang sagot)';

        final String correctAnsText =
            '${correctOption.key}. ${correctOption.description}';

        reviewItems.add(
          QuizReviewItem(
            questionText: '${termModel.id}. ${termModel.term}',
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
            activityType: 'MATCHING TYPE',
            paksaTitle:
                'PAKSA 8: PANGUNAHING TUNTUNIN SA PAGSUSULAT NANG TEKSTONG PANTRABAHO',
            score: score,
            total: Paksa8MatchingData.terms.length,
            reviewItems: reviewItems,
            onRetry: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Paksa8MatchingScreen(),
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
    final currentTerms = Paksa8MatchingData.terms
        .sublist(_currentPart * 5, (_currentPart + 1) * 5);

    final double totalProgress = _currentPart == 0 ? 0.5 : 1.0;
    final bool canProceed = _isPartComplete(_currentPart);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () {
            if (_currentPart == 1) {
              _goToPreviousPart();
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: Row(
          children: [
            const Expanded(
              child: Text(
                'Matching Type',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Text(
              _currentPart == 0 ? 'Bahagi 1 (1-5)' : 'Bahagi 2 (6-10)',
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 14,
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
                value: totalProgress,
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFDF8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF2D2B2A),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDE8E1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                _currentPart == 0
                                    ? 'BAHAGI 1 NG 2 (1-5)'
                                    : 'BAHAGI 2 NG 2 (6-10)',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.8,
                                  color: Color(0xFFC86D51),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Panuto: I-drag ang tamang kahulugan mula sa Mga Pagpipilian sa ibaba at idrop sa tapat ng tamang termino.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                                height: 1.35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      ...currentTerms.map((termItem) {
                        final assignedKey = _userMatches[termItem.id];
                        final assignedOption =
                            assignedKey != null ? Paksa8MatchingData.options.firstWhere(
                                  (o) => o.key == assignedKey,
                                ) : null;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFDF8),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: const Color(0xFF2D2B2A),
                                      width: 1.8,
                                    ),
                                  ),
                                  child: Text(
                                    '${termItem.id}. ${termItem.term}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0F172A),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              Expanded(
                                flex: 5,
                                child: DragTarget<String>(
                                  onAcceptWithDetails: (details) {
                                    _assignMatch(termItem.id, details.data);
                                  },
                                  builder: (context, candidateData, rejectedData) {
                                    final bool isHovered =
                                        candidateData.isNotEmpty;

                                    if (assignedOption != null) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD0D7DE)
                                              .withValues(alpha: 0.6),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                            color: const Color(0xFF2D2B2A),
                                            width: 1.8,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${assignedOption.key}. ${assignedOption.description}',
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF0F172A),
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () =>
                                                  _removeMatch(termItem.id),
                                              child: const Padding(
                                                padding: EdgeInsets.only(left: 4),
                                                child: Icon(
                                                  Icons.close_rounded,
                                                  size: 16,
                                                  color: Color(0xFF1E293B),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isHovered
                                            ? const Color(0xFFFFEBD8)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: isHovered
                                              ? const Color(0xFFC86D51)
                                              : const Color(0xFF2D2B2A),
                                          width: 1.8,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'I-drag ang sagot dito...',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF64748B),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Mga Pagpipilian (A-J)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_optionPageIndex > 0) {
                                    _optionPageController.previousPage(
                                      duration: const Duration(milliseconds: 250),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: const Icon(
                                  Icons.chevron_left_rounded,
                                  size: 20,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                              Text(
                                ' ${_optionPageIndex + 1} / ${Paksa8MatchingData.options.length} ',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_optionPageIndex <
                                      Paksa8MatchingData.options.length - 1) {
                                    _optionPageController.nextPage(
                                      duration: const Duration(milliseconds: 250),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: const Icon(
                                  Icons.chevron_right_rounded,
                                  size: 20,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      SizedBox(
                        height: 82,
                        child: PageView.builder(
                          controller: _optionPageController,
                          itemCount: Paksa8MatchingData.options.length,
                          onPageChanged: (idx) {
                            setState(() => _optionPageIndex = idx);
                          },
                          itemBuilder: (context, idx) {
                            final option = Paksa8MatchingData.options[idx];
                            final bool isMatched =
                                _userMatches.containsValue(option.key);

                            return Draggable<String>(
                              data: option.key,
                              feedback: Material(
                                color: Colors.transparent,
                                child: Container(
                                  width: 240,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFEBD8),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: const Color(0xFFC86D51),
                                      width: 2,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '${option.key}. ${option.description}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0F172A),
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Opacity(
                                opacity: 0.4,
                                child: _buildOptionCard(option, isMatched),
                              ),
                              child: _buildOptionCard(option, isMatched),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              if (_optionPageIndex > 0) {
                                _optionPageController.previousPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            icon: const Icon(Icons.arrow_back_ios_rounded,
                                size: 12, color: Color(0xFF475569)),
                            label: const Text(
                              'Nakaraan',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(
                              Paksa8MatchingData.options.length,
                              (dotIdx) => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _optionPageIndex == dotIdx
                                      ? const Color(0xFFC86D51)
                                      : const Color(0xFFCBD5E1),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_optionPageIndex <
                                  Paksa8MatchingData.options.length - 1) {
                                _optionPageController.nextPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'Susunod',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    size: 12, color: Color(0xFF475569)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: canProceed
                            ? const Color(0xFFC86D51)
                            : const Color(0xFFCBD5E1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: canProceed ? _handleNextPartOrFinish : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPart == 0
                                ? 'Susunod (6-10)'
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

                  if (_currentPart == 1) ...[
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF2D2B2A),
                            width: 1.8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: _goToPreviousPart,
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          size: 18,
                          color: Color(0xFF0F172A),
                        ),
                        label: const Text(
                          'Bumalik sa Bahagi 1 (1-5)',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(MatchingOptionModel option, bool isMatched) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMatched
            ? const Color(0xFFE2E8F0)
            : const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isMatched
              ? const Color(0xFF94A3B8)
              : const Color(0xFF2D2B2A),
          width: 1.8,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.drag_indicator_rounded,
            color: Color(0xFF64748B),
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${option.key}. ${option.description}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isMatched
                    ? const Color(0xFF94A3B8)
                    : const Color(0xFF0F172A),
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}