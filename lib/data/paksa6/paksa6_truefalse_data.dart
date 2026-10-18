class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa6TrueFalseData {
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText:
          'Ang teknikal na teksto ay dapat gumamit ng malinaw, tiyak, at obhetibong impormasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Pareho lamang dapat ang paraan ng pagsulat ng teknikal na teksto anuman ang antas ng kaalaman ng mambabasa.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang paggamit ng eksaktong sukat, bilang, at kondisyon ay nakatutulong upang maging mas tiyak ang teknikal na teksto.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang mga heading, subheading, at numbered steps ay maaaring makatulong sa organisasyon ng teknikal na dokumento.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang mga teknikal na termino ay hindi kailangang ipaliwanag kahit hindi pamilyar sa mga mambabasa.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang infographic ay maaaring gamitin upang ibuod ang mahaba o komplikadong impormasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang flowchart ay ang pinakaangkop na biswal para sa lahat ng uri ng numerical data.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang bawat elemento ng tekstong biswal ay dapat magkaroon ng malinaw na gamit o function.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Sapat nang gumamit ng red at green upang maipakita ang pagkakaiba ng impormasyon dahil lahat ng mambabasa ay madaling makakakita nito.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Kailangang suriin ang accuracy ng mga numero, labels, arrows, at steps bago gamitin ang isang teknikal na biswal.',
      isTrue: true,
    ),
  ];
}