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

class Paksa8MatchingData {
  // 10 Terms from Hanay A (Section D)
  static const List<MatchingTermModel> terms = [
    MatchingTermModel(id: 1, term: 'Obhetibo', correctOptionKey: 'C'),
    MatchingTermModel(id: 2, term: 'Malinaw', correctOptionKey: 'H'),
    MatchingTermModel(id: 3, term: 'Tiyak', correctOptionKey: 'F'),
    MatchingTermModel(id: 4, term: 'Magalang', correctOptionKey: 'E'),
    MatchingTermModel(id: 5, term: 'Professional Profile', correctOptionKey: 'D'),
    MatchingTermModel(id: 6, term: 'Resume', correctOptionKey: 'B'),
    MatchingTermModel(id: 7, term: 'Application Letter', correctOptionKey: 'G'),
    MatchingTermModel(id: 8, term: 'Email', correctOptionKey: 'A'),
    MatchingTermModel(id: 9, term: 'Minutes of the Meeting', correctOptionKey: 'I'),
    MatchingTermModel(id: 10, term: 'Aktibong Tinig', correctOptionKey: 'J'),
  ];

  // 10 Definitions from Hanay B (Section D)
  static const List<MatchingOptionModel> options = [
    MatchingOptionModel(
      key: 'A',
      description:
          'Elektronikong paraan ng pagpapadala at pagtanggap ng mensahe sa isang organisasyon.',
    ),
    MatchingOptionModel(
      key: 'B',
      description:
          'Naglalaman ng edukasyon, work experience, skills, at iba pang mahalagang impormasyon tungkol sa aplikante.',
    ),
    MatchingOptionModel(
      key: 'C',
      description:
          'Nakasentro sa katotohanan at datos sa halip na personal na damdamin o opinyon.',
    ),
    MatchingOptionModel(
      key: 'D',
      description:
          'Maikling paglalarawan ng kasanayan, karanasan, at mahahalagang nakamit ng isang tao.',
    ),
    MatchingOptionModel(
      key: 'E',
      description:
          'Gumagamit ng propesyonal at magalang na pananalita sa kausap.',
    ),
    MatchingOptionModel(
      key: 'F',
      description:
          'Direkta sa pangunahing punto at inaalis ang mga hindi kinakailangang salita.',
    ),
    MatchingOptionModel(
      key: 'G',
      description:
          'Pormal na liham na nagpapahayag ng interes sa isang posisyon at naglalahad ng kwalipikasyon ng aplikante.',
    ),
    MatchingOptionModel(
      key: 'H',
      description:
          'Madaling maunawaan at hindi gumagamit ng hindi kinakailangang komplikadong paliwanag.',
    ),
    MatchingOptionModel(
      key: 'I',
      description:
          'Opisyal na talaan ng mahahalagang talakayan, desisyon, at action items sa isang pulong.',
    ),
    MatchingOptionModel(
      key: 'J',
      description:
          'Uri ng pagsulat kung saan malinaw na ipinakikita kung sino ang gumagawa ng kilos.',
    ),
  ];
}