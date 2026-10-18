class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa5IdentificationData {
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText:
          'Ito ay tumutukoy sa mga babasahin at sulating ginagamit sa edukasyon, pananaliksik, at propesyonal na pagsasanay.',
      acceptableAnswers: [
        'akademikong teksto',
        'akademikong sulatin',
        'akademiko'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay maikling komposisyong naglalahad ng pananaw, kaisipan, o pagsusuri tungkol sa isang partikular na paksa.',
      acceptableAnswers: ['sanaysay', 'essay'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay maikling buod ng isang pananaliksik, tesis, o artikulo.',
      acceptableAnswers: ['abstrak', 'abstract'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay talaan ng mga paksang pag-uusapan sa isang pormal na pagpupulong.',
      acceptableAnswers: ['adyenda', 'agenda'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay opisyal na tala ng mga napag-usapan, napagkasunduan, at napagpasyahan sa isang pulong.',
      acceptableAnswers: [
        'katitikan ng pulong',
        'katitikan',
        'minutes of the meeting',
        'minutes'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay dokumentong naglalahad ng planong proyekto, layunin, implementasyon, timeline, badyet, at inaasahang resulta.',
      acceptableAnswers: [
        'panukalang proyekto',
        'project proposal',
        'panukala'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay sulating nagpapahayag ng malinaw na paninindigan tungkol sa isang kontrobersyal na isyu na sinusuportahan ng ebidensya.',
      acceptableAnswers: ['posisyong papel', 'position paper'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay pagsasama-sama ng mahahalagang ideya mula sa iba\'t ibang sanggunian upang makabuo ng mas malawak na pag-unawa.',
      acceptableAnswers: ['sintesis', 'synthesis'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay muling pagpapahayag ng ideya mula sa orihinal na teksto gamit ang sariling pananalita habang pinananatili ang kahulugan nito.',
      acceptableAnswers: ['paraphrasing', 'paraprase'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Ito ay pagiging tapat, patas, at responsable sa paggamit, pagsusuri, at pagbabahagi ng impormasyon.',
      acceptableAnswers: [
        'siyentipikong integridad',
        'integridad'
      ],
    ),
  ];
}