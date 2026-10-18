class MatchingTermModel {
  final int id; // 1 to 10
  final String term;
  final String correctOptionKey; // A to J

  const MatchingTermModel({
    required this.id,
    required this.term,
    required this.correctOptionKey,
  });
}

class MatchingOptionModel {
  final String key; // A to J
  final String description;

  const MatchingOptionModel({
    required this.key,
    required this.description,
  });
}

class Paksa4MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Dignidad ng Tao', correctOptionKey: 'B'),
    MatchingTermModel(
        id: 2, term: 'Katarungan at Patas na Pagtrato', correctOptionKey: 'C'),
    MatchingTermModel(
        id: 3, term: 'Pagkamapanagot sa Epekto ng Wika', correctOptionKey: 'J'),
    MatchingTermModel(
        id: 4, term: 'Katotohanan at Beripikasyon', correctOptionKey: 'G'),
    MatchingTermModel(id: 5, term: 'Do No Harm', correctOptionKey: 'D'),
    MatchingTermModel(
        id: 6, term: 'Person-First Language', correctOptionKey: 'I'),
    MatchingTermModel(id: 7, term: 'Gender-Fair na Wika', correctOptionKey: 'E'),
    MatchingTermModel(id: 8, term: 'Aktibong Pakikinig', correctOptionKey: 'H'),
    MatchingTermModel(id: 9, term: 'Transparensiya', correctOptionKey: 'F'),
    MatchingTermModel(id: 10, term: 'Pahintulot (Consent)', correctOptionKey: 'A'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description:
          'Paghingi muna ng pahintulot bago gamitin o ibahagi ang impormasyon tungkol sa ibang tao',
    ),
    MatchingOptionModel(
      key: 'B',
      description:
          'Pagkilala sa halaga at karapatang tratuhin nang may respeto ang bawat tao',
    ),
    MatchingOptionModel(
      key: 'C',
      description:
          'Pagbibigay ng patas na pagkakataon sa bawat isa na maipahayag ang pananaw',
    ),
    MatchingOptionModel(
      key: 'D',
      description:
          'Paggamit ng wikang hindi nakasasakit, naninira, o nanghihikayat ng pagkamuhi',
    ),
    MatchingOptionModel(
      key: 'E',
      description:
          'Paggamit ng mga katawagang maaaring tumukoy sa lahat anuman ang kasarian',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Pagiging malinaw tungkol sa layunin, pinagmulan ng impormasyon, at limitasyon ng datos',
    ),
    MatchingOptionModel(
      key: 'G',
      description:
          'Pagsusuri at pagpapatunay sa impormasyon bago ito ibahagi',
    ),
    MatchingOptionModel(
      key: 'H',
      description:
          'Pakikinig nang mabuti at paglilinaw sa pangunahing punto ng kausap',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Pagkilala muna sa tao bago sa kondisyon o katangiang iniuugnay sa kanya',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Pagkilala na may pananagutan ang nagsasalita o sumusulat sa epekto ng kaniyang wika',
    ),
  ];
}