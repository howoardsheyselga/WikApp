class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa7TrueFalseData {
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText:
          'Ang mabisang komunikasyong propesyonal ay nangangailangan ng wastong pagpili ng wika, tono, midyum, at paraan ng paghahatid ng mensahe.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang pormal na language register ay karaniwang ginagamit sa opisyal, akademiko, at propesyonal na sitwasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang teknikal na register ay gumagamit ng mga terminong partikular sa isang larangan.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang tono ay walang epekto sa paraan ng pagtanggap ng isang mensahe.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang konteksto ng komunikasyon ay maaaring maimpluwensiyahan ng kultura, relasyon ng mga nag-uusap, at organisasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang semantikong noise ay maaaring mangyari kapag hindi pareho ang pagkakaunawa ng mga nag-uusap sa isang salita o termino.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang agenda ay talaan ng mga napag-usapan at desisyon sa isang pulong.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang paraphrasing ay muling pagpapahayag ng mensahe gamit ang sariling salita upang matiyak ang pag-unawa.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang aktibong pakikinig ay nangangailangan ng buong atensyon at wastong pagtugon sa kausap.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Sa professional communication, sapat nang magsalita nang maayos; hindi na mahalaga ang pagtatanong, paglilinaw, at pakikinig.',
      isTrue: false,
    ),
  ];
}