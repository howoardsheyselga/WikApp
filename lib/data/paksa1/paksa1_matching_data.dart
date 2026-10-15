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

class Paksa1MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Tagapagpadala', correctOptionKey: 'E'),
    MatchingTermModel(id: 2, term: 'Daluyan', correctOptionKey: 'B'),
    MatchingTermModel(id: 3, term: 'Konteksto', correctOptionKey: 'I'),
    MatchingTermModel(id: 4, term: 'Tugon', correctOptionKey: 'D'),
    MatchingTermModel(id: 5, term: 'Denotasyon', correctOptionKey: 'A'),
    MatchingTermModel(id: 6, term: 'Konotasyon', correctOptionKey: 'G'),
    MatchingTermModel(id: 7, term: 'Hudyat', correctOptionKey: 'F'),
    MatchingTermModel(id: 8, term: 'Pagtatanong', correctOptionKey: 'H'),
    MatchingTermModel(id: 9, term: 'Pagbibigay ng Halimbawa', correctOptionKey: 'J'),
    MatchingTermModel(id: 10, term: 'Pagwawakas ng Usapan', correctOptionKey: 'C'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description: 'Direktang kahulugan ng isang salita',
    ),
    MatchingOptionModel(
      key: 'B',
      description: 'Paraan o midyum na ginagamit upang maipadala ang mensahe',
    ),
    MatchingOptionModel(
      key: 'C',
      description: 'Maayos na pagsasara ng talakayan',
    ),
    MatchingOptionModel(
      key: 'D',
      description: 'Reaksyon o sagot ng tagatanggap',
    ),
    MatchingOptionModel(
      key: 'E',
      description: 'Pinagmumulan o nagpapahayag ng mensahe',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Mga salitang ginagamit upang pag-ugnayin ang mga ideya sa usapan o teksto',
    ),
    MatchingOptionModel(
      key: 'G',
      description:
          'Di-literal na kahulugan na nakabatay sa damdamin, kultura, karanasan, at konteksto',
    ),
    MatchingOptionModel(
      key: 'H',
      description: 'Paggamit ng tanong upang mapalalim ang talakayan',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Sitwasyon, kultura, lugar, panahon, at relasyong sosyal na nakapaligid sa komunikasyon',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Pagbibigay ng konkretong detalye upang linawin o ipaliwanag ang isang ideya',
    ),
  ];
}