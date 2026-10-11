class KasanayanItem {
  final String number;
  final String title;
  final String description;
  final String example;

  const KasanayanItem({
    required this.number,
    required this.title,
    required this.description,
    required this.example,
  });
}

class ContextItem {
  final String title;
  final String description;
  final List<String> examples;

  const ContextItem({
    required this.title,
    required this.description,
    required this.examples,
  });
}

class BiasWordItem {
  final String number;
  final String title;
  final String description;
  final String example;

  const BiasWordItem({
    required this.number,
    required this.title,
    required this.description,
    required this.example,
  });
}

class BiasTechniqueItem {
  final String number;
  final String title;
  final String description;
  final String uri;
  final String example;
  final String explanation;

  const BiasTechniqueItem({
    required this.number,
    required this.title,
    required this.description,
    required this.uri,
    required this.example,
    required this.explanation,
  });
}

class Paksa2Data {
  static const String mainHeader =
      'MABISANG KOMUNIKASYON SA SOSYAL AT KULTURAL NA PANANAW';
  static const String mainTitle = 'KRITIKAL NA KASANAYAN SA KOMUNIKASYON';
  static const String subtitle = 'Araling Panlipunan • 1st Term';

  static const String introBody =
      'Ang kritikal na kasanayan sa komunikasyon ay kakayahang magsuri, magtanong, '
      'magbigay ng makatwirang hatol, at magbigay-kahulugan sa mga mensaheng naririnig o '
      'nababasa. Hindi sapat na marinig o mabasa lamang ang isang mensahe. Mahalaga '
      'ring suriin kung malinaw ang lohika nito, kung makatarungan ang paglalahad, at kung '
      'may pagkiling o bias sa impormasyon.';

  static const List<String> introExamples = [
    'Sa klase, nakinig ang mga mag-aaral sa isang pampublikong talumpati ng isang '
        'lokal na politiko. Sa pamamagitan ng kritikal na pakikinig, maaaring suriin kung '
        'ang mga ipinangakong programa ay may sapat na batayan o higit na nakatuon '
        'sa emosyonal na panghihikayat.',
    'Sa pagbabasa ng isang artikulo tungkol sa social media, mahalagang suriin kung '
        'ang mga impormasyong inilalahad ay sinusuportahan ng datos o batay lamang '
        'sa personal na opinyon ng manunulat.',
  ];

  static const String kasanayanHeading = 'Mga Kritikal na Kasanayan sa Komunikasyon';
  static const List<KasanayanItem> kasanayanList = [
    KasanayanItem(
      number: '1',
      title: 'Kritikal na Pakikinig',
      description:
          'Ito ay pakikinig na may kasamang pagsusuri at pag-iisip, sa halip na basta tanggapin lamang ang mensahe.',
      example:
          'Habang nakikinig sa isang talumpati ng politiko, maaaring suriin ng mag-aaral kung alin sa mga ipinangako ang sinusuportahan ng datos at alin ang pangunahing gumagamit ng emosyonal na panghihikayat.',
    ),
    KasanayanItem(
      number: '2',
      title: 'Kritikal na Pagbasa',
      description:
          'Ito ay pagbasa na hindi lamang nakatuon sa nilalaman ng teksto kundi pati sa layunin, pananaw, at pinagmulan ng manunulat.',
      example:
          'Sa pagbabasa ng artikulo tungkol sa climate change, maaaring tingnan kung ito ay nagmula sa isang scientific journal na may kredibilidad o sa isang post sa social media na maaaring may kinikilingan.',
    ),
    KasanayanItem(
      number: '3',
      title: 'Kritikal na Panonood',
      description:
          'Ito ay panonood na may kamalayan sa pagsusuri ng mensahe, mga simbolo, at paraan ng representasyon na ginagamit sa isang palabas o materyal.',
      example:
          'Sa panonood ng isang patalastas para sa beauty product, maaaring mapansin kung ipinapakita nito na ang konsepto ng "maganda" ay nakaugnay lamang sa pagiging maputi. Maaari itong magpakita ng isang cultural bias.',
    ),
    KasanayanItem(
      number: '4',
      title: 'Kritikal na Pagsasalita',
      description:
          'Ito ay pagpapahayag ng sariling opinyon na may sapat na batayan habang isinasaalang-alang at iginagalang ang pananaw ng iba.',
      example:
          'Sa isang debate sa klase, hindi lamang basta magbibigay ng argumento ang mag-aaral. Maghahain din siya ng datos o ebidensya at igagalang ang pananaw ng kaniyang mga kaklase.',
    ),
  ];

  static const String sosyoKulturalHeading =
      'Iba\'t Ibang Sosyal at Kultural na Pananaw sa Komunikasyon';
  static const String sosyoKulturalIntro =
      'Ang komunikasyon ay hindi lamang simpleng pagpapalitan ng salita o ideya. Ito ay '
      'naiimpluwensiyahan ng mga kalagayang panlipunan at kultural na humuhubog sa '
      'paraan ng pagpapahayag at pag-unawa sa mga mensahe.\n\n'
      'Ang kontekstong sosyal ay nakabatay sa relasyon ng mga tao at sa paraan ng '
      'kanilang pakikipag-ugnayan. Samantala, ang kontekstong kultural ay nakaugat sa '
      'mga paniniwala, kaugalian, pagpapahalaga, at tradisyon ng isang lipunan.';

  static const String sosyalSubheading = '1. Kontekstong Sosyal';
  static const List<ContextItem> kontekstoSosyalList = [
    ContextItem(
      title: 'Relasyon ng mga Kalahok',
      description:
          'Ang uri ng relasyon ng mga taong nag-uusap—gaya ng pamilya, magkakaibigan, guro at mag-aaral, o amo at empleyado—ay nakaaapekto sa antas ng pormalidad, tono, at paraan ng komunikasyon.\n\n'
          'Sa malapit na relasyon, karaniwang ginagamit ang mas impormal na wika. Sa pormal na relasyon naman, mas maingat ang pagpili ng mga salita.',
      examples: [
        'Sa pamilya: "Kumain ka na ba?"',
        'Sa opisina: "Magandang umaga po. Nais ko lamang ipaalam ang update tungkol sa proyekto."',
      ],
    ),
    ContextItem(
      title: 'Social Dynamics o Panlipunang Dinamika',
      description:
          'Tumutukoy ito sa kapangyarihan, katayuan, at papel ng bawat tao sa isang interaksyon. Ang posisyon ng isang tao sa isang grupo o lipunan ay maaaring makaapekto sa paraan ng kaniyang pagsasalita at pakikinig.',
      examples: [
        'Maaaring maging mas magalang at maingat ang isang estudyante kapag nakikipag-usap sa punong-guro kaysa sa pakikipag-usap sa kaniyang kaklase.',
        'Sa barkadahan, maaaring gumamit ng slang, biruan, o impormal na pananalita na hindi karaniwang ginagamit sa isang pormal na pagtitipon.',
      ],
    ),
    ContextItem(
      title: 'Layunin ng Komunikasyon',
      description:
          'Ang layunin o dahilan ng isang usapan ay nakaaapekto sa paraan ng paghahatid ng mensahe. Maaaring ang layunin ay magbigay ng utos, magpayo, magpatawa, magtanong, o magbahagi ng impormasyon.',
      examples: [
        'Sa pagtuturo: "Pakiulit ang sagot mo para mas malinaw sa klase."',
        'Sa pagbibiro: "Ang talino mo naman, ikaw na ang next teacher!"',
      ],
    ),
  ];

  static const String kulturalSubheading = '2. Kontekstong Kultural';
  static const List<ContextItem> kontekstoKulturalList = [
    ContextItem(
      title: 'Pananaw at Paniniwala',
      description:
          'Ang mga paniniwala ng isang tao, kabilang ang kaniyang pananaw sa moralidad at relihiyon, ay maaaring makaimpluwensiya sa kaniyang interpretasyon ng isang mensahe.\n\n'
          'Dahil magkakaiba ang kultural na pinagmulan ng mga tao, maaaring maging positibo ang kahulugan ng isang mensahe para sa isang tao ngunit iba naman ang interpretasyon nito para sa iba.',
      examples: [
        'Para sa maraming Pilipino, ang tanong na "Kumain ka na ba?" ay maaaring isang simpleng paraan ng pangungumusta o pagpapakita ng pag-aalala.',
        'Para naman sa isang dayuhan, maaaring hindi agad malinaw kung bakit ito ang ginagamit na pagbati sa halip na "How are you?"',
      ],
    ),
    ContextItem(
      title: 'Kaugalian at Pamantayan',
      description:
          'Ang mga nakasanayang paraan ng pakikipag-ugnayan sa isang kultura ay nagsisilbing batayan kung ano ang itinuturing na angkop at katanggap-tanggap na komunikasyon.',
      examples: [
        'Sa kulturang Pilipino, karaniwang ginagamit ang "po" at "opo" upang magpakita ng paggalang sa nakatatanda.',
        'Sa ilang konteksto sa Amerika, hindi karaniwang kailangan ang ganitong paggamit ng mga salita, at maaaring direktang tawagin sa pangalan ang isang nakatatanda.',
      ],
    ),
    ContextItem(
      title: 'Kultural na Pagkakaiba',
      description:
          'Kapag nakikipag-ugnayan ang mga taong may magkakaibang kultura, mahalagang maging sensitibo at bukas sa kanilang pagkakaiba. Ang kakulangan sa cultural sensitivity ay maaaring humantong sa hindi pagkakaunawaan.',
      examples: [
        'Sa Japan, mahalagang paraan ng pagbati ang pagyuko. Sa Pilipinas naman, maaaring gamitin ang pagngiti o pagmamano bilang pagpapakita ng paggalang.',
        'Sa ilang kulturang Kanluranin, maaaring karaniwan ang direktang pagsagot ng "No." Sa ilang kulturang Asyano, maaaring gumamit ng mas maingat o malambot na paraan ng pagtanggi upang maiwasang makasakit ng damdamin.',
      ],
    ),
    ContextItem(
      title: 'Wika at Simbolismo',
      description:
          'Ang wika, diyalekto, at mga simbolo ay malapit na nauugnay sa kultura. Ang isang salita, kilos, o ekspresyon ay maaaring magkaroon ng magkakaibang kahulugan depende sa kultural na pinagmulan ng gumagamit.',
      examples: [
        'Sa ilang rehiyon o kultura, ang pagtango ay maaaring nangangahulugang "oo," samantalang sa ibang kultura ay maaari itong magkaroon ng ibang kahulugan.',
        'Sa Pilipinas, ang paggamit ng "kuya" at "ate" ay maaaring magpahiwatig ng paggalang. Wala itong eksaktong katumbas na gamit sa ilang ibang bansa.',
      ],
    ),
  ];

  static const String ibaPangKontekstoHeading = 'Iba Pang Konteksto sa Komunikasyon';
  static const List<ContextItem> ibaPangKontekstoList = [
    ContextItem(
      title: '1. Pamilyal na Konteksto',
      description:
          'Ito ay tumutukoy sa komunikasyong nagaganap sa loob ng pamilya at karaniwang naiimpluwensiyahan ng kultura, tradisyon, at relasyon ng mga miyembro nito.',
      examples: [
        'Sa halip na direktang tumanggi sa utos ng magulang, maaaring sabihin ng anak: "Sige po, pero baka po mas mainam kung..."',
      ],
    ),
    ContextItem(
      title: '2. Pang-relihiyong Konteksto',
      description:
          'Ito ay tumutukoy sa mga pananaw at paraan ng pagpapahayag na nakabatay sa espirituwal o relihiyosong paniniwala.',
      examples: [
        'Sa isang talakayan tungkol sa kasal ng parehong kasarian, maaaring maglahad ang isang mag-aaral ng pananaw na nakabatay sa kaniyang relihiyosong perspektibo o sa doktrina ng kaniyang simbahan.',
      ],
    ),
    ContextItem(
      title: '3. Pang-ekonomikong Konteksto',
      description:
          'Ito ay komunikasyong maaaring maimpluwensiyahan ng kalagayan sa buhay, kabuhayan, at mga oportunidad ng isang tao.',
      examples: [
        'Ang isang mag-aaral mula sa pamilyang may limitadong pinansiyal na kakayahan ay maaaring higit na magbigay-pansin sa usapin ng "libreng edukasyon" kaysa sa usapin ng "foreign travel."',
      ],
    ),
    ContextItem(
      title: '4. Pang-pulitikal na Konteksto',
      description:
          'Ito ay komunikasyong maaaring maimpluwensiyahan ng mga ideya, pananaw, at paniniwala tungkol sa pamahalaan at mga usaping pampubliko.',
      examples: [
        'Sa talakayan tungkol sa Martial Law, maaaring magbahagi ang isang estudyante ng pananaw na batay sa mga kuwentong narinig niya mula sa kaniyang lolo at lola.',
      ],
    ),
    ContextItem(
      title: '5. Pang-kultural at Etnikong Konteksto',
      description:
          'Ito ay pakikipag-ugnayan na naiimpluwensiyahan ng etnisidad, tradisyon, wika, at paniniwala ng isang partikular na grupo.',
      examples: [
        'Ang isang Cebuano ay maaaring mas komportableng gumamit ng Bisaya kapag nakikipag-usap sa mga miyembro ng kaniyang pamilya.',
      ],
    ),
  ];

  static const String biasHeading = 'HUDYAT na Nagpapahiwatig ng Pagkiling o Bias';
  static const String biasIntro =
      'Ang bias ay tumutukoy sa pagkiling ng isang mensahe pabor o laban sa isang tao, '
      'grupo, ideya, o sitwasyon. Maaari itong makita sa paraan ng paggamit ng wika, gaya ng '
      'loaded words, sarcasm, at labeling.';

  static const String biasWordsSubheading = 'Mga Salitang Maaaring Magpahiwatig ng Bias';
  static const List<BiasWordItem> biasWordsList = [
    BiasWordItem(
      number: '1',
      title: 'Pinakamahusay / Pinakamabuti',
      description:
          'Nagsasaad ito ng napakataas na positibong pagtingin kahit walang malinaw na batayan o pamantayan.',
      example:
          'Halimbawa: "Siya ang pinakamahusay na guro sa lahat."\n(Maaaring itanong kung paano nasukat o napatunayan ang ganitong pahayag.)',
    ),
    BiasWordItem(
      number: '2',
      title: 'Walang Kapantay',
      description:
          'Ipinahihiwatig nito na ang isang tao o bagay ay natatangi o higit sa lahat kahit walang sapat na ebidensya.',
      example: 'Halimbawa: "Ang kaniyang kagandahan ay walang kapantay."',
    ),
    BiasWordItem(
      number: '3',
      title: 'Napakasama / Nakakakilabot',
      description:
          'Nagpapahayag ito ng matinding negatibong paghatol na maaaring nakabatay sa personal o emosyonal na pananaw.',
      example: 'Halimbawa: "Napakasama ng serbisyong natanggap ko sa restawran."',
    ),
    BiasWordItem(
      number: '4',
      title: 'Dapat / Nararapat',
      description:
          'Maaaring magpahiwatig ito ng pamantayan o inaasahang kilos na nakabatay sa pananaw ng nagsasalita.',
      example: 'Halimbawa: "Dapat siyang manalo dahil siya ang sikat."',
    ),
    BiasWordItem(
      number: '5',
      title: 'Sobra / Labis',
      description:
          'Ito ay ginagamit upang palakasin o gawing mas matindi ang paglalarawan o opinyon.',
      example: 'Halimbawa: "Sobrang kabait ng batang iyon."',
    ),
    BiasWordItem(
      number: '6',
      title: 'Higit / Mas Mabuti',
      description:
          'Nagpapakita ito ng paghahambing na maaaring mangailangan ng sapat na datos upang mapatunayan.',
      example: 'Halimbawa: "Mas mabuti ang mga kabataan noon kaysa ngayon."',
    ),
    BiasWordItem(
      number: '7',
      title: 'Nakakaawa / Kawawa',
      description:
          'Maaaring magpahiwatig ito ng matinding simpatya na maaaring makaapekto sa paraan ng paghatol sa isang sitwasyon.',
      example: 'Halimbawa: "Kawawa naman siya, kaya iboto na lang natin."',
    ),
    BiasWordItem(
      number: '8',
      title: 'Napakaganda / Napakahusay',
      description:
          'Ito ay matinding papuri na maaaring hindi sinusuportahan ng malinaw na pamantayan o ebidensya.',
      example: 'Halimbawa: "Napakaganda ng programang ito."',
    ),
    BiasWordItem(
      number: '9',
      title: 'Malinaw / Tiyak na',
      description:
          'Ipinahihiwatig nito ang mataas na antas ng katiyakan kahit maaari pa ring magkaroon ng ibang interpretasyon o pananaw.',
      example: 'Halimbawa: "Tiyak na siya ang may sala."',
    ),
    BiasWordItem(
      number: '10',
      title: 'Lubos / Ganap',
      description:
          'Nagpapahayag ito ng sukdulang antas ng isang damdamin o pananaw na hindi naman laging obhetibo.',
      example: 'Halimbawa: "Ako ay may lubos na tiwala sa kanya."',
    ),
  ];

  static const String biasTechniquesSubheading =
      'Mga Teknik o Paraan ng Pagpapahayag ng Pagkiling';
  static const List<BiasTechniqueItem> biasTechniquesList = [
    BiasTechniqueItem(
      number: '1',
      title: 'Labeling Words',
      description: 'Pagbibigay ng positibo o negatibong tatak sa isang tao o bagay.',
      uri: 'Paglalagay ng tatak / Panghuhusga',
      example: '"Huwag na nating iboto si Juan, tamad at iresponsable siya."',
      explanation:
          'Sa pahayag na ito, ginamit ang mga salitang "tamad" at "iresponsable" bilang negatibong paglalarawan o hatol sa isang tao.',
    ),
    BiasTechniqueItem(
      number: '2',
      title: 'Loaded Words',
      description:
          'Mga salitang may matinding emosyonal na dating at maaaring magdulot ng simpatya, galit, takot, o iba pang matinding damdamin.',
      uri: 'Emosyonal na Pagpapahayag',
      example:
          '"Kung hindi tayo kikilos ngayon, magiging biktima tayo ng ganid at mapang-abusong mga lider."',
      explanation:
          'Ang mga salitang "ganid" at "mapang-abuso" ay may mabigat na emosyonal na kahulugan na maaaring makaapekto sa pagtanggap ng tagapakinig sa mensahe.',
    ),
    BiasTechniqueItem(
      number: '3',
      title: 'Sarcasm o Panunuya',
      description:
          'Pahayag na maaaring magmukhang biro o papuri ngunit naglalaman ng pang-uuyam o hindi direktang panlalait.',
      uri: 'Pang-aalipusta / Hindi direktang panlait',
      example: '"Wow, ang aga mo ah! Siguro ikaw na ang model student ng taon."',
      explanation:
          'Sa unang tingin ay tila papuri ito, ngunit maaaring ginagamit ang pahayag upang tuyain ang isang kaklaseng palaging nahuhuli.',
    ),
    BiasTechniqueItem(
      number: '4',
      title: 'Generalisasyon',
      description:
          'Pagbibigay ng pangkalahatang hatol tungkol sa isang buong grupo nang walang sapat na ebidensya o batayan.',
      uri: 'Stereotyping / Pangkalahatang Hatol',
      example:
          '"Lahat ng kabataan ngayon ay puro gadgets lang ang inaatupag at wala nang pakialam sa pag-aaral."',
      explanation:
          'Hindi nito isinasaalang-alang ang pagkakaiba-iba ng mga kabataan at ipinapalagay na pare-pareho silang kumikilos.',
    ),
    BiasTechniqueItem(
      number: '5',
      title: 'Black-and-White Thinking',
      description:
          'Pagtingin sa isang usapin na para bang dalawa lamang ang posibleng panig—mabuti o masama, tama o mali, pabor o laban—nang hindi isinasaalang-alang ang mga posibleng nasa pagitan.',
      uri: 'Dichotomous Thinking / Extreme Bias',
      example:
          '"Kung hindi ka sumusuporta sa kandidato ko, ibig sabihin ay kalaban ka ng bayan."',
      explanation:
          'Ipinapakita ng pahayag ang isang sitwasyong parang dalawa lamang ang pagpipilian: pabor o laban. Hindi nito isinasaalang-alang ang iba pang posibleng pananaw o posisyon.',
    ),
  ];
}