class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa6IdentificationData {
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText:
          'Uri ng sulatin na naglalayong magpaliwanag, magturo, o maglahad ng tiyak na impormasyon tungkol sa proseso, produkto, sistema, o gawain.',
      acceptableAnswers: [
        'teknikal na teksto',
        'teknikal na sulatin',
        'teknikal'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Katangian ng teknikal na teksto kung saan iniiaangkop ang wika at paraan ng paglalahad sa kaalaman, karanasan, at pangangailangan ng target na mambabasa.',
      acceptableAnswers: [
        'audience-based',
        'nakaayon sa mambabasa',
        'audience based'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng teknikal na teksto na naglalaman ng sunod-sunod na hakbang upang maisagawa nang tama at ligtas ang isang gawain.',
      acceptableAnswers: [
        'tekstong instruksiyonal',
        'instruksiyonal na teksto',
        'tekstong instruksyonal'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Dokumentong nagbibigay ng impormasyon tungkol sa tamang paggamit ng produkto, kagamitan, application, o system.',
      acceptableAnswers: ['manwal', 'manual'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Uri ng teknikal na teksto na naglalahad ng resulta ng pag-aaral, pagsubok, obserbasyon, o survey gamit ang datos.',
      acceptableAnswers: [
        'ulat teknikal',
        'teknikal na ulat',
        'technical report'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Dokumentong nagmumungkahi ng proyekto o solusyon sa isang problema at naglalaman ng plano kung paano ito isasagawa.',
      acceptableAnswers: [
        'proposal',
        'panukala',
        'proposal / panukala'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Biswal na nagpapakita ng sunod-sunod na proseso gamit ang mga kahon, arrow, at decision points.',
      acceptableAnswers: ['flowchart', 'flow chart'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Biswal na nag-oorganisa ng impormasyon gamit ang rows at columns upang mapadali ang paghahambing at pag-uuri.',
      acceptableAnswers: [
        'talahanayan',
        'table',
        'talahanayan / table'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Biswal na paglalarawan ng mga bahagi, estruktura, o ugnayan ng mga elemento ng isang bagay o konsepto.',
      acceptableAnswers: ['diagram', 'dayagram'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Tekstong biswal na pinagsasama ang maikling teksto, larawan o icon, at organisadong layout upang maipakita ang mahahalagang impormasyon.',
      acceptableAnswers: ['infographic', 'infographics'],
    ),
  ];
}