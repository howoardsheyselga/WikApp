class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa7IdentificationData {
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText:
          'Tumutukoy sa antas ng pormalidad ng wikang ginagamit batay sa sitwasyon, kausap, at layunin ng komunikasyon.',
      acceptableAnswers: [
        'language register',
        'register',
        'wika'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Tumutukoy sa emosyonal at intensiyonal na katangian ng isang mensahe at kung paano ito nais iparating.',
      acceptableAnswers: ['tono', 'tone'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Tumutukoy sa kalagayan o sitwasyong pinangyayarihan ng komunikasyon, kabilang ang kultura, organisasyon, relasyon, lugar, at nakaraang pangyayari.',
      acceptableAnswers: [
        'konteksto',
        'context',
        'konteksto ng komunikasyon'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Tugon sa isang mensahe, gawain, o kilos na maaaring makatulong upang linawin, itama, o palawakin ang isang ideya.',
      acceptableAnswers: ['feedback', 'pabalik na tugon'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Anumang salik na maaaring makaistorbo o makahadlang sa malinaw na pagpapalitan ng mensahe.',
      acceptableAnswers: [
        'noise',
        'hadlang sa komunikasyon',
        'hadlang',
        'ingay'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pakikinig na may kasamang pag-unawa, pagsusuri, at wastong pagtugon sa mensahe.',
      acceptableAnswers: ['aktibong pakikinig', 'active listening'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Muling pagpapahayag ng ideya gamit ang sariling mga salita upang matiyak na tama ang pagkakaunawa sa mensahe.',
      acceptableAnswers: ['paraphrasing', 'paraphrase'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Listahan ng mga paksang pag-uusapan sa isang pulong.',
      acceptableAnswers: ['agenda', 'adyenda'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Talaan ng mahahalagang napag-usapan, desisyon, at iba pang mahahalagang detalye sa isang pulong.',
      acceptableAnswers: [
        'minutes ng pulong',
        'minutes',
        'katitikan ng pulong',
        'katitikan'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Paraan ng pagsagot sa behavioral interview na gumagamit ng Situation, Task, Action, at Result.',
      acceptableAnswers: ['star method', 'star'],
    ),
  ];
}