class FlashcardItem {
  final String question;
  final String answer;
  final String category;

  const FlashcardItem({
    required this.question,
    required this.answer,
    this.category = 'Paksa 1',
  });
}