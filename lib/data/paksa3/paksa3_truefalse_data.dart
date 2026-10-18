class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa3TrueFalseData {
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText: 'Ang teksto ay maaari lamang maging pasulat.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang talumpati, panayam, debate, at dayalogo ay maaaring ituring na pasalitang teksto.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang tekstong impormatibo ay pangunahing naglalayong magbigay ng impormasyon at datos.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang tekstong naratibo ay nakatuon sa pagsasalaysay ng mga pangyayari ayon sa pagkakasunod-sunod.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText: 'Ang recipe ay halimbawa ng tekstong prosidyural.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang tekstong argumentatibo ay hindi nangangailangan ng lohikal na pangangatwiran o ebidensya.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang tekstong propesyonal ay ginagamit sa mga pormal at opisyal na sitwasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText: 'Ang peer assessment ay pagsusuri lamang sa sariling gawa.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Mahalaga sa isang teksto ang paggamit ng wikang angkop sa audience, layunin, at antas ng pormalidad.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Sa pagtanggap ng feedback, sapat nang marinig ito at hindi na kailangang pag-isipan o gamitin.',
      isTrue: false,
    ),
  ];
}