class IdentificationQuestionModel {
  final String questionText;
  final List<String> acceptableAnswers;

  const IdentificationQuestionModel({
    required this.questionText,
    required this.acceptableAnswers,
  });
}

class Paksa2IdentificationData {
  static const List<IdentificationQuestionModel> questions = [
    IdentificationQuestionModel(
      questionText:
          'Kakayahang magsuri, magtanong, magbigay ng makatwirang hatol, at magbigay-kahulugan sa mga mensahe.',
      acceptableAnswers: [
        'Kritikal na Kasanayan sa Komunikasyon',
        'kritikal na kasanayan sa komunikasyon',
        'kritikal na kasanayan',
      ],
    ),
    IdentificationQuestionModel(
      questionText: 'Pakikinig na may kasamang pagsusuri at pag-iisip.',
      acceptableAnswers: [
        'Kritikal na Pakikinig',
        'kritikal na pakikinig',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pagbasa na isinasaalang-alang ang layunin, pananaw, at pinagmulan ng manunulat.',
      acceptableAnswers: [
        'Kritikal na Pagbasa',
        'kritikal na pagbasa',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Panonood na may kamalayan sa mensahe, simbolo, at paraan ng representasyon.',
      acceptableAnswers: [
        'Kritikal na Panonood',
        'kritikal na panonood',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pagpapahayag ng sariling opinyon na may sapat na batayan habang iginagalang ang pananaw ng iba.',
      acceptableAnswers: [
        'Kritikal na Pagsasalita',
        'kritikal na pagsasalita',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Konteksto ng komunikasyon na nakabatay sa relasyon at paraan ng pakikipag-ugnayan ng mga tao.',
      acceptableAnswers: [
        'Kontekstong Sosyal',
        'kontekstong sosyal',
        'sosyal',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Konteksto na nakaugat sa paniniwala, kaugalian, pagpapahalaga, at tradisyon ng isang lipunan.',
      acceptableAnswers: [
        'Kontekstong Kultural',
        'kontekstong kultural',
        'kultural',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pagkiling ng isang mensahe pabor o laban sa isang tao, grupo, ideya, o sitwasyon.',
      acceptableAnswers: [
        'Bias',
        'bias',
        'pagkiling',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pahayag na maaaring magmukhang biro o papuri ngunit naglalaman ng pang-uuyam.',
      acceptableAnswers: [
        'Sarcasm o Panunuya',
        'Sarcasm',
        'sarcasm',
        'panunuya',
        'sarcasm/panunuya',
      ],
    ),
    IdentificationQuestionModel(
      questionText:
          'Pagbibigay ng pangkalahatang hatol tungkol sa isang buong grupo nang walang sapat na ebidensya.',
      acceptableAnswers: [
        'Generalisasyon',
        'generalisasyon',
      ],
    ),
  ];
}