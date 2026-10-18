class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa4IdentificationData {
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText:
          'Diskursong kumikilala, tumatanggap, at gumagalang sa pagkakaiba-iba ng mga tao.',
      acceptableAnswers: [
        'ingklusibo',
        'ingklusibong diskurso',
        'inklusibo',
        'inclusive'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Diskursong matapat, responsable, at nakabatay sa paggalang sa dignidad ng bawat tao.',
      acceptableAnswers: ['etikal', 'etikal na diskurso', 'ethical'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pundasyon na kumikilala na ang bawat tao ay may sariling halaga at karapatang tratuhin nang may respeto.',
      acceptableAnswers: ['dignidad ng tao', 'dignidad'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pundasyon na nagsisiguro na walang pagkiling at may patas na pagkakataon ang bawat isa na maipahayag ang kanilang pananaw.',
      acceptableAnswers: [
        'katarungan at patas na pagtrato',
        'katarungan',
        'patas na pagtrato'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pundasyon na nagsasaad na ang nagsasalita o sumusulat ay may pananagutan sa epekto ng kaniyang mga salita.',
      acceptableAnswers: [
        'pagkamapanagot sa epekto ng wika',
        'pagkamapanagot'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Paggamit ng mga salitang kumikilala muna sa tao bago sa kondisyon o katangiang iniuugnay sa kanya.',
      acceptableAnswers: [
        'person-first language',
        'person first language',
        'person first'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Paraan ng pakikipag-usap kung saan nakikinig nang mabuti at nililinaw ang pangunahing punto ng kausap upang matiyak ang pagkaunawa.',
      acceptableAnswers: ['aktibong pakikinig', 'active listening'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pagiging malinaw tungkol sa layunin ng komunikasyon, pinagmulan ng impormasyon, at limitasyon ng datos.',
      acceptableAnswers: ['transparensiya', 'transparency', 'transparensya'],
    ),
    IdentificationQuestionModel(
      questionText:
          'Proseso ng paghingi muna ng pahintulot bago gamitin o ibahagi ang kuwento, larawan, o personal na impormasyon ng ibang tao.',
      acceptableAnswers: [
        'pahintulot',
        'consent',
        'pahintulot / consent',
        'pahintulot o consent'
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Mga salita o pariralang tumutulong sa pagpapanatili ng magalang, patas, at malinaw na talakayan.',
      acceptableAnswers: [
        'hudyat para sa ingklusibo at etikal na komunikasyon',
        'mga hudyat',
        'hudyat'
      ],
    ),
  ];
}