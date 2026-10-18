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

class Paksa6MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Tekstong Instruksiyonal', correctOptionKey: 'D'),
    MatchingTermModel(id: 2, term: 'Manwal', correctOptionKey: 'G'),
    MatchingTermModel(id: 3, term: 'Ulat Teknikal', correctOptionKey: 'I'),
    MatchingTermModel(id: 4, term: 'Proposal', correctOptionKey: 'E'),
    MatchingTermModel(id: 5, term: 'Product Specification', correctOptionKey: 'B'),
    MatchingTermModel(id: 6, term: 'Infographic', correctOptionKey: 'J'),
    MatchingTermModel(id: 7, term: 'Flowchart', correctOptionKey: 'C'),
    MatchingTermModel(id: 8, term: 'Diagram', correctOptionKey: 'F'),
    MatchingTermModel(id: 9, term: 'Talahanayan', correctOptionKey: 'H'),
    MatchingTermModel(id: 10, term: 'Graph o Chart', correctOptionKey: 'A'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description:
          'Nagpapakita ng numerical data, trend, dami, pagkakaiba, o proporsyon.',
    ),
    MatchingOptionModel(
      key: 'B',
      description:
          'Naglilista ng teknikal na katangian, performance, capacity, at compatibility ng isang produkto.',
    ),
    MatchingOptionModel(
      key: 'C',
      description:
          'Nagpapakita ng sunod-sunod na hakbang at maaaring maglaman ng decision points.',
    ),
    MatchingOptionModel(
      key: 'D',
      description:
          'Nagbibigay ng sunod-sunod na panuto upang maisagawa nang tama at ligtas ang isang gawain.',
    ),
    MatchingOptionModel(
      key: 'E',
      description:
          'Nagmumungkahi ng proyekto o solusyon at naglalahad ng plano, badyet, at inaasahang epekto.',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Nagpapakita ng mga bahagi, estruktura, o relasyon ng mga elemento ng isang bagay o konsepto.',
    ),
    MatchingOptionModel(
      key: 'G',
      description:
          'Nagbibigay ng gabay sa paggamit ng produkto, kagamitan, application, o system.',
    ),
    MatchingOptionModel(
      key: 'H',
      description:
          'Nag-oorganisa ng impormasyon sa rows at columns para sa paghahambing o pag-uuri.',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Naglalahad ng resulta ng pag-aaral, obserbasyon, pagsubok, o survey gamit ang organisadong datos.',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Pinagsasama ang maikling teksto, larawan, icons, at layout upang ibuod at linawin ang impormasyon.',
    ),
  ];
}