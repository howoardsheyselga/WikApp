class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa1IdentificationData {
  // Exact 10 Identification items from GAWAIN_PAKSA 1 (Section B)
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText: 'Siya ang pinagmumulan o nagpapahayag ng mensahe.',
      acceptableAnswers: ['tagapagpadala', 'sender'],
    ),
    IdentificationQuestionModel(
      questionText: 'Siya ang tumatanggap at nagbibigay ng kahulugan sa mensahe.',
      acceptableAnswers: ['tagatanggap', 'receiver'],
    ),
    IdentificationQuestionModel(
      questionText: 'Anumang sagabal na maaaring makaapekto sa proseso ng komunikasyon.',
      acceptableAnswers: ['ingay', 'noise'],
    ),
    IdentificationQuestionModel(
      questionText: 'Aktibong proseso ng pag-unawa at pagbibigay ng kahulugan sa mga mensahe.',
      acceptableAnswers: [
        'pagpapakahulugan',
        'meaning-making',
        'meaning making'
      ],
    ),
    IdentificationQuestionModel(
      questionText: 'Di-literal na kahulugan ng salita na nabubuo batay sa damdamin, kultura, karanasan, at konteksto.',
      acceptableAnswers: ['konotasyon', 'connotation'],
    ),
    IdentificationQuestionModel(
      questionText: 'Salik na tumutukoy sa sitwasyon, lugar, oras, at taong kausap na maaaring makaapekto sa kahulugan ng mensahe.',
      acceptableAnswers: ['konteksto', 'context'],
    ),
    IdentificationQuestionModel(
      questionText: 'Mga salita, parirala, o ekspresyong ginagamit upang pag-ugnayin ang iba\'t ibang bahagi ng usapan o teksto.',
      acceptableAnswers: ['hudyat', 'mga hudyat'],
    ),
    IdentificationQuestionModel(
      questionText: 'Estratehiyang gumagamit ng mga tanong upang mapalalim ang talakayan.',
      acceptableAnswers: ['pagtatanong', 'tanong'],
    ),
    IdentificationQuestionModel(
      questionText: 'Estratehiyang tumutukoy sa maayos na pagsasalitan ng mga kalahok sa usapan.',
      acceptableAnswers: [
        'pagbibigay-daan',
        'pagbibigay daan',
        'turn-taking',
        'turn taking'
      ],
    ),
    IdentificationQuestionModel(
      questionText: 'Estratehiyang ginagamit upang magdagdag ng impormasyon, detalye, o paliwanag upang mapalalim ang isang pahayag.',
      acceptableAnswers: [
        'pagpapalawak ng ideya',
        'pagpapalawak ng kaisipan'
      ],
    ),
  ];
}