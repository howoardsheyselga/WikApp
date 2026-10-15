class TextTypeItem {
  final String number;
  final String title;
  final String description;
  final List<String> examples;
  final String? sampleTitle;
  final String sampleText;
  final String? sampleTitle2;
  final String? sampleText2;

  const TextTypeItem({
    required this.number,
    required this.title,
    required this.description,
    required this.examples,
    this.sampleTitle,
    required this.sampleText,
    this.sampleTitle2,
    this.sampleText2,
  });
}

class AssessmentElementItem {
  final String number;
  final String title;
  final String description;
  final String sitwasyon;
  final String feedbackType; // 'Peer Assessment' or 'Self-Assessment'
  final String feedbackQuote;

  const AssessmentElementItem({
    required this.number,
    required this.title,
    required this.description,
    required this.sitwasyon,
    required this.feedbackType,
    required this.feedbackQuote,
  });
}

class Paksa3Data {
  static const String mainHeader =
      'MABISANG KOMUNIKASYON SA KONTEKSTONG PERSONAL AT INTERPERSONAL';
  static const String mainTitle = 'ANG TEKSTO AT MGA URI NITO';
  static const String subtitle = 'Araling Panlipunan • 1st Term';

  // --- Ano ang Teksto ---
  static const String tekstoDef =
      'Ang teksto ay anumang anyo ng pasulat, pasalita, o biswal na naglalaman ng ideya, '
      'impormasyon, o mensahe na maaaring basahin, pakinggan, suriin, at '
      'bigyang-kahulugan ng isang tagatanggap.';

  static const String tradisyunalVsMakabagoIntro =
      'Sa tradisyunal na pananaw, ang salitang teksto ay karaniwang tumutukoy sa mga '
      'nakasulat na materyal tulad ng sanaysay, tula, at artikulo. Sa mas malawak at '
      'makabagong pagtingin sa wika at diskurso, maaari ring ituring na teksto ang mga '
      'pasalita at biswal na anyo kung ang mga ito ay:';

  static const List<String> makabagoCriteria = [
    'may maayos na organisasyon o lohikal na daloy ng ideya;',
    'naglalaman ng malinaw na mensahe; at',
    'may layuning maunawaan o mabigyang-kahulugan ng tagapakinig o tagatanggap.',
  ];

  static const List<String> pasalitangTekstoExamples = [
    'Talumpati',
    'Panayam o interview',
    'Usapan o dayalogo',
    'Debate',
    'Oral storytelling o pasalitang pagkukuwento (tulad ng pabula at kuwentong-bayan)',
  ];

  static const String tekstoFilipinoAndAkademiko =
      'Sa wikang Filipino, maaaring kabilang sa teksto ang artikulo, sanaysay, tula, kuwento, '
      'liham, talumpati, at iba pang anyo ng komunikasyon na ginagamit sa pagpapahayag at '
      'pagpapalitan ng kaalaman o damdamin.\n\n'
      'Sa kontekstong akademiko, nagsisilbing batayan ang mga teksto sa pag-unawa, '
      'pagsusuri, at interpretasyon ng mga mag-aaral, lalo na sa mga asignaturang Filipino at Panitikan.';

  // --- Pangunahing Layunin ng Teksto ---
  static const String layuninHeading = 'Pangunahing Layunin ng Teksto';
  static const List<Map<String, dynamic>> layuninList = [
    {
      'title': '1. Magbigay ng Impormasyon',
      'desc':
          'Ang tekstong ito ay naglalayong magpaliwanag, maglahad ng kaalaman, o magturo ng isang konsepto. Karaniwan itong gumagamit ng makatotohanan, malinaw, at lohikal na datos.',
      'examples': [
        'Ulat-pananaliksik',
        'Artikulo',
        'Pamanahong papel',
        'Encyclopedia entry',
      ],
    },
    {
      'title': '2. Manghikayat',
      'desc':
          'Layunin ng tekstong ito na impluwensiyahan ang paniniwala, pananaw, o kilos ng mambabasa. Maaaring gumamit ito ng lohika, emosyon, o moral na pangangatwiran upang mahikayat ang tagatanggap.',
      'examples': [
        'Editorial',
        'Talumpati',
        'Adbokasiya',
        'Patalastas',
      ],
    },
    {
      'title': '3. Mang-aliw',
      'desc':
          'Layunin nitong magbigay ng kasiyahan, aliw, o damdaming estetiko sa mambabasa o tagapakinig. Madalas itong gumagamit ng malikhaing wika at masining na paraan ng pagpapahayag.',
      'examples': [
        'Maikling kuwento',
        'Tula',
        'Dula',
        'Komiks',
      ],
    },
  ];

  // --- Mga Uri ng Teksto ---
  static const String uriTekstoHeading = 'Mga Uri ng Teksto';
  static const List<TextTypeItem> uriTekstoList = [
    TextTypeItem(
      number: '1',
      title: 'Impormatibo',
      description:
          'Ang tekstong impormatibo ay naglalayong maglahad ng malinaw at makatotohanang impormasyon o datos. Nakatuon ito sa pagbibigay at pagbabahagi ng kaalaman sa ibang tao.',
      examples: [
        'Artikulo tungkol sa COVID-19',
        'Impormasyon sa resibo',
        'Balitang pampamahalaan',
        'Impormasyon tungkol sa klima sa Pilipinas',
      ],
      sampleText:
          'Ang klima sa Pilipinas ay karaniwang nahahati sa dalawang pangunahing panahon: tag-ulan at tag-init. '
          'Karaniwang nararanasan ang tag-ulan mula Hunyo hanggang Nobyembre, samantalang tag-init naman mula Disyembre hanggang Mayo. '
          'Ang ganitong pattern ng panahon ay may epekto sa agrikultura, transportasyon, at pang-araw-araw na pamumuhay. '
          'Mahalaga ang kaalaman tungkol dito upang makapaghanda ang mga tao sa mga posibleng pagbabago ng panahon at sakuna. '
          'Ipinakikita rin nito ang kahalagahan ng pagkakaroon ng sapat at wastong impormasyon tungkol sa panahon.',
    ),
    TextTypeItem(
      number: '2',
      title: 'Deskriptibo',
      description:
          'Ang tekstong deskriptibo ay naglalayong magbigay ng malinaw na larawan ng isang tao, lugar, bagay, o pangyayari sa pamamagitan ng kongkretong detalye. Maaari rin itong gamitin upang maipahayag o mailarawan ang damdamin sa isang usapan o sitwasyon ng komunikasyon.',
      examples: [
        'Paglalarawan sa isang kaibigan',
        'Paglalarawan ng tagpuan sa kuwento',
        'Character sketch',
      ],
      sampleText:
          'Tahimik ang tabing-dagat habang papalubog ang araw. Ang kalangitan ay tila pininturahan ng mga kulay kahel, rosas, at lila na sumasalamin sa mga alon. '
          'Sa bawat paghampas ng tubig sa buhangin ay tila may musikang hatid ang kalikasan. Naamoy ang alat ng hangin at nadarama ang malamig nitong dampi sa balat. '
          'Para bang nilikha ang lugar upang maging payapa at tahimik. Sa sandaling iyon, tila huminto ang mundo.',
    ),
    TextTypeItem(
      number: '3',
      title: 'Naratibo',
      description:
          'Ang tekstong naratibo ay naglalayong magsalaysay ng mga pangyayari ayon sa maayos na pagkakasunod-sunod. Ginagamit ito upang magbahagi ng kuwento, karanasan, o pangyayari at makabuo ng ugnayan sa mambabasa o tagapakinig.',
      examples: [
        'Personal na karanasan',
        'Anekdota',
        'Diary entry',
      ],
      sampleText:
          'Noong bata pa ako, tuwing tag-araw ay pumupunta kami sa bukid ng aking lolo. Doon ko unang natutong mag-ani ng palay at maglaro sa malawak na damuhan. '
          'Isang araw, nadapa ako habang tumatakbo at agad akong tinulungan ni Lolo na makatayo. Sinabi niya sa akin, "Mas mahalaga ang matutong tumayo kaysa hindi madapa." '
          'Hindi ko kailanman nakalimutan ang kanyang sinabi. Mula noon, naging mas matatag ang loob ko sa pagharap sa mga pagsubok.',
    ),
    TextTypeItem(
      number: '4',
      title: 'Prosidyural',
      description:
          'Ang tekstong prosidyural ay naglalayong magbigay ng malinaw na mga hakbang o proseso upang magawa nang tama ang isang gawain. Ginagamit ito upang magbigay ng gabay o magpaliwanag kung paano isinasagawa ang isang proseso.',
      examples: [
        'Recipe',
        'Tutorial sa pag-install ng application',
        'Mga hakbang sa pag-aayos ng isang bagay',
      ],
      sampleText:
          'Sa paggawa ng tsaa mula sa sariwang dahon ng pandan, unang hugasan nang mabuti ang mga dahon. '
          'Pagkatapos, pakuluan ang mga ito sa loob ng 10-15 minuto hanggang maging berde ang tubig. Bahagyang palamigin bago salain. '
          'Maaari itong inumin nang mainit o malamig. Upang mapanatili ang lasa nito, ilagay ito sa lugar na hindi direktang nasisikatan ng araw.',
    ),
    TextTypeItem(
      number: '5',
      title: 'Persweysib',
      description:
          'Ang tekstong persweysib ay naglalayong manghikayat o mangumbinsi sa mambabasa o tagapakinig. Ginagamit ito upang maimpluwensiyahan ang pananaw, paniniwala, o kilos ng isang tao.',
      examples: [
        'Opinyon tungkol sa isang isyu sa lipunan',
        'Promosyong liham',
      ],
      sampleText:
          'Panahon na upang mas piliin natin ang mga lokal na produkto kaysa sa mga banyagang tatak. '
          'Bukod sa pagpapakita ng suporta sa sariling atin, nakatutulong din ito sa kabuhayan ng mga lokal na manggagawa. '
          'Ang simpleng pagbili ng produktong gawa sa Pilipinas ay maaaring magkaroon ng positibong epekto sa ating ekonomiya. '
          'Kaya sa susunod na mamimili ka, itanong mo sa iyong sarili: "Sinusuportahan ko ba ang aking bayan?" Piliin at tangkilikin ang mga produktong Pilipino.',
    ),
    TextTypeItem(
      number: '6',
      title: 'Argumentatibo',
      description:
          'Ang tekstong argumentatibo ay naglalayong maglahad ng isang panig o posisyon gamit ang lohikal na pangangatwiran at ebidensya. Nakabatay ito sa mga datos at dahilan upang suportahan ang isang pananaw o argumento.',
      examples: [
        'Editorial',
        'Debate speech',
        'Research defense',
      ],
      sampleText:
          'Marapat na isaalang-alang ang pagbabawal sa paggamit ng plastik sa mga pamilihan dahil sa malaking epekto nito sa kapaligiran. '
          'Ayon sa ulat ng United Nations Environment Programme noong 2021, tinatayang 11 milyong metriko tonelada ng plastik ang napupunta sa karagatan bawat taon. '
          'Nagdudulot ito ng panganib sa mga hayop-dagat tulad ng pagong, isda, at mga ibong-dagat. '
          'Bagama\'t may pananaw na praktikal ang plastik dahil ito ay mura at magaan, maaari ring isaalang-alang ang pangmatagalang epekto nito sa kapaligiran at kalusugan. '
          'May mga alternatibong maaaring gamitin tulad ng bayong, telang bag, at biodegradable packaging. '
          'Dahil dito, ang paghikayat sa paggamit ng mas ligtas na alternatibo ay maaaring maging hakbang tungo sa mas malinis at ligtas na kapaligiran.',
    ),
    TextTypeItem(
      number: '7',
      title: 'Humanidades',
      description:
          'Ang tekstong humanidades ay nakatuon sa damdamin, sining, kultura, at karanasan ng tao. Layunin nitong palalimin ang pag-unawa sa pansining at emosyonal na aspeto ng komunikasyon.',
      examples: [
        'Tula',
        'Sanaysay',
        'Likhang-panitikan',
      ],
      sampleText:
          'Ang sining ay hindi lamang binubuo ng malikhaing larawan o mga salita. Ito rin ay salamin ng damdamin, alaala, kultura, at pagkakakilanlan ng isang bayan. '
          'Sa bawat kulay ng isang larawan, sa bawat taludtod ng tula, at sa bawat eksenang ipinapakita sa isang dula, naipapahayag ang iba\'t ibang karanasan ng mga Pilipino—ang saya, lungkot, pag-asa, at katapangan. '
          'Sa pamamagitan ng sining, napayayaman ang ating kultura at nabubuo ang ugnayan ng nakaraan at kasalukuyan. '
          'Sa pag-aaral nito, hindi lamang natin nauunawaan ang estetika at anyo; mas nakikilala rin natin ang ating sarili bilang bahagi ng isang mas malawak na lipunan at kabihasnan. '
          'Dahil dito, mahalagang pangalagaan, buhayin, at ipasa sa susunod na henerasyon ang sining at kultura.',
    ),
    TextTypeItem(
      number: '8',
      title: 'Propesyonal',
      description:
          'Ang tekstong propesyonal ay ginagamit sa mga pormal at opisyal na sitwasyon, lalo na sa mga larangang pang-edukasyon, pangnegosyo, at panghanapbuhay. Ginagamit ito sa malinaw at pormal na pakikipagkomunikasyon.',
      examples: [
        'Resume',
        'Memorandum',
        'Business letter',
      ],
      sampleTitle: 'Halimbawa ng Memorandum',
      sampleText:
          'Para sa: Lahat ng Guro ng Senior High School\n'
          'Mula kay: Gng. Maria R. Alvarez, Punong-Guro\n'
          'Petsa: Hulyo 29, 2025\n'
          'Paksa: Pagpapalalim sa Papel ng Guro Bilang Tagahubog ng Pagkatao\n\n'
          'Bilang mga tagapagturo, mahalagang tandaan na ang ating tungkulin ay hindi lamang nakatuon sa pagtuturo ng mga asignatura. '
          'Bahagi rin ng ating responsibilidad ang paghubog sa asal, disiplina, at malasakit ng bawat mag-aaral.\n\n'
          'Sa bawat talakayan at gawain sa klase, sikaping maipakita at maitanim ang mga pagpapahalagang makatutulong sa kanilang pag-unlad bilang responsableng mamamayan. '
          'Ang pagiging guro ay hindi lamang isang trabaho kundi isang mahalagang tungkuling may malaking ambag sa paghubog ng kinabukasan.\n\n'
          'Maraming salamat at umaasa ako sa inyong patuloy na dedikasyon.',
      sampleTitle2: 'Halimbawa ng Business Letter',
      sampleText2:
          'Hulyo 29, 2025\n\n'
          'Gng. Maria R. Alvarez\n'
          'Punong-Guro\n'
          'STI Senior High School\n'
          'Lungsod ng Quezon\n\n'
          'Mahal kong Gng. Alvarez:\n\n'
          'Magandang araw po.\n\n'
          'Bilang guro ng Senior High School, nauunawaan ko na malawak ang aming responsibilidad sa loob at labas ng silid-aralan. '
          'Hindi lamang po ito tungkol sa pagbabahagi ng kaalaman kundi pati na rin sa paghubog ng kabuuang pagkatao ng mga mag-aaral.\n\n'
          'Sa bawat aralin, sinisikap kong maipakita at maipasa ang mahahalagang pagpapahalaga tulad ng disiplina, respeto, at malasakit. '
          'Naniniwala ako na ang pagiging guro ay isang mahalagang tungkulin na dapat isagawa nang may buong puso at dedikasyon.\n\n'
          'Lubos na gumagalang,\n'
          'Ana Lourdes M. Cruz\n'
          'Guro, Senior High School\n'
          'STI Academic Team',
    ),
  ];

  // --- Self at Peer Assessment ---
  static const String assessmentHeading = 'SELF AT PEER ASSESSMENT';
  static const String selfAssessmentDef =
      'Ang self-assessment ay proseso ng kritikal na pagsusuri sa sariling gawa, lalo na sa '
      'mga gawaing may kaugnayan sa komunikasyon. Nakakatulong ito sa metakognisyon, '
      'o sa kakayahan ng isang tao na pag-isipan at suriin ang sarili niyang pagkatuto at pagganap.';

  static const String peerAssessmentDef =
      'Samantala, ang peer assessment ay pagsusuri sa gawa ng isang kapwa mag-aaral '
      'gamit ang malinaw at tiyak na pamantayan. Nakakatulong ito sa pagbibigay ng '
      'makabuluhang puna at sa pagpapaunlad ng kolaboratibong pagkatuto.';

  static const String assessmentElementsIntro =
      'May limang mahahalagang elemento na dapat isaalang-alang sa pagsasagawa ng self at peer assessment:';

  static const List<AssessmentElementItem> assessmentElements = [
    AssessmentElementItem(
      number: '1',
      title: 'Kaangkupan sa Layunin',
      description:
          'Tumutukoy ito sa kung gaano kaangkop ang isang teksto sa tiyak nitong layunin ng komunikasyon, tulad ng paglalahad, pagsasalaysay, o panghihikayat. Ang isang mabisang teksto ay dapat may malinaw na layunin.',
      sitwasyon:
          'Sa isang gawain na ang layunin ay magsalaysay ng personal na karanasan, nagsumite ang isang mag-aaral ng sanaysay na halos puro opinyon.',
      feedbackType: 'Peer Assessment',
      feedbackQuote:
          '"Maayos ang nilalaman ng iyong teksto, ngunit mas angkop ito sa tekstong persweysib kaysa naratibo. Maaari mong dagdagan ang mga konkretong karanasan at detalye upang mas maging angkop ito sa layunin ng pagsasalaysay."',
    ),
    AssessmentElementItem(
      number: '2',
      title: 'Wasto at Akmang Wika',
      description:
          'Ito ay tumutukoy sa paggamit ng wikang angkop sa audience, layunin, at antas ng pormalidad ng isang sitwasyon. Ang wika ang nagsisilbing tulay ng mensahe.',
      sitwasyon:
          'Isang mag-aaral ang gumamit ng salitang balbal sa isang liham na dapat sana ay pormal at para sa isang guro.',
      feedbackType: 'Self-Assessment',
      feedbackQuote:
          '"Napagtanto kong hindi angkop sa pormal na liham ang ginamit kong salitang \'chill lang po ako.\' Sa susunod, gagamit ako ng mas pormal na pananalita tulad ng \'kalmado po ako noong oras na iyon.\'"',
    ),
    AssessmentElementItem(
      number: '3',
      title: 'Estruktura at Organisasyon',
      description:
          'Tumutukoy ito sa maayos na pagkakasunod-sunod ng simula, gitna, at wakas ng isang teksto. Ang malinaw na estruktura ay tumutulong sa mambabasa na madaling masundan at maunawaan ang daloy ng mga ideya.',
      sitwasyon:
          'Isang mag-aaral ang nagsimula agad sa konklusyon bago niya naipaliwanag ang karanasan na pinagmulan nito.',
      feedbackType: 'Peer Feedback',
      feedbackQuote:
          '"Mas magiging malinaw ang iyong teksto kung ilalahad mo muna ang iyong karanasan bago ang iyong pagninilay. Makakatulong ang lohikal na pagkakasunod-sunod ng mga ideya upang maging mas epektibo ang iyong mensahe."',
    ),
    AssessmentElementItem(
      number: '4',
      title: 'Lalim ng Nilalaman at Pagninilay',
      description:
          'Tumutukoy ito sa antas ng kaalaman, pag-unawa, at pagninilay na makikita sa isang teksto. Ang isang personal o interpersonal na teksto ay hindi lamang dapat naglalahad ng mga pangyayari kundi maipakita rin ang kahulugan nito.',
      sitwasyon:
          'Sa isang replektibong sanaysay tungkol sa hindi pagkakaunawaan, hindi sapat na ilahad lamang ang nangyari. Mas mahalaga ring maipaliwanag kung ano ang natutuhan ng nagsulat mula sa karanasan.',
      feedbackType: 'Self-Assessment',
      feedbackQuote:
          '"Nailahad ko ang mga nangyari, ngunit kulang ang bahagi tungkol sa aking mga natutuhan at kung paano ako naapektuhan ng karanasan. Idaragdag ko ang mga ito sa aking rebisyon."',
    ),
    AssessmentElementItem(
      number: '5',
      title: 'Kakayahang Tanggapin at Iproseso ang Puna',
      description:
          'Tumutukoy ito sa kakayahang makinig, tumanggap, mag-isip tungkol sa, at gamitin ang puna ng iba upang mapabuti ang sariling gawa.',
      sitwasyon:
          'Matapos makatanggap ng puna tungkol sa hindi malinaw na layunin ng kanyang teksto, muling sinuri ng isang mag-aaral ang kanyang draft at inayos ang introduksyon.',
      feedbackType: 'Self-Assessment',
      feedbackQuote:
          '"Matapos kong basahin ang feedback ni Marco, napagtanto kong hindi ko malinaw na naipahayag ang layunin ng aking teksto. Kaya binago ko ang pambungad upang malinaw na maipakita na ang aking paksa ay tungkol sa aking karanasan sa pagharap sa social anxiety."',
    ),
  ];
}