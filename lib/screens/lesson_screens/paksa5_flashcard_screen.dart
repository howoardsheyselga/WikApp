import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wikapp_beta/data/paksa5/paksa5_flashcard_data.dart';
import 'package:wikapp_beta/models/paksa1_flashcard_model.dart';

class Paksa5FlashcardScreen extends StatefulWidget {
  const Paksa5FlashcardScreen({super.key});

  @override
  State<Paksa5FlashcardScreen> createState() => _Paksa5FlashcardScreenState();
}

class _Paksa5FlashcardScreenState extends State<Paksa5FlashcardScreen>
    with SingleTickerProviderStateMixin {
  final List<FlashcardItem> _flashcards = Paksa5FlashcardData.flashcards;

  int _currentIndex = 0;
  bool _showAnswer = false;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  // Drag / Swipe State
  Offset _dragOffset = Offset.zero;
  static const double _swipeThreshold = 100.0;

  final List<int> _reviewList = [];
  final List<int> _masteredList = [];

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_showAnswer) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_dragOffset.dx > _swipeThreshold) {
      // Swiped Right -> Mastered
      _nextCard(true);
    } else if (_dragOffset.dx < -_swipeThreshold) {
      // Swiped Left -> Review
      _nextCard(false);
    } else {
      // Reset position if threshold wasn't met
      setState(() {
        _dragOffset = Offset.zero;
      });
    }
  }

  void _nextCard(bool isMastered) {
    if (isMastered) {
      _masteredList.add(_currentIndex);
    } else {
      _reviewList.add(_currentIndex);
    }

    if (_currentIndex < _flashcards.length - 1) {
      if (_showAnswer) {
        _flipController.reverse();
        _showAnswer = false;
      }
      setState(() {
        _currentIndex++;
        _dragOffset = Offset.zero;
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _resetDeck() {
    setState(() {
      _currentIndex = 0;
      _showAnswer = false;
      _dragOffset = Offset.zero;
      _reviewList.clear();
      _masteredList.clear();
      _flipController.reset();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFAF6EE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFF2D2B2A), width: 2),
        ),
        title: const Text(
          'Tapos na ang Review!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Narebyu mo na ang lahat ng ${_flashcards.length} na flashcard sa Paksa 5.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatChip(
                  label: 'Alam na',
                  count: _masteredList.length,
                  color: const Color(0xFFC86D51),
                ),
                _buildStatChip(
                  label: 'Babalikan',
                  count: _reviewList.length,
                  color: const Color(0xFF78716C),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetDeck();
            },
            child: const Text(
              'Ulitin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFC86D51),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC86D51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'Bumalik sa Aralin',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip({
    required String label,
    required int count,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentCard = _flashcards[_currentIndex];
    final double progress = (_currentIndex + 1) / _flashcards.length;
    final double dragRotation = _dragOffset.dx * 0.0008;

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
                'Paksa 5: Flashcards',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${_currentIndex + 1}/${_flashcards.length}',
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
              const SizedBox(height: 12),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: _flipCard,
                    onPanUpdate: _onPanUpdate,
                    onPanEnd: _onPanEnd,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Card Shadow 2 (Bottom)
                        Transform.translate(
                          offset: const Offset(-8, 16),
                          child: Transform.rotate(
                            angle: -0.05,
                            child: _buildCardShadow(
                              color: const Color(0xFFEBD8B8),
                            ),
                          ),
                        ),

                        // Card Shadow 1 (Middle)
                        Transform.translate(
                          offset: const Offset(6, 10),
                          child: Transform.rotate(
                            angle: 0.03,
                            child: _buildCardShadow(
                              color: const Color(0xFFF3E5D0),
                            ),
                          ),
                        ),

                        // Active Interactive Card
                        Transform.translate(
                          offset: _dragOffset,
                          child: Transform.rotate(
                            angle: dragRotation,
                            child: Stack(
                              children: [
                                AnimatedBuilder(
                                  animation: _flipAnimation,
                                  builder: (context, child) {
                                    final angle = _flipAnimation.value * pi;
                                    final isFront = angle < (pi / 2);

                                    return Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateY(angle),
                                      alignment: Alignment.center,
                                      child: isFront
                                          ? _buildCardFront(currentCard)
                                          : Transform(
                                              transform: Matrix4.identity()
                                                ..rotateY(pi),
                                              alignment: Alignment.center,
                                              child:
                                                  _buildCardBack(currentCard),
                                            ),
                                    );
                                  },
                                ),

                                // Drag Badges
                                if (_dragOffset.dx > 20)
                                  Positioned(
                                    top: 24,
                                    left: 24,
                                    child: Transform.rotate(
                                      angle: -0.2,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF15803D),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: const Text(
                                          'ALAM KO NA',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (_dragOffset.dx < -20)
                                  Positioned(
                                    top: 24,
                                    right: 24,
                                    child: Transform.rotate(
                                      angle: 0.2,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFB45309),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: const Text(
                                          'BALIKAN',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFE2DACD),
                          side: const BorderSide(
                            color: Color(0xFF2D2B2A),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () => _nextCard(false),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Color(0xFF2D2B2A),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Mahirap /\nBalikan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D2B2A),
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC86D51),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(
                              color: Color(0xFF2D2B2A),
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed: () => _nextCard(true),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.white, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Madali /\nAlam ko na',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardShadow({required Color color}) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 460),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF2D2B2A), width: 2),
      ),
    );
  }

  Widget _buildCardFront(FlashcardItem card) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 460),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF2D2B2A), width: 2.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFDE8E1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'TANONG',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
                color: Color(0xFFC86D51),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              card.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                height: 1.3,
              ),
            ),
          ),
          const Column(
            children: [
              Icon(
                Icons.refresh_rounded,
                size: 32,
                color: Color(0xFF1E293B),
              ),
              SizedBox(height: 4),
              Text(
                'I-tap para makita ang sagot',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardBack(FlashcardItem card) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 460),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFC86D51), width: 2.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFC86D51),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'SAGOT',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  card.answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155),
                    height: 1.45,
                  ),
                ),
              ),
            ),
          ),
          const Column(
            children: [
              Icon(
                Icons.refresh_rounded,
                size: 28,
                color: Color(0xFFC86D51),
              ),
              SizedBox(height: 2),
              Text(
                'I-tap para bumalik sa tanong',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}