class RegisterItem {
  final int number;
  final String title;
  final String description;
  final String example;

  const RegisterItem({
    required this.number,
    required this.title,
    required this.description,
    required this.example,
  });
}

class TonoItem {
  final int number;
  final String title;
  final String description;
  final String example;

  const TonoItem({
    required this.number,
    required this.title,
    required this.description,
    required this.example,
  });
}

class KontekstoItem {
  final int number;
  final String title;
  final String description;
  final String example;

  const KontekstoItem({
    required this.number,
    required this.title,
    required this.description,
    required this.example,
  });
}

class FeedbackItem {
  final int number;
  final String title;
  final String description;
  final String? example;

  const FeedbackItem({
    required this.number,
    required this.title,
    required this.description,
    this.example,
  });
}

class NoiseItem {
  final int number;
  final String title;
  final String description;
  final String? example;

  const NoiseItem({
    required this.number,
    required this.title,
    required this.description,
    this.example,
  });
}

class KahalagahanItem {
  final int number;
  final String title;
  final String description;

  const KahalagahanItem({
    required this.number,
    required this.title,
    required this.description,
  });
}

class TermConceptItem {
  final int number;
  final String title;
  final String description;
  final List<String>? subItems;

  const TermConceptItem({
    required this.number,
    required this.title,
    required this.description,
    this.subItems,
  });
}

class Paksa7Data {
  static const String mainHeader =
      'PAKSA 7: INTERAKTIBONG KOMUNIKASYON SA KONTEKSTONG PROPESYONAL AT PANTRABAHO';
  static const String subtitle =
      'Araling Panlipunan • 3rd Term';

  static const String introBody =
      'Ang pakikipagtalastasan sa kontekstong propesyonal ay hindi lamang simpleng pagpapalitan ng impormasyon. Ito ay isang sistematikong proseso na nangangailangan ng wastong pagpili ng wika, tono, midyum, at paraan ng paghahatid ng mensahe upang matiyak ang malinaw na pag-unawa at wastong pagkilos.\n\nSa lugar ng trabaho, ang hindi maayos na komunikasyon ay maaaring humantong sa maling desisyon, pagkaantala ng mga gawain o proyekto, at pagkakaroon ng hindi pagkakaunawaan sa pagitan ng mga kasamahan.';

  static const String tuntuninIntro =
      'Bago matutuhan ang mabisang pakikipagtalastasan, mahalagang maunawaan muna ang mga pangunahing konseptong bumubuo rito. Ang mga terminong ito ay nagsisilbing gabay upang masuri kung ang isang komunikasyon ay angkop, malinaw, at epektibo sa isang propesyonal na sitwasyon.';

  // 1. Wika (Language Register)
  static const String registerIntro =
      'Ang wika o language register ay tumutukoy sa antas ng pormalidad ng wikang ginagamit depende sa sitwasyon, kausap, at layunin ng komunikasyon.\n\n• Pormal: "Iminumungkahi kong repasuhin natin ang ulat." \n• Impormal: "Ayusin na lang natin \'to."';

  static const List<RegisterItem> registerList = [
    RegisterItem(
      number: 1,
      title: 'Pormal',
      description:
          'Ginagamit sa opisyal, akademiko, at propesyonal na mga sitwasyon tulad ng ulat, email sa nakatataas, at presentasyon.',
      example: '"Ipinapaabot ko ang aking ulat para sa inyong pagsusuri."',
    ),
    RegisterItem(
      number: 2,
      title: 'Impormal',
      description:
          'Karaniwang ginagamit sa pang-araw-araw na pakikipag-usap sa mga kaibigan, kaklase, o malalapit na kakilala.',
      example: '"Ayusin na lang natin \'to."',
    ),
    RegisterItem(
      number: 3,
      title: 'Teknikal',
      description:
          'Gumagamit ng mga espesipikong terminong nauugnay sa isang partikular na larangan tulad ng medisina, Information Technology, at engineering.',
      example: '"Kailangang i-debug ang system error."',
    ),
    RegisterItem(
      number: 4,
      title: 'Kolokyal',
      description:
          'Tumutukoy sa karaniwang pananalitang pinaikli o binago sa pang-araw-araw na pakikipag-usap.',
      example: '"Di ko pa tapos."',
    ),
    RegisterItem(
      number: 5,
      title: 'Balbal (Slang)',
      description:
          'Mga salitang di-pormal na karaniwang ginagamit ng isang partikular na grupo o komunidad.',
      example: '"Petmalu," "lodi"',
    ),
  ];

  // 2. Tono (Tone of Communication)
  static const String tonoIntro =
      'Ang tono ay tumutukoy sa emosyonal at intensiyonal na katangian ng isang mensahe. Ipinakikita nito kung paano nais iparating ng nagsasalita o sumusulat ang isang ideya.';

  static const List<TonoItem> tonoList = [
    TonoItem(
      number: 1,
      title: 'Direktibo',
      description: 'Ginagamit upang magbigay ng malinaw na utos o instruksyon.',
      example: '"Ipasa ang report bago mag-5 PM."',
    ),
    TonoItem(
      number: 2,
      title: 'Kolaboratibo',
      description: 'Nakatuon sa pakikipagtulungan at pagbuo ng solusyon kasama ang iba.',
      example: '"Maaari ba nating pag-usapan kung paano ito mapapabuti?"',
    ),
    TonoItem(
      number: 3,
      title: 'Empatiko',
      description: 'Nagpapakita ng pag-unawa sa damdamin o sitwasyon ng kausap.',
      example: '"Nauunawaan ko ang iyong sitwasyon."',
    ),
    TonoItem(
      number: 4,
      title: 'Neutral',
      description: 'Nagbibigay ng tuwirang impormasyon nang hindi nagpapakita ng matinding emosyon.',
      example: '"Ang meeting ay magsisimula sa 9 AM."',
    ),
    TonoItem(
      number: 5,
      title: 'Persweysib (Persuasive)',
      description: 'Ginagamit upang mahikayat ang kausap na tanggapin ang isang ideya o mungkahi.',
      example: '"Mas magiging epektibo ang planong ito kung susundin natin ito."',
    ),
    TonoItem(
      number: 6,
      title: 'Assertive',
      description: 'Matatag at malinaw ang pagpapahayag ngunit nananatiling magalang.',
      example: '"Naniniwala akong ito ang pinakamainam na solusyon."',
    ),
  ];

  // 3. Konteksto (Context)
  static const String kontekstoIntro =
      'Ang konteksto ay tumutukoy sa kalagayan o sitwasyong pinangyayarihan ng komunikasyon. Kabilang dito ang kultura, organisasyon, relasyon ng mga nag-uusap, lugar, at mga nakaraang pangyayari.';

  static const List<KontekstoItem> kontekstoList = [
    KontekstoItem(
      number: 1,
      title: 'Sosyal na Konteksto',
      description: 'Nakabatay sa relasyon ng mga taong nag-uusap.',
      example: 'Halimbawa: Boss at empleyado kumpara sa magkakaibigan.',
    ),
    KontekstoItem(
      number: 2,
      title: 'Kultural na Konteksto',
      description: 'Naiimpluwensiyahan ng mga paniniwala, pagpapahalaga, at kaugalian ng isang grupo.',
      example: 'Halimbawa: Pagpapakita ng respeto sa nakatatanda.',
    ),
    KontekstoItem(
      number: 3,
      title: 'Organisasyonal na Konteksto',
      description: 'Nakabatay sa mga patakaran, sistema, at kultura ng isang organisasyon.',
      example: 'Halimbawa: Mas pormal na komunikasyon sa isang corporate setting.',
    ),
    KontekstoItem(
      number: 4,
      title: 'Pisikal na Konteksto',
      description: 'Tumutukoy sa lugar o kapaligiran kung saan nagaganap ang komunikasyon.',
      example: 'Halimbawa: Opisina kumpara sa online meeting.',
    ),
    KontekstoItem(
      number: 5,
      title: 'Historikal na Konteksto',
      description: 'Tumutukoy sa mga nakaraang pangyayari na maaaring makaapekto sa kasalukuyang usapan.',
      example: 'Halimbawa: Mga naging huling desisyon o nakaraang insidente sa proyekto.',
    ),
  ];

  // 4. Feedback
  static const String feedbackIntro =
      'Ang feedback ay tugon sa isang mensahe, gawain, o kilos. Maaari itong makatulong upang linawin, itama, o palawakin ang isang ideya.';

  static const List<FeedbackItem> feedbackList = [
    FeedbackItem(
      number: 1,
      title: 'Positibong Feedback',
      description: 'Nagbibigay-diin sa isang magandang gawain o resulta.',
      example: '"Maganda ang pagkakagawa ng ulat."',
    ),
    FeedbackItem(
      number: 2,
      title: 'Konstruktibong Feedback',
      description: 'Naglalayong makatulong upang mapahusay ang isang gawain.',
      example: '"Maaaring dagdagan pa ang datos upang mas maging malinaw."',
    ),
    FeedbackItem(
      number: 3,
      title: 'Negatibong Feedback',
      description: 'Tumutukoy sa kakulangan o pagkakamali sa isang gawain.',
      example: '"Hindi nasunod ang tamang format."',
    ),
    FeedbackItem(
      number: 4,
      title: 'Agarang Feedback',
      description: 'Ibinibigay kaagad pagkatapos ng isang gawain o interaksyon.',
    ),
    FeedbackItem(
      number: 5,
      title: 'Naantalang Feedback',
      description: 'Ibinibigay makalipas ang isang panahon matapos ang gawain o interaksyon.',
    ),
  ];

  // 5. Noise o Hadlang sa Komunikasyon
  static const String noiseIntro =
      'Ang noise ay anumang salik na maaaring makaistorbo o makahadlang sa malinaw na pagpapalitan ng mensahe.';

  static const List<NoiseItem> noiseList = [
    NoiseItem(
      number: 1,
      title: 'Pisikal na Noise',
      description: 'Mga ingay o pisikal na distraksiyon sa kapaligiran.',
      example: 'Halimbawa: Construction o maingay na lugar.',
    ),
    NoiseItem(
      number: 2,
      title: 'Sikolohikal na Noise',
      description: 'Mga emosyon o kondisyon ng isip na maaaring makaapekto sa pag-unawa.',
      example: 'Halimbawa: Stress o galit.',
    ),
    NoiseItem(
      number: 3,
      title: 'Semantikong Noise',
      description: 'Nangyayari kapag hindi pareho ang pagkakaunawa sa kahulugan ng isang salita o termino.',
      example: 'Halimbawa: Paggamit ng jargon na hindi nauunawaan ng kausap.',
    ),
    NoiseItem(
      number: 4,
      title: 'Kultural na Noise',
      description: 'Nagmumula sa pagkakaiba ng paniniwala, pagpapahalaga, o kultura.',
      example: 'Halimbawa: Iba\'t ibang pakahulugan sa kilos o ekspresyon ng mukha.',
    ),
    NoiseItem(
      number: 5,
      title: 'Teknikal na Noise',
      description: 'Mga problemang nauugnay sa kagamitan o teknolohiya.',
      example: 'Halimbawa: Mahinang internet o sirang audio.',
    ),
  ];

  // Kahalagahan ng Pag-aaral ng Komunikasyon
  static const String kahalagahanIntro =
      'Mahalagang pag-aralan ang pakikipagtalastasan dahil direktang nakaaapekto ito sa aktuwal na gawain at pakikipag-ugnayan sa lugar ng trabaho. Ang mga prinsipyo ng komunikasyon ay may praktikal na epekto sa kahusayan ng trabaho, relasyon sa mga kasamahan, at pag-unlad ng organisasyon.';

  static const List<KahalagahanItem> kahalagahanList = [
    KahalagahanItem(
      number: 1,
      title: 'Kahusayan sa Operasyon',
      description:
          'Nakakatulong ang malinaw na komunikasyon upang maging tiyak ang mga gawain at inaasahan. Dahil dito, mas napapabilis ang proseso at nababawasan ang kalituhan.',
    ),
    KahalagahanItem(
      number: 2,
      title: 'Katumpakan sa Paggawa ng Desisyon',
      description:
          'Nababawasan ang hindi pagkakaunawaan kapag tama at kumpleto ang impormasyong ipinapahayag. Nagiging mas malinaw din ang batayan ng mga desisyon.',
    ),
    KahalagahanItem(
      number: 3,
      title: 'Pamamahala ng Ugnayan',
      description:
          'Ang maayos na komunikasyon ay nakatutulong sa pagpapanatili ng respeto, tiwala, at kredibilidad sa pagitan ng mga kasamahan.',
    ),
    KahalagahanItem(
      number: 4,
      title: 'Propesyonal na Pagkakakilanlan',
      description:
          'Ang paraan ng pakikipag-usap ay maaaring magpakita ng pagiging propesyonal at kakayahang makipagtulungan. Nakakatulong ito sa pagbuo ng maayos na teamwork at collaboration.',
    ),
  ];

  // Sitwasyonal na Halimbawa
  static const List<Map<String, dynamic>> halimbawaList = [
    {
      'number': 1,
      'title': 'Email sa Supervisor',
      'situation': 'Naantala ang pagsusumite ng report.',
      'bad': '"Sorry po, di ko po natapos agad."',
      'good':
          '"Magalang na ipinapaalam na magkakaroon ng kaunting pagkaantala sa pagsusumite ng ulat dahil sa kakulangan sa datos. Inaasahan itong makukumpleto sa loob ng araw."',
      'analysis': [
        'Gumamit ng pormal na wika.',
        'Malinaw na ipinaliwanag ang dahilan.',
        'Nagbigay ng inaasahang solusyon o oras ng pagkumpleto.',
        'Napanatili ang propesyonal na tono.',
      ],
    },
    {
      'number': 2,
      'title': 'Pagbibigay ng Puna sa Kasamahan',
      'situation': 'May nakitang error sa isang presentation.',
      'bad': '"Mali \'yan."',
      'good':
          '"Napansin ko na may ilang datos na maaaring i-verify pa upang mas maging accurate ang presentation."',
      'analysis': [
        'Gumamit ng empatiko at kolaboratibong tono.',
        'Iniwasan ang direktang paghusga.',
        'Nakatuon sa pagpapabuti ng gawain.',
      ],
    },
    {
      'number': 3,
      'title': 'Maling Interpretasyon Dahil sa Tono',
      'situation': 'Nagpadala ng mensahe sa team chat.',
      'bad': '"Gawin mo ito ngayon."',
      'note':
          'Maaaring maunawaan ito bilang isang matigas na utos o indikasyon ng galit dahil walang kasamang non-verbal cues sa digital communication.',
      'good': '"Maaari mo bang asikasuhin ito ngayon kung maaari? Salamat."',
      'point':
          'Sa digital communication, limitado ang mga non-verbal cues. Dahil dito, mahalagang maging malinaw, magalang, at maingat sa paggamit ng tono.',
    },
    {
      'number': 4,
      'title': 'Cultural Sensitivity',
      'situation': 'Nagtatrabaho sa isang multicultural workplace.',
      'desc':
          'Sa ilang kultura, maaaring ituring na hindi magalang ang direktang pagtanggi. Sa ganitong sitwasyon, maaaring gumamit ng mas maingat o indirect na pagpapahayag.',
      'good': '"Maaaring kailanganin pa nating pag-isipan ito."',
      'point':
          'Ipinakikita nito na kailangang isaalang-alang ang kultura at background ng kausap sa pagpili ng wika at paraan ng pagpapahayag.',
    },
  ];

  // Interview, Pulong, at Tawag sa Telepono Section
  static const String interviewIntro =
      'Ang interview, pulong, at tawag sa telepono ay mga sitwasyong nangangailangan ng maingat at organisadong komunikasyon. Sa mga ganitong pagkakataon, maaaring magkaroon ng mahalagang epekto ang bawat salita at kilos sa resulta ng isang gawain, proyekto, relasyon sa kliyente, o proseso ng recruitment.\n\nDahil dito, mahalaga ang istrukturadong komunikasyon, aktibong pakikinig, at agarang pagtugon.';

  static const List<TermConceptItem> interviewTermList = [
    TermConceptItem(
      number: 1,
      title: 'Interview',
      description:
          'Isang pormal na pag-uusap na ginagamit upang suriin ang kakayahan, karanasan, o kwalipikasyon ng isang tao.',
      subItems: [
        'Structured - gumagamit ng mga pamantayang tanong.',
        'Unstructured - mas malaya at flexible ang daloy ng usapan.',
        'Behavioral - nakatuon sa mga nakaraang karanasan at kilos.',
      ],
    ),
    TermConceptItem(
      number: 2,
      title: 'Agenda',
      description: 'Ang agenda ay listahan ng mga paksang pag-uusapan sa isang pulong.',
    ),
    TermConceptItem(
      number: 3,
      title: 'Minutes ng Pulong',
      description:
          'Ang minutes ay talaan ng mahahalagang napag-usapan, desisyon, at iba pang mahahalagang detalye sa isang pulong.',
    ),
    TermConceptItem(
      number: 4,
      title: 'Aktibong Pakikinig',
      description:
          'Ang aktibong pakikinig ay pakikinig na may kasamang pag-unawa, pagsusuri, at wastong pagtugon sa mensahe.',
    ),
    TermConceptItem(
      number: 5,
      title: 'Paraphrasing',
      description:
          'Ang paraphrasing ay muling pagpapahayag ng ideya gamit ang sariling mga salita upang matiyak na tama ang pagkakaunawa sa mensahe.',
    ),
    TermConceptItem(
      number: 6,
      title: 'Call Etiquette',
      description:
          'Ang call etiquette ay tumutukoy sa mga pamantayan at wastong paraan ng pakikipag-usap sa telepono.',
    ),
  ];

  static const List<Map<String, String>> interviewImportanceList = [
    {
      'title': '1. Clarity of Roles and Tasks',
      'desc':
          'Nagbibigay ito ng malinaw na direksiyon sa mga gawain at nakatutulong upang maiwasan ang magkakapatong o nakakaligtaang responsibilidad.',
    },
    {
      'title': '2. Documentation and Accountability',
      'desc':
          'Nakakatulong ang wastong pagtatala upang magkaroon ng malinaw na batayan sa paggawa ng desisyon at pagsubaybay sa mga gawain.',
    },
    {
      'title': '3. Professional Impression',
      'desc':
          'Ipinakikita nito ang kahandaan at propesyonalismo, na mahalaga sa recruitment at pakikipag-ugnayan sa mga kliyente.',
    },
    {
      'title': '4. Time Management',
      'desc':
          'Ang organisadong komunikasyon ay nakatutulong sa mas mahusay na paggamit ng oras sa mga pulong at tawag.',
    },
  ];

  // Specific Situations: Interview, Pulong, Tawag
  static const Map<String, dynamic> starMethodExample = {
    'question': '"Paano mo hinarap ang isang mahirap na sitwasyon?"',
    'weak': '"Ginawa ko lang po ang best ko."',
    'star': {
      'S (Situation)': '"Nagkaroon ng delay sa project..."',
      'T (Task)': '"Responsibilidad kong ayusin ito..."',
      'A (Action)': '"Nakipag-coordinate ako sa team..."',
      'R (Result)': '"Natapos namin ito bago ang deadline."',
    },
    'point':
        'Ang paggamit ng STAR Method ay nagbibigay ng malinaw na estruktura sa sagot at tumutulong upang maipakita nang maayos ang isang karanasan.',
  };

  static const Map<String, dynamic> pulongExample = {
    'bad': {
      'situation': 'Walang itinakdang agenda.',
      'results': [
        'Paulit-ulit ang mga napag-uusapan.',
        'Walang malinaw na desisyon.',
        'Nasasayang ang oras.',
      ]
    },
    'good': {
      'features': [
        'May nakahandang agenda',
        'May itinatalagang facilitator',
        'Nagtatala ng minutes',
        'May malinaw na action items',
        'May nakatalagang responsibilidad at sapat na oras sa bawat paksa'
      ]
    }
  };

  static const List<Map<String, dynamic>> phoneCallExamples = [
    {
      'title': 'Customer Service Call',
      'bad': '"Sandali lang."',
      'good':
          '"Ilagay ko po kayo sa hold nang sandali habang chine-check ko ang impormasyon. Aabutin po ito ng humigit-kumulang isang minuto."',
      'point':
          'Ang pagbibigay ng malinaw na impormasyon at pagtatakda ng inaasahang oras ay nakatutulong upang maging mas maayos ang karanasan ng kausap.',
    },
    {
      'title': 'Aktibong Pakikinig sa Tawag (Reklamo ng Kliyente)',
      'bad': '"Sige po, noted."',
      'good':
          '"Kung tama ang aking pagkaunawa, nagkaroon po ng delay sa delivery at nais ninyo itong ma-resolve agad. Tama po ba?"',
      'point':
          'Ang paraphrasing ay nagpapakita na pinakinggan at sinikap na maunawaan nang tama ang mensahe ng kausap.',
    },
    {
      'title': 'Multitasking Error',
      'situation': 'Nakikinig sa isang tawag habang gumagawa ng ibang gawain.',
      'results': [
        'May mahahalagang detalyeng nakakaligtaan.',
        'Maaaring mali ang maisagawa na gawain.',
      ],
      'aral':
          'Ang aktibong pakikinig ay nangangailangan ng buong atensyon upang matiyak na tama ang pag-unawa at pagtugon sa mensahe.',
    },
  ];

  static const String conclusionSynthesis =
      'Ang wika at tono ay mahalagang pundasyon ng komunikasyon sa mga sitwasyong propesyonal tulad ng interview, pulong, at tawag sa telepono. Ang wastong pagpili ng wika at angkop na tono ay nakatutulong upang maging malinaw, magalang, at epektibo ang komunikasyon.\n\nKasabay nito, ang aktibong pakikinig ay isang mahalagang kasanayan sa iba\'t ibang sitwasyon. Sa interview, nakatutulong ito upang maunawaan nang tama ang mga tanong. Sa pulong, mahalaga ito sa pagtukoy ng mahahalagang impormasyon at desisyon. Sa tawag sa telepono, nakatutulong ito upang mabilis at wasto ang pagtugon sa problema.\n\nHigit pa rito, ang mabisang pakikilahok sa komunikasyon ay hindi lamang tungkol sa pagsasalita. Kasama rin dito ang pagtatanong, paglilinaw, pakikinig, at pagbibigay ng makabuluhang kontribusyon.\n\nSa kabuuan, ang wika, tono, konteksto, feedback, aktibong pakikinig, at wastong pakikilahok ay magkakaugnay na kasanayan na mahalaga sa pagbuo ng mabisang komunikasyong propesyonal.';
}