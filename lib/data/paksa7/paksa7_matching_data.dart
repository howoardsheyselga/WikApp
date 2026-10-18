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

class Paksa7MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Pormal na Register', correctOptionKey: 'H'),
    MatchingTermModel(id: 2, term: 'Teknikal na Register', correctOptionKey: 'C'),
    MatchingTermModel(id: 3, term: 'Kolaboratibong Tono', correctOptionKey: 'F'),
    MatchingTermModel(id: 4, term: 'Empatikong Tono', correctOptionKey: 'E'),
    MatchingTermModel(id: 5, term: 'Kultural na Konteksto', correctOptionKey: 'J'),
    MatchingTermModel(id: 6, term: 'Semantikong Noise', correctOptionKey: 'G'),
    MatchingTermModel(id: 7, term: 'Konstruktibong Feedback', correctOptionKey: 'A'),
    MatchingTermModel(id: 8, term: 'Aktibong Pakikinig', correctOptionKey: 'D'),
    MatchingTermModel(id: 9, term: 'Agenda', correctOptionKey: 'B'),
    MatchingTermModel(id: 10, term: 'Minutes ng Pulong', correctOptionKey: 'I'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description:
          'Pagbibigay ng mungkahi upang mapahusay ang isang gawain o resulta.',
    ),
    MatchingOptionModel(
      key: 'B',
      description:
          'Listahan ng mga paksang nakatakdang pag-uusapan sa isang pulong.',
    ),
    MatchingOptionModel(
      key: 'C',
      description:
          'Paggamit ng mga espesipikong termino na nauugnay sa isang partikular na larangan.',
    ),
    MatchingOptionModel(
      key: 'D',
      description:
          'Pag-unawa at pagtugon sa mensahe nang may buong atensyon.',
    ),
    MatchingOptionModel(
      key: 'E',
      description:
          'Tono na nagpapakita ng pag-unawa sa damdamin o sitwasyon ng kausap.',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Tono na nakatuon sa pakikipagtulungan at sama-samang pagbuo ng solusyon.',
    ),
    MatchingOptionModel(
      key: 'G',
      description:
          'Hindi pagkakaunawaan dahil sa magkakaibang kahulugan o interpretasyon ng isang salita o termino.',
    ),
    MatchingOptionModel(
      key: 'H',
      description:
          'Wikang ginagamit sa opisyal, akademiko, at propesyonal na mga sitwasyon.',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Talaan ng mahahalagang napag-usapan, desisyon, at detalye sa isang pulong.',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Kontekstong naiimpluwensiyahan ng mga paniniwala, pagpapahalaga, at kaugalian ng isang grupo.',
    ),
  ];
}