class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa8IdentificationData {
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText:
          'Katangian ng propesyonal na pagsulat na nakabatay sa katotohanan at hindi lamang sa personal na damdamin o opinyon.',
      acceptableAnswers: ['obhetibo', 'objective'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Katangian ng pagsulat kung saan madaling nauunawaan ang mensahe at iniiwasan ang hindi kinakailangang paliwanag.',
      acceptableAnswers: ['malinaw', 'clear'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Katangian ng pagsulat kung saan direkta sa pangunahing punto ang mensahe at inaalis ang mga salitang hindi kailangan.',
      acceptableAnswers: ['tiyak', 'concise', 'conciseness'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Katangian ng propesyonal na pagsulat na gumagamit ng magalang at angkop na pananalita anuman ang posisyon ng kausap.',
      acceptableAnswers: ['magalang', 'polite', 'respectful'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Maikling talata na naglalahad ng kasanayan, karanasan, at mahahalagang nakamit ng isang tao.',
      acceptableAnswers: ['professional profile', 'propesyonal na profile'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Dokumentong naglalaman ng edukasyon, karanasan sa trabaho, kasanayan, at iba pang impormasyon tungkol sa isang aplikante.',
      acceptableAnswers: ['resume', 'resumé'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pormal na liham na nagpapahayag ng interes ng aplikante sa isang posisyon at nagpapaliwanag kung bakit siya angkop dito.',
      acceptableAnswers: [
        'application letter',
        'liham aplikasyon',
        'liham ng aplikasyon',
        'application letter / liham aplikasyon'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Elektronikong paraan ng pagpapadala at pagtanggap ng mensahe sa loob at labas ng isang organisasyon.',
      acceptableAnswers: ['email', 'e-mail'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Opisyal na talaan ng mahahalagang napag-usapan, napagkasunduan, at action items mula sa isang pagpupulong.',
      acceptableAnswers: [
        'minutes of the meeting',
        'katitikan ng pulong',
        'minutes',
        'minutes of the meeting / katitikan ng pulong'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Paraan ng pagsulat na gumagamit ng pangungusap kung saan ang gumagawa ng kilos ang malinaw na paksa, gaya ng "Tinapos ng pangkat ang proyekto."',
      acceptableAnswers: ['aktibong tinig', 'active voice'],
    ),
  ];
}