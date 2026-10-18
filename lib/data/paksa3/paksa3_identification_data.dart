class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa3IdentificationData {
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText:
          'Anumang pasulat, pasalita, o biswal na naglalaman ng ideya, impormasyon, o mensahe.',
      acceptableAnswers: ['teksto', 'text'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng tekstong naglalayong maglahad ng malinaw at makatotohanang impormasyon o datos.',
      acceptableAnswers: ['impormatibo', 'tekstong impormatibo'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng tekstong nagbibigay ng malinaw na larawan ng tao, lugar, bagay, o pangyayari.',
      acceptableAnswers: ['deskriptibo', 'tekstong deskriptibo'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng tekstong nagsasalaysay ng mga pangyayari ayon sa maayos na pagkakasunod-sunod.',
      acceptableAnswers: ['naratibo', 'tekstong naratibo'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng tekstong nagbibigay ng malinaw na mga hakbang o proseso upang magawa nang tama ang isang gawain.',
      acceptableAnswers: ['prosidyural', 'tekstong prosidyural'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng tekstong naglalayong manghikayat o mangumbinsi sa mambabasa o tagapakinig.',
      acceptableAnswers: ['persweysib', 'tekstong persweysib'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng tekstong gumagamit ng lohikal na pangangatwiran at ebidensya upang suportahan ang isang pananaw.',
      acceptableAnswers: ['argumentatibo', 'tekstong argumentatibo'],
    ),
    IdentificationQuestionModel(
      questionText: 'Pagsusuri sa sariling gawa na nakatutulong sa metakognisyon.',
      acceptableAnswers: ['self-assessment', 'self assessment'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pagsusuri sa gawa ng isang kapwa mag-aaral gamit ang malinaw at tiyak na pamantayan.',
      acceptableAnswers: ['peer assessment', 'peer-assessment'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Tumutukoy sa maayos na pagkakasunod-sunod ng simula, gitna, at wakas ng isang teksto.',
      acceptableAnswers: [
        'estruktura at organisasyon',
        'estruktura',
        'organisasyon'
      ],
    ),
  ];
}