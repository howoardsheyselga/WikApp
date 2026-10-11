class QuestionModel {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  const QuestionModel({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}