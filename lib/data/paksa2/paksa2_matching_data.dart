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

class Paksa2MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Kritikal na Pakikinig', correctOptionKey: 'C'),
    MatchingTermModel(id: 2, term: 'Kritikal na Pagbasa', correctOptionKey: 'H'),
    MatchingTermModel(id: 3, term: 'Kritikal na Panonood', correctOptionKey: 'G'),
    MatchingTermModel(id: 4, term: 'Kritikal na Pagsasalita', correctOptionKey: 'B'),
    MatchingTermModel(id: 5, term: 'Social Dynamics', correctOptionKey: 'J'),
    MatchingTermModel(id: 6, term: 'Loaded Words', correctOptionKey: 'D'),
    MatchingTermModel(id: 7, term: 'Labeling Words', correctOptionKey: 'E'),
    MatchingTermModel(id: 8, term: 'Sarcasm', correctOptionKey: 'I'),
    MatchingTermModel(id: 9, term: 'Generalisasyon', correctOptionKey: 'A'),
    MatchingTermModel(id: 10, term: 'Black-and-White Thinking', correctOptionKey: 'F'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description:
          'Pagbibigay ng pangkalahatang hatol sa isang grupo nang walang sapat na ebidensya',
    ),
    MatchingOptionModel(
      key: 'B',
      description:
          'Pagpapahayag ng sariling opinyon na may batayan at paggalang sa pananaw ng iba',
    ),
    MatchingOptionModel(
      key: 'C',
      description: 'Pakikinig na may kasamang pagsusuri at pag-iisip',
    ),
    MatchingOptionModel(
      key: 'D',
      description: 'Mga salitang may matinding emosyonal na dating',
    ),
    MatchingOptionModel(
      key: 'E',
      description:
          'Pagbibigay ng positibo o negatibong tatak sa isang tao o bagay',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Pagtingin sa isang usapin na para bang dalawa lamang ang posibleng panig',
    ),
    MatchingOptionModel(
      key: 'G',
      description:
          'Pagsusuri sa mensahe, simbolo, at representasyon sa isang palabas o materyal',
    ),
    MatchingOptionModel(
      key: 'H',
      description:
          'Pagsusuri sa layunin, pananaw, at pinagmulan ng manunulat',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Pang-uuyam o hindi direktang panlalait na maaaring magmukhang biro o papuri',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Tumutukoy sa kapangyarihan, katayuan, at papel ng bawat tao sa isang interaksyon',
    ),
  ];
}