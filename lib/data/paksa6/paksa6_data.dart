class KatangianItem {
  final int number;
  final String title;
  final String description;
  final List<String>? bulletPoints;
  final String? badExample;
  final String? goodExample;
  final String? note;

  const KatangianItem({
    required this.number,
    required this.title,
    required this.description,
    this.bulletPoints,
    this.badExample,
    this.goodExample,
    this.note,
  });
}

class UriTeknikalItem {
  final int number;
  final String title;
  final String subtitle;
  final String description;
  final List<String> parts;
  final List<String> examples;

  const UriTeknikalItem({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.parts,
    required this.examples,
  });
}

class TekstongBiswalItem {
  final int number;
  final String title;
  final String description;
  final List<String> uses;
  final String bestUsedWhen;
  final String example;

  const TekstongBiswalItem({
    required this.number,
    required this.title,
    required this.description,
    required this.uses,
    required this.bestUsedWhen,
    required this.example,
  });
}

class PamantayanBiswalItem {
  final int number;
  final String title;
  final String description;
  final List<String>? guidelines;
  final String evaluationQuestion;

  const PamantayanBiswalItem({
    required this.number,
    required this.title,
    required this.description,
    this.guidelines,
    required this.evaluationQuestion,
  });
}

class Paksa6Data {
  static const String mainHeader = 'PAKSA 6: TEKNIKAL NA TEKSTO';
  static const String subtitle =
      'Araling Panlipunan • 2nd Term';

  static const String defBody =
      'Ang teknikal na teksto ay isang uri ng sulatin na naglalayong magpaliwanag, magturo, o maglahad ng tiyak na impormasyon tungkol sa isang proseso, produkto, sistema, o gawain. Karaniwan itong gumagamit ng pormal at obhetibong tono, maayos na pagkakasunod-sunod ng mga impormasyon, at mga terminong angkop sa isang partikular na larangan.';

  static const String katangianIntro =
      'Upang maging mabisa ang pagbasa at pagsulat ng teknikal na teksto, mahalagang isaalang-alang ang mga sumusunod na katangian:';

  // 6 Katangian ng Teknikal na Teksto
  static const List<KatangianItem> katangianList = [
    KatangianItem(
      number: 1,
      title: 'Nakaayon sa Mambabasa (Audience-Based)',
      description:
          'Ang teknikal na teksto ay hindi pare-pareho ang paraan ng paglalahad para sa lahat ng mambabasa. Dapat itong iangkop sa kaalaman, karanasan, at pangangailangan ng target na awdyens.',
      bulletPoints: [
        'Para sa mga Baguhan: Gumagamit ng mas payak na mga salita, ipinapaliwanag ang mga teknikal na termino, nagbibigay ng mas maraming halimbawa, at maaaring gumamit ng larawan o biswal.',
        'Para sa mga Bihasa: Mas direkta at teknikal ang wika, mas kaunti ang pagpapaliwanag, at mas detalyado ang mga specification o parameter.',
      ],
      note:
          'Halimbawa: Ang "Paano Mag-install ng App" para sa Grade 7 ay nagpapaliwanag muna ng kahulugan ng "download." Para naman sa ICT student, ginagamit agad ang mga terminong tulad ng APK, permissions, at storage access.',
    ),
    KatangianItem(
      number: 2,
      title: 'May Malinaw na Layunin (Goal-Driven)',
      description:
          'Ang bawat teknikal na teksto ay may tiyak na dahilan kung bakit ito isinulat. Kapag malinaw ang layunin, nagiging mas organisado ang nilalaman at mas madali itong sundan ng mambabasa.',
      bulletPoints: [
        'Magbigay ng panuto - how-to o procedures',
        'Magpaliwanag - konsepto o proseso',
        'Mag-ulat - resulta, findings, o obserbasyon',
        'Magmungkahi - proposal o plano',
      ],
    ),
    KatangianItem(
      number: 3,
      title: 'Tiyak, Malinaw, at Obhetibo',
      description:
          'Ang teknikal na teksto ay dapat gumamit ng eksaktong impormasyon, gaya ng sukat, bilang, hakbang, kondisyon, at inaasahang resulta. Dapat iwasan ang malalabo o hindi tiyak na salita tulad ng "siguro", "parang", "bahala na", o "tantya".',
      badExample: 'Dagdagan ng kaunting tubig.',
      goodExample: 'Dagdagan ng 50 mL na tubig.',
      note: 'Gumamit ng obhetibong tono na nakabatay sa datos at proseso sa halip na emosyon o personal na opinyon.',
    ),
    KatangianItem(
      number: 4,
      title: 'Organisado at May Malinaw na Estruktura',
      description:
          'Ang teknikal na teksto ay kailangang maayos ang pagkakaayos upang madaling makita at masundan ang mahahalagang impormasyon. Ang estruktura ay nagsisilbing "mapa" ng dokumento.',
      bulletPoints: [
        'Pamagat - nagsasaad kung tungkol saan ang dokumento',
        'Heading at Subheading - naghahati sa iba\'t ibang bahagi',
        'Bullet o Numbered Steps - nagpapakita ng pagkakasunod-sunod ng gawain',
        'Table, Graph, o Diagram - nagpapadali sa pag-unawa sa impormasyon',
      ],
    ),
    KatangianItem(
      number: 5,
      title: 'Gumagamit ng Angkop na Teknikal na Wika at Konsepto',
      description:
          'Gumagamit ng mga terminong partikular sa isang larangan tulad ng ICT, Science, Business, at iba pa. Mas eksakto ang kahulugan nito at mas mabilis naipapahayag ang impormasyon sa tamang awdyens.',
      note:
          'Kailangang ipaliwanag ang mga teknikal na termino kung ang mga mambabasa ay hindi pa pamilyar sa paksa.',
    ),
    KatangianItem(
      number: 6,
      title: 'Madalas na Multimodal',
      description:
          'Ang teknikal na teksto ay kadalasang gumagamit ng iba\'t ibang uri ng biswal (flowchart, infographic, diagram, icons, graph, table) upang higit na maging malinaw ang impormasyon.',
      note:
          'Ang mga biswal ay hindi lamang dekorasyon—bahagi sila ng pagpapaliwanag upang mas mabilis maunawaan ang proseso o datos.',
    ),
  ];

  static const String uriTeknikalIntro =
      'Sa pag-aaral ng iba\'t ibang uri ng teknikal na teksto, mas mauunawaan kung paano bumuo ng sulating angkop sa isang partikular na sitwasyon, mambabasa, at layunin:';

  // 6 Uri ng Teknikal na Teksto
  static const List<UriTeknikalItem> uriTeknikalList = [
    UriTeknikalItem(
      number: 1,
      title: 'Tekstong Instruksiyonal',
      subtitle: 'Gabay sa Proseso',
      description:
          'Naglalahad ng sunod-sunod na hakbang upang maisagawa nang tama at ligtas ang isang gawain.',
      parts: [
        'Layunin ng gawain',
        'Mga kinakailangang materyales o kagamitan',
        'Sunod-sunod na panuto',
        'Mga paalala o babala',
        'Inaasahang resulta',
      ],
      examples: [
        'Hakbang sa paggawa ng academic email',
        'Paraan ng pag-format ng research paper',
      ],
    ),
    UriTeknikalItem(
      number: 2,
      title: 'Manwal',
      subtitle: 'Gabay sa Paggamit ng Kagamitan o Sistema',
      description:
          'Dokumentong nagbibigay ng impormasyon tungkol sa tamang paggamit ng isang produkto, application, device, o system.',
      parts: [
        'Overview ng produkto',
        'Mga bahagi o feature at gamit ng bawat isa',
        'Step-by-step instructions',
        'Troubleshooting (mga karaniwang problema at solusyon)',
        'Safety notes o warnings',
      ],
      examples: [
        'User Guide ng printer',
        'Gabay sa paggamit ng eLMS',
      ],
    ),
    UriTeknikalItem(
      number: 3,
      title: 'Ulat Teknikal',
      subtitle: 'Ulat na Nakabatay sa Datos',
      description:
          'Naglalahad ng resulta ng isang pag-aaral, pagsubok, obserbasyon, o survey gamit ang malinaw at organisadong datos.',
      parts: [
        'Pamagat at layunin',
        'Metodo o pamamaraan',
        'Datos (na maaaring ilahad sa table o graph)',
        'Interpretasyon o talakayan',
        'Konklusyon at Rekomendasyon',
      ],
      examples: [
        'Ulat sa survey tungkol sa study habits ng Grade 11',
        'Resulta ng isang simpleng eksperimento',
      ],
    ),
    UriTeknikalItem(
      number: 4,
      title: 'Proposal o Panukala',
      subtitle: 'Plano para sa Solusyon o Proyekto',
      description:
          'Teknikal na dokumentong nagmumungkahi ng proyekto o solusyon sa isang problema at naglalahad kung paano ito maisasagawa.',
      parts: [
        'Background o paglalarawan ng problema',
        'Layunin at Target na benepisyaryo',
        'Plano ng gawain o timeline',
        'Badyet at kinakailangang resources',
        'Inaasahang output at epekto',
      ],
      examples: [
        'Panukala para sa reading corner',
        'Waste segregation project sa classroom',
      ],
    ),
    UriTeknikalItem(
      number: 5,
      title: 'Product Specifications o Technical Description',
      subtitle: 'Paglalarawan ng Katangian ng Produkto',
      description:
          'Naglilista ng mahahalagang detalye tungkol sa isang produkto o system. Naiiba ito sa manwal dahil ang layunin nito ay ilahad ang katangian, hindi ang magturo kung paano gamitin.',
      parts: [
        'Model o pangalan',
        'Features at functions',
        'Sukat, timbang, o capacity',
        'Performance specifications',
        'Limitations o compatibility',
      ],
      examples: [
        'Specs sheet ng laptop para sa ICT',
        'Technical description ng science equipment',
      ],
    ),
    UriTeknikalItem(
      number: 6,
      title: 'Memorandum, Pormal na Email, o Notice',
      subtitle: 'Komunikasyong Pang-institusyon',
      description:
          'Maikling teknikal na komunikasyong ginagamit upang magbigay ng abiso, patakaran, direksiyon, o kahilingan sa akademiko o workplace setting.',
      parts: [
        'Paksa o subject',
        'Konteksto o dahilan ng mensahe',
        'Tiyak na aksiyong kailangang gawin',
        'Deadline, petsa, o taong responsable',
      ],
      examples: [
        'Memo tungkol sa submission ng outputs',
        'Email para sa request ng certification',
      ],
    ),
  ];

  static const String tekstongBiswalIntro =
      'Ang tekstong biswal ay gumagamit ng mga larawan, simbolo, layout, kulay, graph, chart, at iba pang biswal na elemento upang maihatid ang impormasyon nang mabilis at malinaw.';

  // 6 Uri ng Tekstong Biswal
  static const List<TekstongBiswalItem> biswalList = [
    TekstongBiswalItem(
      number: 1,
      title: 'Infographic',
      description:
          'Pinagsasama ang maikling teksto, larawan o icon, at organisadong layout upang maipakita ang mahahalagang impormasyon sa paraang mabilis maunawaan.',
      uses: [
        'Pagbubuod - pinaiikli ang mahaba o komplikadong impormasyon',
        'Pagpapalinaw - ipinapakita ang pinakamahahalagang punto',
        'Pagpapadali ng pagkatuto - madaling balikan bilang review material',
        'Pagpapakita ng ugnayan - sanhi at bunga, problema at solusyon, o paghahambing',
      ],
      bestUsedWhen:
          'Kapag maraming impormasyon ang kailangang ipakita ngunit kailangang manatiling maikli, malinaw, at madaling tandaan.',
      example: '"Mga Katangian ng Teknikal na Teksto" o "Mga Uri ng Teknikal na Teksto."',
    ),
    TekstongBiswalItem(
      number: 2,
      title: 'Flowchart',
      description:
          'Nagpapakita ng sunod-sunod na proseso gamit ang mga kahon, arrow, at simbolo. Maaari rin itong magkaroon ng decision points ("oo" o "hindi"). Nagsisilbing mapa ng proseso.',
      uses: [
        'Pagpapakita ng sequence (una, kasunod, huli)',
        'Pagpapakita ng desisyon batay sa kondisyon',
        'Pag-iwas sa kalituhan sa panuto',
        'Pagpapakita ng alternatibong ruta',
      ],
      bestUsedWhen:
          'Kapag ang proseso ay may branching o mga sitwasyong "kung... kung hindi..."',
      example:
          'Pag-submit ng output sa eLMS kung saan maaaring maging successful ang upload o magkaroon ng error.',
    ),
    TekstongBiswalItem(
      number: 3,
      title: 'Dayagram (Diagram)',
      description:
          'Biswal na paglalarawan ng mga bahagi, estruktura, o ugnayan ng mga elemento ng isang bagay o konsepto. Karaniwang may labels at arrows.',
      uses: [
        'Pagkilala sa mga bahagi (components)',
        'Pag-unawa sa estruktura kung paano nabubuo ang bagay',
        'Pagpapakita ng relasyon at tungkulin ng bahagi',
        'Paglilinaw ng abstraktong konsepto upang maging konkreto',
      ],
      bestUsedWhen:
          'Kapag mahalagang makita ang mga bahagi at ang kanilang posisyon o relasyon.',
      example: 'Anatomiya ng academic email o mga bahagi ng technical report.',
    ),
    TekstongBiswalItem(
      number: 4,
      title: 'Talahanayan (Table)',
      description:
          'Nag-oorganisa ng impormasyon gamit ang mga row at column upang maging mas madali ang paghahambing, pag-uuri, at paghahanap ng detalye.',
      uses: [
        'Paghahambing (hal. Manual vs. Product Specification)',
        'Pag-uuri (uri, layunin, at halimbawa)',
        'Pagpapasimple ng maraming detalye o checklist',
        'Mabilis na pagkuha ng impormasyon sa pag-scan',
      ],
      bestUsedWhen:
          'Kapag maraming datos o impormasyon ang kailangang paghambingin o ikategorya.',
      example: 'Talahanayan ng katangian ng iba\'t ibang uri ng teknikal na teksto.',
    ),
    TekstongBiswalItem(
      number: 5,
      title: 'Graph o Chart',
      description:
          'Gumagamit ng bar, line, pie, at iba pang anyo upang ipakita ang trend, dami, pagkakaiba, o proporsyon ng mga datos.',
      uses: [
        'Pagpapakita ng trend (pagtaas, pagbaba sa paglipas ng panahon)',
        'Paghahambing ng dami (mas marami o mas kaunti)',
        'Pagpapakita ng porsyento o bahagi ng kabuuan (pie chart)',
        'Pagpapalinaw ng resulta ng survey o ulat',
      ],
      bestUsedWhen:
          'Kapag may numerical data at kailangang makita agad ang pattern o pagkakaiba.',
      example: 'Bar graph ng marka ng mag-aaral o pie chart ng badyet sa proyekto.',
    ),
    TekstongBiswalItem(
      number: 6,
      title: 'Simbolo at Tanda (Icons / Labels)',
      description:
          'Maliliit na simbolo o maiikling tag na nagsisilbing palatandaan upang mabilis na maipakita ang kahulugan, kategorya, babala, o direksiyon.',
      uses: [
        'Pagbibigay ng babala o caution',
        'Pag-uuri ng impormasyon ("Tip", "Reminder", "Step", "Do/Don\'t")',
        'Pagpapadali ng navigation sa dokumento',
        'Pagbabawas ng cognitive load sa mambabasa',
      ],
      bestUsedWhen:
          'Kapag kailangan ng mabilisang paalala, emphasis, o pare-parehong pagkakategorya sa handout o guide.',
      example: 'Warning icons sa manwal o check/cross marks sa safety guide.',
    ),
  ];

  static const String pamantayanIntro =
      'Hindi sapat na maganda lamang ang disenyo ng isang tekstong biswal. Dapat din itong maging malinaw, tumpak, organisado, madaling basahin, at kapaki-pakinabang. Narito ang 9 na pamantayan:';

  // 9 Pamantayan ng Epektibong Tekstong Biswal
  static const List<PamantayanBiswalItem> pamantayanList = [
    PamantayanBiswalItem(
      number: 1,
      title: 'Malinaw ang Layunin at Mensahe',
      description:
          'Dapat ay agad na mauunawaan ng mambabasa kung ano ang ipinapakita ng biswal at kung bakit ito mahalaga. Iwasan ang paglalagay ng sobrang impormasyon na hindi kailangan.',
      evaluationQuestion:
          'Pagsusuri: "Kung babasahin ito ng mambabasa sa loob ng 10 segundo, mauunawaan ba niya ang pangunahing punto?"',
    ),
    PamantayanBiswalItem(
      number: 2,
      title: 'Tama ang Pagpili ng Uri ng Biswal',
      description:
          'Dapat piliin ang uri ng biswal na pinakaangkop sa content (Flowchart para sa proseso, Table para sa paghahambing, Graph para sa numerical data, Diagram para sa bahagi, Infographic para sa buod).',
      evaluationQuestion:
          'Pagsusuri: "Ang biswal ba ang pinakamabilis at pinakamalinaw na paraan upang ipaliwanag ang content na ito?"',
    ),
    PamantayanBiswalItem(
      number: 3,
      title: 'May Malinaw na Hierarchy at Daloy ng Pagbasa',
      description:
          'Dapat malinaw kung paano susundan ng mata ng mambabasa ang impormasyon gamit ang pamagat, subheadings, sapat na spacing, maayos na alignment, at numbering.',
      evaluationQuestion:
          'Pagsusuri: "Kapag sinundan ko ang daloy ng aking mata, tama ba ang pagkakasunod-sunod ng impormasyon?"',
    ),
    PamantayanBiswalItem(
      number: 4,
      title: 'Konsistent at Tumpak ang Labels, Simbolo, at Termino',
      description:
          'Ang lahat ng labels at termino ay dapat pare-pareho ang format, tama ang spelling, tama ang termino, at pare-pareho ang tawag sa iisang bagay.',
      evaluationQuestion:
          'Pagsusuri: "May mga terminong nagbabago ba ang tawag sa ibang bahagi ng biswal?"',
    ),
    PamantayanBiswalItem(
      number: 5,
      title: 'May Tamang Unit, Scale, at Source ng Datos',
      description:
          'Para sa table, graph, at chart, kailangang tiyakin na nakalagay ang unit (gaya ng %, minutes), tama ang scale, at nakalagay ang sample size (halimbawa n = 30).',
      evaluationQuestion:
          'Pagsusuri: "May sapat bang impormasyon upang maipaliwanag at ma-interpret nang tama ang datos?"',
    ),
    PamantayanBiswalItem(
      number: 6,
      title: 'Readability: Madaling Basahin at Hindi Masikip',
      description:
          'Iwasan ang sobrang liit na teksto, gumamit ng maiikling parirala, magkaroon ng sapat na white space, at iwasan ang labis na dekorasyon.',
      evaluationQuestion:
          'Pagsusuri: "Kung ipi-print ito sa bond paper, mababasa pa rin ba ito nang malinaw?"',
    ),
    PamantayanBiswalItem(
      number: 7,
      title: 'Relevance: Bawat Elemento ay May Gamit',
      description:
          'Ang bawat larawan, icon, kulay, linya, o kahon ay dapat may malinaw na function (magpaliwanag, magpakita ng relasyon, gumabay, o magbigay-diin).',
      evaluationQuestion:
          'Pagsusuri: "Kung aalisin ko ang elementong ito, may mahalagang kahulugan bang mawawala?"',
    ),
    PamantayanBiswalItem(
      number: 8,
      title: 'Accessibility at Inclusiveness',
      description:
          'Iwasang umasa sa kulay lamang sa pagpapakita ng pagkakaiba (gumamit ng labels). Huwag iugnay ang kulay sa stereotype. Gumamit ng malinaw na contrast at madaling basahing font.',
      evaluationQuestion:
          'Pagsusuri: "Kung black-and-white ang kopya, maiintindihan pa rin ba ang impormasyon?"',
    ),
    PamantayanBiswalItem(
      number: 9,
      title: 'Katumpakan at Pagpapatunay (Accuracy)',
      description:
          'Dahil ang biswal ay bahagi ng teknikal na teksto, kailangang suriin ang spelling ng labels, i-validate ang numero, at tiyaking tama at kumpleto ang arrows at steps.',
      evaluationQuestion:
          'Pagsusuri: "Kung susundin ng mambabasa ang biswal, makararating ba siya sa tamang output o resulta?"',
    ),
  ];

  static const String buodBody =
      'Ang teknikal na teksto ay nakatuon sa malinaw, tiyak, organisado, at obhetibong paglalahad ng impormasyon. Dapat itong iangkop sa mambabasa, may malinaw na layunin, gumagamit ng angkop na teknikal na termino, at maaaring samahan ng mga tekstong biswal upang higit na mapadali ang pag-unawa.\n\nSamantala, ang tekstong biswal ay gumagamit ng infographic, flowchart, diagram, table, graph, chart, icons, at labels upang maipakita ang impormasyon sa mas mabilis at malinaw na paraan. Ang epektibong tekstong biswal ay hindi lamang kaaya-ayang tingnan—higit sa lahat, kailangan itong maging malinaw, organisado, tumpak, madaling basahin, angkop sa layunin, accessible, at kapaki-pakinabang sa mambabasa.';
}