class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa4TrueFalseData {
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText:
          'Ang ingklusibong diskurso ay nagbibigay-puwang at kumikilala sa lahat.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang etikal na komunikasyon ay maaaring gumamit ng pananalitang nakasasakit basta malinaw ang mensahe.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang bawat tao ay may dignidad at karapatang tratuhin nang may respeto.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang patas na komunikasyon ay nagbibigay ng hindi pantay na pagkakataon sa pagpapahayag ng pananaw.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText: 'Kailangang suriin at mapatunayan ang impormasyong ibinabahagi.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang stereotype ay maaaring mabuo mula sa malawakang paglalahat tungkol sa isang grupo batay sa kilos ng ilang indibidwal.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang paggamit ng "baliw," "tamad," at "abnormal" bilang label sa tao ay halimbawa ng magalang na wika.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Mahalaga ang pagwawasto kapag may naibahaging maling impormasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Maaaring gumamit ng "mga mag-aaral" bilang katawagang tumutukoy sa lahat anuman ang kasarian.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Hindi na kailangang humingi ng pahintulot bago ibahagi ang personal na kuwento o larawan ng ibang tao.',
      isTrue: false,
    ),
  ];
}