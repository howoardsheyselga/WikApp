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

class Paksa5MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Sanaysay', correctOptionKey: 'E'),
    MatchingTermModel(id: 2, term: 'Pananaliksik', correctOptionKey: 'H'),
    MatchingTermModel(id: 3, term: 'Rebyu', correctOptionKey: 'B'),
    MatchingTermModel(id: 4, term: 'Bionote', correctOptionKey: 'F'),
    MatchingTermModel(id: 5, term: 'Adyenda', correctOptionKey: 'I'),
    MatchingTermModel(id: 6, term: 'Sintesis', correctOptionKey: 'G'),
    MatchingTermModel(id: 7, term: 'Panukalang Proyekto', correctOptionKey: 'A'),
    MatchingTermModel(id: 8, term: 'Replektibong Sanaysay', correctOptionKey: 'D'),
    MatchingTermModel(id: 9, term: 'Lakbay-Sanaysay', correctOptionKey: 'J'),
    MatchingTermModel(id: 10, term: 'Pictorial Essay', correctOptionKey: 'C'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description:
          'Pormal na dokumentong naglalahad ng isang planong proyekto, badyet, timeline, at inaasahang resulta.',
    ),
    MatchingOptionModel(
      key: 'B',
      description:
          'Sulating nagsusuri ng isang aklat, artikulo, pelikula, o iba pang likhang-sining.',
    ),
    MatchingOptionModel(
      key: 'C',
      description:
          'Sulating gumagamit ng mga larawan at maiikling teksto upang maglahad ng kuwento o ideya.',
    ),
    MatchingOptionModel(
      key: 'D',
      description:
          'Sulating nakatuon sa sariling karanasan, damdamin, ideya, at mga natutuhan ng manunulat.',
    ),
    MatchingOptionModel(
      key: 'E',
      description:
          'Maikling komposisyong naglalahad ng pananaw o pagsusuri tungkol sa isang partikular na paksa.',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Maikling paglalarawan sa edukasyon, karanasan, at kwalipikasyon ng isang tao.',
    ),
    MatchingOptionModel(
      key: 'G',
      description:
          'Pagsasama-sama at pagsusuri ng mahahalagang ideya mula sa iba\'t ibang sanggunian.',
    ),
    MatchingOptionModel(
      key: 'H',
      description:
          'Sistematikong pag-aaral na isinasagawa upang makahanap ng kasagutan sa isang tanong o solusyon sa suliranin.',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Talaan ng mga paksang pag-uusapan sa isang pormal na pagpupulong.',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Akademikong pagsasalaysay tungkol sa paglalakbay, karanasan, obserbasyon, at mga natutuhan.',
    ),
  ];
}