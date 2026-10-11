class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa1TrueFalseData {
  // 10 Exact True or False items from GAWAIN_PAKSA 1 (Section C)
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText:
          'Ang komunikasyon ay simpleng pagpapalitan lamang ng salita o impormasyon.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang tagatanggap ay nagbibigay ng kahulugan sa mensaheng natanggap.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang feedback ay tumutukoy sa sagot o reaksyon ng tagatanggap.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang ingay sa komunikasyon ay maaaring pisikal, semantiko, o sikolohikal.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Dapat pareho lamang ang tono ng komunikasyon kahit magkaiba ang kausap at sitwasyon.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang denotasyon ay tumutukoy sa tuwiran o direktang kahulugan ng isang salita.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang personal na karanasan ng tagatanggap ay maaaring makaapekto sa kaniyang pagpapakahulugan.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang hudyat ay nakatutulong upang maiwasan ang kalituhan ng tagapakinig o mambabasa.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang pagbibigay-daan o turn-taking ay nangangahulugang isang tao lamang ang dapat magsalita sa buong talakayan.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang pagsang-ayon o pagtutol ay dapat ipahayag nang magalang at lohikal.',
      isTrue: true,
    ),
  ];
}