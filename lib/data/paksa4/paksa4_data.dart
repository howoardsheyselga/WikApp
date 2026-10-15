class PundasyonItem {
  final int number;
  final String title;
  final String description;

  const PundasyonItem({
    required this.number,
    required this.title,
    required this.description,
  });
}

class SampleComparisonItem {
  final int number;
  final String title;
  final String badExample;
  final String goodExample;
  final String explanation;

  const SampleComparisonItem({
    required this.number,
    required this.title,
    required this.badExample,
    required this.goodExample,
    required this.explanation,
  });
}

class PrinsipyoItem {
  final int number;
  final String title;
  final String description;
  final String? avoidExample;
  final String? preferredExample;
  final String? note;

  const PrinsipyoItem({
    required this.number,
    required this.title,
    required this.description,
    this.avoidExample,
    this.preferredExample,
    this.note,
  });
}

class HudyatItem {
  final int number;
  final String title;
  final String description;
  final List<String>? mainExamples;
  final List<String>? subExamples1;
  final String? subLabel1;
  final List<String>? subExamples2;
  final String? subLabel2;

  const HudyatItem({
    required this.number,
    required this.title,
    required this.description,
    this.mainExamples,
    this.subExamples1,
    this.subLabel1,
    this.subExamples2,
    this.subLabel2,
  });
}

class Paksa4Data {
  static const String mainHeader = 'PAKSA 4: INGKLUSIBO AT ETIKAL NA DISKURSO';
  static const String subtitle =
      'Ingklusibo at Magalang na Wika sa Mabisang Komunikasyon';

  static const String introBody =
      'Ang wika ay hindi lamang ginagamit upang maipahayag ang ating mga ideya at damdamin. Ito rin ay nagsisilbing tulay ng paggalang, pagkakaunawaan, at pagkakaisa. Sa mabisang komunikasyon, mahalagang tiyakin na ang mga salitang ginagamit ay ingklusibo-nagbibigay-puwang at kumikilala sa lahat at etikal, na nangangahulugang matapat, responsable, at may paggalang sa kapwa.';

  static const String ingklusiboDef =
      'Ang isang diskurso ay ingklusibo kapag kinikilala, tinatanggap, at iginagalang nito ang pagkakaiba-iba ng mga tao anuman ang kanilang kasarian, edad, kakayahan, oryentasyon, lahi, o kalagayang panlipunan.';

  static const String etikalDef =
      'Ang isang diskurso ay etikal kapag ito ay matapat, responsable, at nakabatay sa paggalang sa dignidad ng bawat tao. Layunin nitong magbigay ng malinaw na impormasyon at pag-unawa sa halip na manakit o manghamak.';

  static const String pundasyonIntro =
      'Ang sumusunod na limang pundasyon ay maaaring magsilbing gabay sa paggawa ng mga pahayag at pakikipagkomunikasyon:';

  // 5 Pundasyon ng Ingklusibo at Etikal na Diskurso
  static const List<PundasyonItem> pundasyonList = [
    PundasyonItem(
      number: 1,
      title: 'Dignidad ng Tao',
      description:
          'Kinikilala nito na ang bawat tao ay may sariling halaga at may karapatang tratuhin nang may respeto at paggalang.',
    ),
    PundasyonItem(
      number: 2,
      title: 'Katarungan at Patas na Pagtrato',
      description:
          'Tinitiyak nito na ang komunikasyon ay hindi kumikiling o nagbibigay ng hindi makatarungang pabor sa isang partikular na grupo. Dapat magkaroon ng patas na pagkakataon ang bawat isa na maipahayag ang kanilang pananaw.',
    ),
    PundasyonItem(
      number: 3,
      title: 'Pagkamapanagot sa Epekto ng Wika',
      description:
          'Mahalagang maunawaan na may epekto ang bawat salitang ginagamit. Dahil dito, may pananagutan ang nagsasalita o sumusulat sa paraan ng pagtanggap at pag-unawa ng iba sa kanyang mensahe.',
    ),
    PundasyonItem(
      number: 4,
      title: 'Katotohanan at Beripikasyon',
      description:
          'Ang mga impormasyong ibinabahagi ay kailangang suriin at mapatunayan. Dapat itong nakabatay sa ebidensya at hindi lamang sa haka-haka, sabi-sabi, o emosyon.',
    ),
    PundasyonItem(
      number: 5,
      title: 'Do No Harm sa Indibidwal at Grupo',
      description:
          'Hindi dapat gamitin ang wika upang manakit, manira, manghamak, o mag-udyok ng pagkamuhi laban sa isang tao o grupo.',
    ),
  ];

  // Mga Halimbawa ng Etikal at Ingklusibong Paggamit ng Wika
  static const List<SampleComparisonItem> comparisonList = [
    SampleComparisonItem(
      number: 1,
      title: 'Dignidad ng Tao',
      badExample: 'Sa isang group chat, tinawag si Ana na "baliw" dahil naging emosyonal siya.',
      goodExample: '"Mahalaga ang nararamdaman ni Ana. Tingnan natin kung paano natin matutulungan ang isang taong emosyonal na naapektuhan ng isyu."',
      explanation: 'Ipinakikita nito ang pagkilala sa halaga at dignidad ni Ana.',
    ),
    SampleComparisonItem(
      number: 2,
      title: 'Katarungan at Patas na Pagtrato',
      badExample: 'Sa isang pulong, ang mga ideya lamang ng mga lalaking miyembro ang binigyan ng pagkakataong mapakinggan.',
      goodExample: 'Nagbigay ng sapat na pagkakataon ang facilitator sa bawat miyembro na magsalita.\n"Ngayon, bigyan natin ng pagkakataon si Gng. Reyes na ibahagi ang kanyang pananaw tungkol sa isyu ng budget."',
      explanation: 'Ipinakikita nito ang pagbibigay ng pantay na pagkakataon sa bawat kasarian.',
    ),
    SampleComparisonItem(
      number: 3,
      title: 'Pagkamapanagot sa Epekto ng Wika',
      badExample: 'Nag-post si Jose ng meme na nagpapahiwatig na "tamad" ang mga tao mula sa isang partikular na rehiyon.',
      goodExample: 'Nag-post siya ng paghingi ng paumanhin:\n"Patawad. Naiintindihan kong mali at nakasasakit ang generalization na ginawa ko. Hindi ako dapat nagpakalat ng diskriminasyon."',
      explanation: 'Ipinakikita nito ang pagtanggap ng pananagutan sa epekto ng ginamit na wika.',
    ),
    SampleComparisonItem(
      number: 4,
      title: 'Katotohanan at Beripikasyon',
      badExample: 'Nagbahagi si Marie ng impormasyon:\n"Sigurado ako, tataas nang 50% ang tuition fee sa susunod na semester." Gayunman, wala siyang binanggit na mapagkukunan ng impormasyon.',
      goodExample: 'Sinuri muna niya ang opisyal na website at pagkatapos ay nagbahagi ng impormasyon:\n"Ayon sa advisory ng Unibersidad, may proposed na 5% na pagtaas sa tuition. Humihingi ako ng paumanhin sa maling impormasyon na naibahagi ko kanina."',
      explanation: 'Ipinakikita nito ang kahalagahan ng pagsangguni sa ebidensya at pagwawasto ng maling impormasyon.',
    ),
    SampleComparisonItem(
      number: 5,
      title: 'Do No Harm',
      badExample: 'Sa isang debate, inatake ang pisikal na anyo ng kalaban:\n"Hindi mo maiintindihan iyan. Tingnan mo nga ang suot mo."',
      goodExample: 'Sa halip na personal na atake, nakatuon ang nagsasalita sa ideya at ebidensya:\n"Bagama\'t naiintindihan ko ang iyong punto, naniniwala akong may problema sa datos na iyong ginamit. Narito ang counter-evidence batay sa pag-aaral ng NEDA."',
      explanation: 'Ipinakikita nito na maaaring sumalungat sa isang argumento nang hindi minamaliit o inaangkin ang pagkatao ng kausap.',
    ),
  ];

  static const String prinsipyoIntro =
      'Narito ang ilang gabay na maaaring gamitin sa pagpili ng mga salita upang maging mas etikal, magalang, at ingklusibo ang komunikasyon.';

  // 6 Prinsipyo sa Wika
  static const List<PrinsipyoItem> prinsipyoList = [
    PrinsipyoItem(
      number: 1,
      title: 'Gumamit ng Tiyak at Neutral na Katawagan',
      description:
          'Iwasang ilarawan o husgahan ang isang grupo gamit ang mapanlait o malawakang paglalahat.',
      avoidExample: '"Ang mga magsasaka ay ignorante."',
      preferredExample:
          '"Dahil sa kakulangan sa irigasyon at suporta sa ilang magsasaka, nahihirapan silang makapagtanim nang maayos."',
      note:
          'Sa ganitong paraan, tinutukoy ang partikular na suliranin sa halip na sisihin o husgahan ang mga tao.',
    ),
    PrinsipyoItem(
      number: 2,
      title: 'Iwasan ang Mapanlait, Mapanlagom, at Mapanuksong Pananalita',
      description:
          'Hindi dapat gamitin ang wika upang manira, manghamak, o magdulot ng pagkamuhi sa isang tao o grupo.',
    ),
    PrinsipyoItem(
      number: 3,
      title: 'Unahin ang Katauhan Bago ang Katangian (Person-First Language)',
      description:
          'Sa paggamit ng wika, mahalagang kilalanin muna ang tao bago ang anumang kondisyon o katangiang iniuugnay sa kanya.',
      avoidExample: '"Siya ay isang addict/baldado."',
      preferredExample:
          '"Siya ay taong may problema sa paggamit ng substansya." o "Siya ay taong may kapansanan."',
      note: 'Sa ganitong paraan, nauunang kilalanin ang pagiging tao ng indibidwal.',
    ),
    PrinsipyoItem(
      number: 4,
      title: 'Gumamit ng Gender-Fair na Anyo',
      description:
          'Iwasang gumamit ng mga katawagang maaaring magpahiwatig na ang isang trabaho o tungkulin ay para lamang sa isang partikular na kasarian.',
      avoidExample:
          '"Ang pulis at fireman..." o "Ang bawat estudyante\'t estudyanta..."',
      preferredExample:
          '"Ang police officer at fire fighter (o bumbero)..." o "Bawat mag-aaral..."',
      note: 'Gumamit ng mga salitang maaaring tumukoy sa lahat anuman ang kasarian.',
    ),
    PrinsipyoItem(
      number: 5,
      title: 'Iwasan ang Stereotype',
      description:
          'Gumamit ng ebidensya sa halip na haka-haka. Iwasang gumawa ng malawakang paglalahat tungkol sa isang grupo batay sa kilos ng ilang indibidwal.',
      avoidExample: '"Lahat ng taga-Maynila ay garapal."',
      preferredExample:
          '"May mga indibidwal sa Maynila na gumagawa ng katiwalian. Dapat itong imbestigahan batay sa ebidensya."',
    ),
    PrinsipyoItem(
      number: 6,
      title: 'Kilalanin ang Pinagmulan ng Datos at Sumipi Nang Wasto',
      description:
          'Ang wastong pagkilala sa pinagmulan ng impormasyon ay bahagi ng etikal na komunikasyon. Ipinakikita nito ang pagiging responsable sa impormasyong ibinabahagi.',
      avoidExample: '"Nabasa ko sa internet na mataas ang krimen."',
      preferredExample:
          '"Ayon sa ulat ng Philippine National Police (PNP) noong 2024, may 5% na pagtaas sa kaso ng petty crime sa lungsod."',
    ),
  ];

  // 5 Pamamaraan sa Etikal na Pakikipag-usap
  static const List<Map<String, String>> pamamaraanList = [
    {
      'title': '1. Pakikinig na Aktibo',
      'desc':
          'Makinig nang mabuti, pagkatapos ay ulitin o linawin ang pangunahing punto ng kausap upang matiyak na tama ang iyong pagkaunawa.',
      'example': 'Halimbawa:\n"Kung tama ang pagkaunawa ko, ang punto mo ay..."',
    },
    {
      'title': '2. Pagkilala sa Kapangyarihan',
      'desc':
          'Maging maingat sa tono at posisyon na ginagamit sa pakikipag-usap. Iwasang gumamit ng mapang-api o abusive language.',
    },
    {
      'title': '3. Transparensiya',
      'desc':
          'Maging malinaw tungkol sa layunin ng komunikasyon, pinagmulan ng impormasyon, at mga limitasyon ng datos na ginagamit.',
    },
    {
      'title': '4. Pagwawasto',
      'desc':
          'Kapag may naibahaging maling impormasyon, itama ito agad at ipaliwanag nang malinaw ang wastong impormasyon.',
    },
    {
      'title': '5. Pahintulot (Consent)',
      'desc':
          'Humingi muna ng pahintulot bago gamitin o ibahagi ang kuwento, personal na karanasan, larawan, o iba pang impormasyon tungkol sa ibang tao.',
    },
  ];

  static const String hudyatIntro =
      'Ang mga hudyat ay mga salita, parirala, o estratehiya na tumutulong sa pagpapanatili ng isang magalang, patas, at malinaw na talakayan.';

  // 6 Hudyat ng Ingklusibo at Etikal na Komunikasyon
  static const List<HudyatItem> hudyatList = [
    HudyatItem(
      number: 1,
      title: 'Hudyat ng Pagkilala at Pagsang-ayon o Pagkakaiba',
      description:
          'Sa ganitong paraan, maaaring ipahayag ang hindi pagsang-ayon nang hindi minamaliit ang pananaw ng kausap.',
      subLabel1: 'Pagkilala:',
      subExamples1: [
        '"Tinatanggap ko ang puntong..."',
        '"Mahalaga ang binanggit mong..."',
      ],
      subLabel2: 'Magalang na Pagtutol:',
      subExamples2: [
        '"Iba ang aking pagbasa dahil..."',
        '"Batay sa datos, may salungat na ebidensya..."',
      ],
    ),
    HudyatItem(
      number: 2,
      title: 'Hudyat ng Paglinaw',
      description:
          'Ginagamit ang mga ito kapag nais tiyaking malinaw ang isang ideya o pahayag.',
      mainExamples: [
        '"Ibig sabihin, ang pangunahing suliranin ay..."',
        '"Maaari bang linawin ang relasyon nito sa...?"',
      ],
    ),
    HudyatItem(
      number: 3,
      title: 'Hudyat ng Pagpapantay ng Kasarian at Katauhan',
      description:
          'Maaaring gumamit ng "sila" o "kanila" bilang neutral na pantukoy. Maaari ring gumamit ng mga katawagang tumutukoy sa lahat, tulad ng:',
      mainExamples: [
        '"mga mag-aaral"',
        '"mga mamamayan"',
        '"tagapanguna"',
      ],
    ),
    HudyatItem(
      number: 4,
      title: 'Hudyat ng Sensitibidad Kultural',
      description:
          'Mahalagang kilalanin at igalang ang pagkakaiba-iba ng mga kultura at kaugalian.',
      mainExamples: [
        '"Sa konteksto ng kultura ng..."',
        '"Igalang natin ang kaugalian na..."',
      ],
    ),
    HudyatItem(
      number: 5,
      title: 'Hudyat ng Pananagutan at Beripikasyon',
      description:
          'Ginagamit ang mga ito upang malinaw na maipakita ang pinagmulan at limitasyon ng impormasyon.',
      mainExamples: [
        '"Ayon sa ulat ng DOH (Department of Health) noong 2023..."',
        '"May limitasyon ang datos na ito dahil qualitative lamang ito."',
      ],
    ),
    HudyatItem(
      number: 6,
      title: 'Hudyat ng Pagpapahalaga at Pagtatapos',
      description:
          'Ginagamit ang mga pahayag na ito upang ipakita ang paggalang at pagpapahalaga sa oras at ambag ng ibang tao.',
      mainExamples: [
        '"Salamat sa pagbabahagi ng iyong ideya."',
        '"Pinahahalagahan ko ang oras ninyo."',
      ],
    ),
  ];

  static const String iwasanIntro =
      'May mga salita at pahayag na maaaring maging hindi etikal o hindi ingklusibo dahil maaari nitong maapektuhan ang dignidad ng isang tao o grupo.';

  // Mga Salita at Pariralang Dapat Iwasan
  static const List<Map<String, dynamic>> iwasanList = [
    {
      'title': '1. Mga Label na Mapanlait',
      'desc': 'Iwasang gumamit ng mga katawagang tulad ng:',
      'items': ['"baliw"', '"abnormal"', '"tamad"', '"probinsyano lang"'],
    },
    {
      'title': '2. Pangmamaliit sa Wika at Diyalekto',
      'desc':
          'Iwasang gawing batayan ng halaga o kakayahan ng isang tao ang paraan ng kanyang pagsasalita, wika, o diyalekto.',
    },
    {
      'title': '3. Pambabansag Batay sa Kasarian o Kalagayang Pang-ekonomiya',
      'desc':
          'Iwasan ang mga pahayag na ginagamit ang kasarian o yaman bilang sukatan ng halaga ng isang tao, tulad ng:',
      'example': '"Babae lang naman iyan."',
    },
  ];

  static const String conclusionBody =
      'Sa mabisang komunikasyon, mahalagang piliin ang mga salitang magalang, patas, makatotohanan, at may pananagutan. Ang wastong paggamit ng wika ay hindi lamang nakatutulong sa malinaw na paghahatid ng mensahe; nakatutulong din itong mapanatili ang dignidad at respeto sa bawat taong kasangkot sa komunikasyon.';
}