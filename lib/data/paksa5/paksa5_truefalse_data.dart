class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa5TrueFalseData {
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText:
          'Ang akademikong teksto ay karaniwang gumagamit ng pormal at lohikal na paraan ng paglalahad.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang personal na opinyon lamang ay sapat na upang maging kapani-paniwala ang isang akademikong argumento.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang abstrak ay dapat maglaman ng mahahalagang impormasyon tungkol sa layunin, metodolohiya, resulta, at kongklusyon ng pag-aaral.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText: 'Ang bionote ay karaniwang isinusulat sa unang panauhan.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang katitikan ng pulong ay nagsisilbing opisyal na rekord ng mahahalagang napag-usapan at napagpasyahan sa isang pulong.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang kongklusyon ay dapat lamang ulitin nang eksakto ang lahat ng ideyang nabanggit sa katawan ng teksto.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang kohesyon ay tumutukoy sa maayos na pagkakaugnay ng mga ideya at pangungusap sa isang teksto.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Maaaring gumamit ng balbal at sobrang kolokyal na salita sa akademikong pagsulat upang maging mas natural ang teksto.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang paraphrasing ay simpleng pagpapalit lamang ng ilang salita sa orihinal na teksto.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Kahit gumamit ng sariling pananalita sa paraphrasing, kailangan pa ring kilalanin ang orihinal na pinagmulan ng ideya.',
      isTrue: true,
    ),
  ];
}