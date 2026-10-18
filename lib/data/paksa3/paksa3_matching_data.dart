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

class Paksa3MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Impormatibo', correctOptionKey: 'B'),
    MatchingTermModel(id: 2, term: 'Deskriptibo', correctOptionKey: 'D'),
    MatchingTermModel(id: 3, term: 'Naratibo', correctOptionKey: 'H'),
    MatchingTermModel(id: 4, term: 'Prosidyural', correctOptionKey: 'I'),
    MatchingTermModel(id: 5, term: 'Persweysib', correctOptionKey: 'G'),
    MatchingTermModel(id: 6, term: 'Argumentatibo', correctOptionKey: 'J'),
    MatchingTermModel(id: 7, term: 'Humanidades', correctOptionKey: 'F'),
    MatchingTermModel(id: 8, term: 'Propesyonal', correctOptionKey: 'C'),
    MatchingTermModel(id: 9, term: 'Self-assessment', correctOptionKey: 'E'),
    MatchingTermModel(id: 10, term: 'Peer assessment', correctOptionKey: 'A'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description:
          'Pagsusuri sa gawa ng isang kapwa mag-aaral gamit ang malinaw na pamantayan',
    ),
    MatchingOptionModel(
      key: 'B',
      description: 'Tekstong naglalahad ng impormasyon o makatotohanang datos',
    ),
    MatchingOptionModel(
      key: 'C',
      description: 'Tekstong ginagamit sa pormal at opisyal na sitwasyon',
    ),
    MatchingOptionModel(
      key: 'D',
      description:
          'Tekstong naglalarawan ng tao, lugar, bagay, o pangyayari',
    ),
    MatchingOptionModel(
      key: 'E',
      description: 'Pagsusuri at pagninilay sa sariling gawa at pagkatuto',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Tekstong nakatuon sa damdamin, sining, kultura, at karanasan ng tao',
    ),
    MatchingOptionModel(
      key: 'G',
      description: 'Tekstong naglalayong manghikayat o mangumbinsi',
    ),
    MatchingOptionModel(
      key: 'H',
      description:
          'Tekstong nagsasalaysay ng mga pangyayari ayon sa pagkakasunod-sunod',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Tekstong nagbibigay ng mga hakbang o proseso upang magawa ang isang gawain',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Tekstong naglalahad ng posisyon gamit ang lohikal na pangangatwiran at ebidensya',
    ),
  ];
}