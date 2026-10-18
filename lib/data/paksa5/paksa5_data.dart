class UriSulatinItem {
  final String number;
  final String title;
  final String description;
  final String? example;
  final List<String>? details;
  final String? subLabel;

  const UriSulatinItem({
    required this.number,
    required this.title,
    required this.description,
    this.example,
    this.details,
    this.subLabel,
  });
}

class ReferenceExampleItem {
  final String typeName;
  final String formula;
  final String example;

  const ReferenceExampleItem({
    required this.typeName,
    required this.formula,
    required this.example,
  });
}

class Paksa5Data {
  static const String mainHeader = 'PAKSA 5: MGA URI NG AKADEMIKONG TEKSTO';
  static const String subtitle =
      'Araling Panlipunan • 2nd Term';

  // Section 1: Intro & History & Importance
  static const String defBody =
      'Ang akademikong teksto ay tumutukoy sa mga babasahin at sulating ginagamit sa larangan ng edukasyon, pananaliksik, at propesyonal na pagsasanay. Pangunahing layunin nito ang maglahad ng impormasyon, magpaliwanag ng mga konsepto, magsuri ng mga ideya, o manghikayat gamit ang maayos na estruktura, lohikal na pangangatwiran, at pormal na wika. Kabilang sa mga halimbawa nito ang sanaysay, pananaliksik, tesis, rebyu ng literatura, at kritikal na papel.';

  static const String kasaysayanBody =
      'Ang tradisyon ng akademikong pagsulat ay nagsimula pa noong sinaunang panahon. Ginamit ito ng mga iskolar upang maitala, maipaliwanag, at maipasa sa iba ang kanilang mga kaalaman at natuklasan. Sa kasalukuyan, naging mahalagang bahagi na ito ng kurikulum sa mga paaralan at unibersidad sa iba\'t ibang panig ng mundo, kabilang ang Pilipinas. Dahil sa pag-unlad ng teknolohiya, naging mas mabilis at madali ang paglikha, pag-iimbak, at pagpapalaganap ng mga akademikong teksto sa pamamagitan ng mga computer at internet.';

  static const String kahalagahanBody =
      'Ang akademikong teksto ay nagsisilbing pundasyon ng pagkatuto at pananaliksik. Sa pamamagitan ng malinaw, sistematiko, at obhetibong paglalahad ng mga ideya, natutulungan nito ang mga mag-aaral na magkaroon ng mas malalim na pag-unawa sa iba\'t ibang larangan. Bukod dito, nakatutulong ang akademikong teksto sa paglinang ng kritikal na pag-iisip. Natututuhan ng mga mag-aaral na magsuri, maghambing, magtanong, at magbigay ng makatwirang puna tungkol sa mga datos at impormasyon.';

  // Section 2: Pangunahing Uri ng Akademikong Sulatin (1 - 5)
  static const List<UriSulatinItem> pangunahingUriList = [
    UriSulatinItem(
      number: '1',
      title: 'Sanaysay',
      description:
          'Isang maikling komposisyong naglalahad ng pananaw, kaisipan, o pagsusuri ng may-akda tungkol sa isang partikular na paksa. Maaari itong gamitin upang magsuri, maglarawan, magpaliwanag, magbigay ng impormasyon, o manghikayat.',
      example:
          'Maaaring gumawa ng sanaysay tungkol sa epekto ng teknolohiya sa edukasyon, kabilang ang kung paano ito nakatutulong sa pagkatuto at ang mga hamong dulot nito.',
    ),
    UriSulatinItem(
      number: '2',
      title: 'Pananaliksik',
      description:
          'Isang sistematikong proseso ng pag-aaral na isinasagawa upang makahanap ng kasagutan sa isang partikular na tanong o solusyon sa isang sularin. Karaniwang binubuo ito ng introduksiyon, layunin, metodolohiya, resulta, at kongklusyon.',
      example:
          'Pananaliksik tungkol sa epekto ng online learning sa akademikong pagganap ng mga mag-aaral upang makabuo ng kaalamang makatutulong sa edukasyon.',
    ),
    UriSulatinItem(
      number: '3',
      title: 'Rebyu',
      description:
          'Isang kritikal na pagsusuri sa isang aklat, artikulo, pelikula, o iba pang likhang-sining. Karaniwang naglalaman ng buod ng akda, pagsusuri sa nilalaman at estilo, at pananaw ng nagsusuri sa kalidad nito.',
      example:
          'Rebyu ng nobela na nagsusuri sa tema, mga tauhan, banghay, at paraan ng pagkakasulat upang matulungan ang mambabasa sa pag-unawa sa kalidad ng akda.',
    ),
    UriSulatinItem(
      number: '4',
      title: 'Posisyong Papel',
      description:
          'Isang akademikong sulating nagpapahayag ng malinaw na paninindigan tungkol sa isang isyu. Ang posisyong inilalahad ay kailangang suportado ng datos, ebidensya, at lohikal na pangangatwiran.',
      example:
          'Posisyong papel tungkol sa pagpapatupad ng K-12 program sa Pilipinas gamit ang mga datos at argumento para suportahan ang paninindigan.',
    ),
    UriSulatinItem(
      number: '5',
      title: 'Abstrak',
      description:
          'Isang maikli at malinaw na buod ng isang pananaliksik, tesis, o artikulo. Humigit-kumulang 100-250 salita at nagsisilbing "pinto" ng pananaliksik.',
      details: [
        'Descriptive Abstract - naglalarawan sa nilalaman at saklaw ng pag-aaral.',
        'Informative Abstract - naglalahad ng mahahalagang resulta at kongklusyon ng pag-aaral (mas karaniwang ginagamit).',
      ],
      subLabel: 'Dalawang Pangunahing Uri ng Abstrak:',
      example:
          'Abstrak para sa tesis na "Epekto ng Blended Learning sa Akademikong Pagganap ng mga Mag-aaral sa Baitang 11" na naglalaman ng research design, bilang ng kalahok, resulta, at rekomendasyon.',
    ),
  ];

  // Section 3: Iba Pang Uri ng Akademikong Sulatin (6 - 15)
  static const List<UriSulatinItem> ibaPangUriList = [
    UriSulatinItem(
      number: '6',
      title: 'Sintesis',
      description:
          'Pagsasama-sama ng mahahalagang ideya mula sa iba\'t ibang sanggunian upang makabuo ng mas malawak at magkakaugnay na pag-unawa sa isang paksa. Requires analyzing similarities, differences, and connections.',
      example:
          'Sintesis mula sa tatlong artikulo ukol sa climate change (mula sa economic journal, ecology journal, at sociological report) upang ipakita ang ugnayan ng ekonomiya, lipunan, at ekolohiya.',
    ),
    UriSulatinItem(
      number: '7',
      title: 'Bionote',
      description:
          'Isang maikling paglalarawan tungkol sa buhay, karanasan, edukasyon, at kwalipikasyon ng isang manunulat o tagapagsalita upang maipakita ang kaniyang kredibilidad. Isinusulat sa ikatlong panauhan.',
      example:
          'Bionote ng tagapagsalita ukol sa AI na binabanggit ang kaniyang PhD sa Computer Science, trabaho bilang lead researcher, at natanggap na parangal.',
    ),
    UriSulatinItem(
      number: '8',
      title: 'Adyenda',
      description:
          'Talaan ng mga paksang pag-uusapan sa isang pulong na nagtatakda ng direksiyon, pagkakasunod-sunod, at inaasahang resulta. Ipinapamahagi bago magsimula ang pulong.',
      example:
          'Adyenda sa Academic Council: (1) Pagpapatibay ng katitikan, (2) Ulat ng Curriculum Committee, (3) Budget para sa susunod na semestre, (4) Iba pang usapin.',
    ),
    UriSulatinItem(
      number: '9',
      title: 'Katitikan ng Pulong',
      description:
          'Opisyal na tala ng mga napag-usapan, napagkasunduan, at napagpasyahan sa isang pormal na pagpupulong. Dapat maging tumpak, malinaw, at obhetibo.',
      details: [
        'Pangalan ng mga dumalo at lumiban',
        'Oras ng pagsisimula at pagtatapos',
        'Mahahalagang usapin, mosyon, o resolusyon',
        'Desisyong napagkasunduan',
      ],
      subLabel: 'Mahahalagang Laman ng Katitikan:',
      example:
          'Katitikan ng Faculty Department Meeting kaugnay sa pagbabago ng grading system at pagbuo ng komite.',
    ),
    UriSulatinItem(
      number: '10',
      title: 'Panukalang Proyekto',
      description:
          'Pormal na dokumentong naglalahad ng planong proyekto, kasama ang mga layunin, paraan ng pagpapatupad, iskedyul, at badyet upang humingi ng suporta o pondo.',
      example:
          '"Proyektong Liwanag: Pagkakaloob ng Solar Lamps sa Liblib na Komunidad ng Sitio Pangarap" na naglalaman ng pahayag ng problema, layunin, timeline, at badyet.',
    ),
    UriSulatinItem(
      number: '11',
      title: 'Posisyong Papel (Detalyado)',
      description:
          'Akademikong sulating nagpapakita ng malinaw na paninindigan sa isang kontrobersyal na isyu gamit ang ebidensya, estadistika, at pabulaan sa argumento ng kabilang panig.',
      example:
          '"Ang Face-to-Face na Klase ay Mas Epektibo kaysa Online Learning para sa Elementary Students" gamit ang mga pag-aaral at estadistika.',
    ),
    UriSulatinItem(
      number: '12',
      title: 'Replektibong Sanaysay',
      description:
          'Sulating nakatuon sa pagsusuri ng sariling karanasan, ideya, damdamin, at natutuhan sa isang paksa habang pinananatili ang pormal na paraan ng pagsulat.',
      details: ['Proseso: Paglalarawan → Pagsusuri → Pagkatuto / Paglalapat'],
      example:
          'Replektibong sanaysay tungkol sa community service at kung paano nito binago ang pananaw sa kahirapan.',
    ),
    UriSulatinItem(
      number: '13',
      title: 'Lakbay-Sanaysay',
      description:
          'Akademikong pagsasalaysay tungkol sa paglalakbay na inuugnay ang mga nakita at naranasan sa mas malalim na ideya (deskriptibo, ekspositori, kritikal, o replektibo).',
      example:
          'Pagbisita sa Vigan, Ilocos Sur na nag-uugnay sa mga lumang bahay sa pambansang identidad at kasaysayan.',
    ),
    UriSulatinItem(
      number: '14',
      title: 'Pictorial Essay',
      description:
          'Gumagamit ng mga larawan bilang pangunahing tagapagsalaysay at maiikling teksto bilang gabay upang maglahad ng kuwento sa isyung panlipunan, kultural, o siyentipiko.',
      example:
          '"Isang Araw sa Buhay ng Isang Mangingisda sa Manila Bay" na nagpapakita ng pangingisda, pagbebenta, at epekto ng polusyon.',
    ),
    UriSulatinItem(
      number: '15',
      title: 'Talumpati',
      description:
          'Pormal na pagsasalita sa harap ng mga tagapakinig upang magbigay ng impormasyon, manghikayat, o magbigay-pugay.',
      details: [
        'Impromptu - kaunti o walang paghahanda',
        'Extemporaneous - may outline at paghahanda',
        'Manuscript - binabasa ang inihandang teksto',
        'Memorized - isinasaulo ang buong talumpati',
        'Gumamagit ng retorika: Ethos (kredibilidad), Pathos (emosyon), at Logos (lohika/datos)',
      ],
      subLabel: 'Mga Paraan ng Paghahatid at Retorika:',
      example:
          'Talumpating "Bakit Kailangang Magkaroon ng Universal Healthcare sa Pilipinas".',
    ),
  ];

  // Section 4: Nilalaman, Estruktura, at Wika (3 Pillars)
  static const String pillarsIntro =
      'Ang akademikong pagsulat ay nakasalig sa tatlong pangunahing aspeto na maihahambing sa mga haligi ng isang matibay na gusali: Nilalaman, Estruktura, at Wika.';

  static const List<Map<String, String>> nilalamanSubsections = [
    {
      'title': '1.1 Katotohanan o Fact-Based Writing',
      'desc':
          'Ang impormasyon ay kailangang nakabatay sa mapagkakatiwalaang ebidensya, pananaliksik, at datos sa halip na sa personal na opinyon lamang.',
      'example':
          'Halimbawa: Sa UBI (Universal Basic Income) position paper, gumamit ng peer-reviewed studies at datos mula sa eksperimento sa halip na "Sa tingin ko, magiging tamad ang tao".',
    },
    {
      'title': '1.2 Intelektuwal na Katapatan',
      'desc':
          'Ang anumang ideya, datos, o pahayag na hindi sariling gawa ay kailangang kilalanin sa pamamagitan ng wastong pagsipi (tulad ng APA o MLA).',
      'example':
          'Halimbawa: "Ayon kina Dela Cruz at Santos (2020), ang gamification ay nakatutulong sa engagement."',
    },
    {
      'title': '1.3 Kritikal at Mapanuring Pagsusuri',
      'desc':
          'Hindi lamang simpleng paglalahad; kinakailangan ding suriin, tasahin, at kuwestiyunin ang mga ideyang ipinapakita.',
      'example':
          'Halimbawa: Sa movie reflective essay, itanong kung bakit ginamit ang black-and-white style o ano ang mas malalim na mensahe sa diskriminasyon.',
    },
  ];

  // Pagsusuri ng Nilalaman
  static const List<Map<String, String>> pagsusuriNilalamanList = [
    {
      'title': '• Pagkilala sa Pangunahing Ideya',
      'desc':
          'Ang sentral na mensahe ng teksto (karaniwang nasa introduksiyon). Itanong: "Tungkol saan ang teksto?" at "Ano ang pinakamahalagang punto?"',
      'example': 'Halimbawa: "Mahalaga ang papel ng kabataan sa pagtugon sa pagbabago ng klima."',
    },
    {
      'title': '• Pagtukoy sa Suportang Detalye',
      'desc':
          'Datos, estadistika, tunay na halimbawa, at sipi mula sa eksperto na nagpapatunay sa pangunahing ideya.',
      'example': 'Halimbawa: Tree-planting activities, datos ng DENR (2022), at community clean-up drives.',
    },
    {
      'title': '• Pagkilala sa Lohika ng Teksto',
      'desc':
          'Maayos na pagkakaugnay at pagkakasunod-sunod (Simula → Gitna → Wakas) gamit ang mga panandang pandiskurso.',
      'example': 'Lohikal na daloy: Suliranin (Climate Change) → Epekto (Pagbaha) → Solusyon (Kabataan) → Halimbawa → Pangwakas na Hamon.',
    },
  ];

  // Estruktura
  static const List<Map<String, String>> estrukturaParts = [
    {
      'title': '1. Introduksiyon (Pundasyon ng Bahay)',
      'desc':
          'Unang bahagi ng teksto na nagpapakilala sa paksa, dahilan ng pagsulat, at konteksto. Maaaring simulan sa datos, maikling kuwento, tanong, o sitwasyon.',
      'example': '"Bawat araw, tinatayang may 8 milyong toneladang plastik ang napupunta sa karagatan. Ano ang maaaring gawin ng kabataan?"',
    },
    {
      'title': '2. Katawan (Pangunahing Bahagi ng Bahay)',
      'desc':
          'Dito inilalahad ang mga argumento at ebidensya gamit ang estratehiya tulad ng Cause/Effect, Problem/Solution, at Compare/Contrast.',
      'example': 'Gumagamit ng panandang pandiskurso: "Una...", "Bilang karagdagan...", "Sa huli..."',
    },
    {
      'title': '3. Kongklusyon (Pangwakas na Katibayan)',
      'desc':
          'Binubuod ang mahahalagang ideya at nagbibigay ng rekomendasyon, hamon, o implikasyon sa halip na ulitin lamang ang sinabi.',
      'example': '"Sa kabila ng paglala ng polusyon, mahalagang bahagi ng solusyon ang kabataan..."',
    },
  ];

  // Wika, Kohesyon, at Pandugtong
  static const List<Map<String, String>> wikaTechniques = [
    {
      'title': '• Kongkretong Salita',
      'desc': 'Tiyak na salita sa halip na malawak (hal. "lapis", "aklat", "computer" sa halip na "bagay").',
    },
    {
      'title': '• Teknikal na Bokabularyo',
      'desc': 'Terminong angkop sa paksa katulad ng hypothesis, metodolohiya, analisis, variable, at resulta.',
    },
    {
      'title': '• Pag-iwas sa Kolokyal at Balbal',
      'desc': 'Gumamit ng "kaklase" o "kasamahan sa pag-aaral" sa halip na impormal na "pare".',
    },
  ];

  static const List<Map<String, String>> pandugtongCategories = [
    {'type': 'Pagdaragdag', 'words': 'at, pati, gayundin, bukod dito'},
    {'type': 'Pagpapaliwanag / Bunga', 'words': 'kaya, dahil dito, bunga nito'},
    {'type': 'Pagsalungat', 'words': 'ngunit, subalit, sa kabila nito'},
    {'type': 'Paghahalimbawa', 'words': 'halimbawa, hal., bilang paglilinaw'},
  ];

  // Section 5: Paraphrasing, Reperensiya, at AI Declaration
  static const List<String> buodSteps = [
    '1. Basahin at unawain ang buong teksto.',
    '2. Tukuyin ang pangunahing ideya.',
    '3. Piliin lamang ang mahahalagang detalye (tanggalin ang di-kailangan).',
    '4. Gumamit ng sariling salita nang hindi binabago ang orihinal na kahulugan.',
    '5. Panatilihin ang etika sa pamamagitan ng wastong pagsipi.',
  ];

  static const List<String> paraphraseSteps = [
    '1. Basahin at Unawain - tiyaking nauunawaan ang buong kahulugan.',
    '2. Isulat Mula sa Alaala - itabi ang orihinal at isulat gamit ang sariling salita.',
    '3. Paghambingin - tiyaking hindi eksaktong pareho ang pagkakasunod ng salita.',
    '4. Banggitin ang Pinagmulan - kilalanin pa rin ang may-akda.',
  ];

  // APA 7th Edition Reference Rules & Examples
  static const List<ReferenceExampleItem> referenceExamples = [
    ReferenceExampleItem(
      typeName: '1. Aklat',
      formula: 'Apelyido, A. I. (Taon). Pamagat ng aklat. Tagapaglathala.',
      example: 'Santiago, A. (2022). Sining ng pagsasalin: Teorya at praktika. Rex Bookstore.',
    ),
    ReferenceExampleItem(
      typeName: '2. Aklat (2 o Higit Pang Awtor)',
      formula: 'Apelyido, A. I., & Apelyido, A. I. (Taon). Pamagat ng aklat. Tagapaglathala.',
      example: 'Cruz, J. L., & Torres, M. F. (2019). Pilosopiya ng wika at kultura. Sentro ng Wikang Filipino.',
    ),
    ReferenceExampleItem(
      typeName: '3. Artikulo sa Akademikong Journal',
      formula: 'Apelyido, A. I. (Taon). Pamagat. Pamagat ng Journal, Tomo(Isyu), pahina. DOI/URL',
      example: 'De Guzman, E. C. (2023). Pagsusuri sa discourse ng online learning. Daluyan, 29(2), 15-30.',
    ),
    ReferenceExampleItem(
      typeName: '4. Website o Online Report',
      formula: 'Apelyido, A. I. (Taon, Buwan Araw). Pamagat. Pangalan ng Website. URL',
      example: 'Department of Education (DepEd). (2024). Kagawaran ng edukasyon 2024-2025: Ulat sa estado. URL',
    ),
    ReferenceExampleItem(
      typeName: '5. Tesis o Disertasyon',
      formula: 'Apelyido, A. I. (Taon). Pamagat [Tesis na Di Nalathala, Unibersidad]. Repository.',
      example: 'Ramos, M. L. (2021). Paggamit ng social media bilang plataporma [Tesis na Di Nalathala, UST].',
    ),
    ReferenceExampleItem(
      typeName: '6. Video sa YouTube',
      formula: 'Channel. (Taon, Buwan Araw). Pamagat ng video [Video]. YouTube. URL',
      example: 'Unibersidad ng Pilipinas Diliman. (2024, Oktubre 24). Ang kahalagahan ng akademikong pagsulat [Video]. YouTube.',
    ),
  ];

  static const String aiDeclarationText =
      'Sa kasalukuyan, ang Artificial Intelligence (AI) ay kasangkapan sa pagkatuto ngunit dapat gamitin bilang pantulong lamang at HINDI kapalit ng sariling pag-iisip. Ang AI Declaration ay kailangan upang mapanatili ang katapatan, transparency, at akademikong integridad.';
}