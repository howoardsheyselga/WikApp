class TrueFalseQuestionModel {
  final String questionText;
  final bool isTrue; // true = Tama, false = Mali

  const TrueFalseQuestionModel({
    required this.questionText,
    required this.isTrue,
  });
}

class Paksa8TrueFalseData {
  static const List<TrueFalseQuestionModel> questions = [
    TrueFalseQuestionModel(
      questionText:
          'Ang komunikasyong pasulat sa kontekstong pantrabaho ay dapat maging pormal, malinaw, obhetibo, at tiyak.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Mainam na gumamit ng maraming personal na opinyon sa isang sales report upang maging mas kawili-wili ito.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang aktibong tinig ay nakatutulong upang maging malinaw at direkta ang isang propesyonal na mensahe.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Mahalagang suriin ang baybay, gramatika, pangalan, at iba pang detalye bago ipadala ang isang dokumento o email.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang paggamit ng jargon ay palaging angkop kahit hindi pamilyar dito ang target na mambabasa.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang emojis at slang ay karaniwang hindi angkop sa mga pormal na dokumento at komunikasyon sa trabaho.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang Professional Profile ay maaaring ilagay sa itaas na bahagi ng resume upang maikliang maipakita ang kasanayan at karanasan ng aplikante.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang Application Letter ay ginagamit lamang upang ilista ang edukasyon at work experience ng aplikante.',
      isTrue: false,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang email ay maaaring gamitin sa pagpapadala ng mga anunsyo, ulat, dokumento, at iba pang mahahalagang impormasyon.',
      isTrue: true,
    ),
    TrueFalseQuestionModel(
      questionText:
          'Ang Minutes of the Meeting ay dapat magtala ng mahahalagang napag-usapan, desisyon, at mga taong responsable sa action items.',
      isTrue: true,
    ),
  ];
}