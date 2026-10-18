class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa2TrueFalseData {
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText:
          'Ang kritikal na kasanayan sa komunikasyon ay nangangahulugang basta tanggapin ang lahat ng naririnig o nababasa.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Sa kritikal na pagbasa, mahalagang suriin ang pinagmulan at pananaw ng manunulat.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang relasyon ng mga kalahok ay maaaring makaapekto sa antas ng pormalidad at tono ng komunikasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Walang epekto ang katayuan ng isang tao sa paraan ng kaniyang pakikipag-usap.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang kulturang pinagmulan ng isang tao ay maaaring makaapekto sa kaniyang interpretasyon ng isang mensahe.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang paggamit ng "po" at "opo" ay halimbawa ng kaugalian sa kulturang Pilipino.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang bias ay maaari lamang makita sa mismong salita at hindi sa tono o paraan ng paghahatid.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang labeling ay pagbibigay ng positibo o negatibong tatak sa isang tao o bagay.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang generalisasyon ay pagbibigay ng pangkalahatang hatol nang walang sapat na batayan.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang black-and-white thinking ay isinasaalang-alang ang lahat ng posibleng nasa pagitan ng dalawang panig.',
      isTrue: false,
    ),
  ];
}