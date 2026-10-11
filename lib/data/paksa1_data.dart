import "package:wikapp_beta/models/paksa1_model.dart";

class Paksa1Data {
  static const String mainHeader =
      'PAGPAPAKAHULUGAN PARA SA MABISANG KOMUNIKASYON SA KONTEKSTONG PERSONAL AT INTERPERSONAL'; //[cite: 14]
  static const String mainTitle = 'INTRODUKSIYON SA MABISANG KOMUNIKASYON'; //[cite: 14]
  static const String subtitle = 'Araling Panlipunan • 1st Term';

  static const String introBody1 =
      'Ang komunikasyon ay hindi lamang simpleng pagpapalitan ng salita o impormasyon. '
      'Ito ay isang dinamiko at tuloy-tuloy na proseso ng pagpapahayag, pagtanggap, at '
      'pagbibigay-kahulugan sa mga mensahe. Maaari itong maisagawa sa iba\'t ibang paraan '
      'tulad ng pasalita, pasulat, di-berbal, at multimodal na komunikasyon.'; //[cite: 14]

  static const String introBody2 =
      'Higit pa rito, ang komunikasyon ay isang proseso ng paglikha ng kahulugan '
      '(meaning-making) na ginagamit upang matugunan ang iba\'t ibang layunin — personal, '
      'sosyal, kultural, at propesyonal.'; //[cite: 14]

  static const String elementsHeading = 'Mahahalagang Elemento ng Komunikasyon'; //[cite: 14]
  static const List<ElementItem> elements = [
    ElementItem(
      title: '1. Tagapagpadala (Sender)', //[cite: 14]
      description: 'Siya ang pinagmumulan o nagpapahayag ng mensahe.', //[cite: 14]
    ),
    ElementItem(
      title: '2. Mensahe (Message)', //[cite: 14]
      description: 'Tumutukoy sa impormasyon, ideya, saloobin, o kaisipang nais ipahayag.', //[cite: 14]
    ),
    ElementItem(
      title: '3. Daluyan (Medium/Channel)', //[cite: 14]
      description:
          'Ito ang paraan o midyum na ginagamit upang maipadala ang mensahe, gaya ng wika, teknolohiya, o kilos.', //[cite: 14]
    ),
    ElementItem(
      title: '4. Tagatanggap (Receiver)', //[cite: 14]
      description: 'Siya ang tumatanggap at nagbibigay ng kahulugan sa mensahe.', //[cite: 14]
    ),
    ElementItem(
      title: '5. Konteksto (Context)', //[cite: 14]
      description:
          'Tumutukoy sa sitwasyon, kultura, lugar, panahon, at relasyong sosyal na nakapaligid sa komunikasyon.', //[cite: 14]
    ),
    ElementItem(
      title: '6. Tugon (Feedback)', //[cite: 14]
      description: 'Ito ang reaksyon o sagot ng tagatanggap sa mensaheng natanggap.', //[cite: 14]
    ),
    ElementItem(
      title: '7. Ingay (Noise)', //[cite: 14]
      description:
          'Anumang sagabal na maaaring makaapekto sa proseso ng komunikasyon. Maaaring ito ay pisikal, semantiko, o sikolohikal.', //[cite: 14]
    ),
  ];

  static const String elementsClosing =
      'Hindi nagtatapos ang komunikasyon sa simpleng pagpapadala ng mensahe. '
      'Nagiging matagumpay lamang ito kapag ang mensahe ay nauunawaan, napagtitibay, '
      'at nakauugnay sa layunin ng tagapagsalita o manunulat.'; //[cite: 14]

  static const String katangianHeading =
      'Mga Katangian ng Mabisang Teksto para sa Komunikasyon'; //[cite: 14]
  static const List<KatangianItem> katangianList = [
    KatangianItem(
      title: 'Malinaw (Clarity)', //[cite: 14]
      description: 'Madaling maunawaan ang mensaheng ipinapahayag.', //[cite: 14]
    ),
    KatangianItem(
      title: 'Angkop (Appropriateness)', //[cite: 14]
      description: 'Naaayon ang mensahe sa layunin at sa audience o tagatanggap.', //[cite: 14]
    ),
    KatangianItem(
      title: 'Lohikal (Logical)', //[cite: 14]
      description: 'Maayos at makatuwiran ang pagkakasunod-sunod ng mga ideya.', //[cite: 14]
    ),
    KatangianItem(
      title: 'Kohesyong Gramatikal', //[cite: 14]
      description: 'Wasto at maayos ang pagkakaugnay-ugnay ng mga pangungusap.', //[cite: 14]
    ),
  ];

  static const String paanoHeading = 'Paano Nagkakaroon ng Mabisang Komunikasyon?'; //[cite: 14]
  static const String paanoIntro =
      'Upang maging epektibo ang komunikasyon, mahalagang isaalang-alang ang mga sumusunod:'; //[cite: 15]

  static const List<ParaanItem> paanoList = [
    ParaanItem(
      number: '1',
      title: 'Kalinawan ng Wika at Mensahe (Clarity of Message)', //[cite: 15]
      description:
          'Ang mensahe ay kailangang malinaw, tuwiran, organisado, at walang kalabuan. '
          'Dapat ding piliin ang wikang angkop sa antas ng kaalaman at pag-unawa ng tagatanggap.', //[cite: 15]
      badExample:
          '"Ipagkakaloob ang nasabing insentibo ayon sa itinatadhana ng pamantayan."', //[cite: 15]
      goodExample:
          '"Makakakuha ng insentibo ang mga kwalipikadong estudyante ayon sa itinakdang alituntunin."', //[cite: 15]
    ),
    ParaanItem(
      number: '2',
      title: 'Angkop na Tono (Tone Appropriateness)', //[cite: 15]
      description:
          'Ang tono ng komunikasyon ay dapat na naaayon sa layunin ng mensahe at sa '
          'relasyon ng mga taong nag-uusap. Maaari itong maging pormal, di-pormal, palakaibigan, o propesyonal.', //[cite: 15]
      badExample: 'Sa isang liham aplikasyon:\n"Lubos po akong interesado sa posisyong iniaalok ng inyong tanggapan."', //[cite: 15]
      goodExample: 'Sa pakikipag-text sa isang kaibigan:\n"Uy, balita ko may opening sa opisina n\'yo?"', //[cite: 15]
    ),
    ParaanItem(
      number: '3',
      title: 'Pagpapahalaga sa Konteksto', //[cite: 15]
      description:
          'Mahalagang isaalang-alang ang sosyal, kultural, at emosyonal na konteksto ng '
          'isang mensahe. Maaaring magbago ang kahulugan ng isang pahayag depende sa kausap, lugar, oras, sitwasyon, at layunin.', //[cite: 15]
      subExamples: [
        'Pagsang-ayon: "Ayos \'yan!"', //[cite: 15]
        'Pang-aliw: "Ayos lang, \'wag mong isipin."', //[cite: 15]
        'Pagtanggap: "Ayos, sige!"', //[cite: 15]
      ],
    ),
    ParaanItem(
      number: '4',
      title: 'Paggamit ng Di-Berbal na Estratehiya', //[cite: 15]
      description:
          'Bahagi rin ng mabisang komunikasyon ang paggamit ng mga di-berbal na paraan tulad ng '
          'kilos, ekspresyon ng mukha, tindig, at eye contact. Nakakatulong ang mga ito upang higit na mapalakas o maipakita ang mensahe.', //[cite: 15]
      subExamples: [
        'Pagngiti habang bumabati - maaaring magpahiwatig ng sinseridad.', //[cite: 15]
        'Pagkibit-balikat - maaaring magpahayag ng kawalang-interes o pag-aalinlangan.', //[cite: 15]
      ],
    ),
    ParaanItem(
      number: '5',
      title: 'Pakikinig at Feedback', //[cite: 16]
      description:
          'Ang mabisang komunikasyon ay isang dalawahang proseso (two-way communication). '
          'Hindi lamang mahalaga ang pagsasalita; kailangan din ang aktibong pakikinig at pagbibigay ng makabuluhang tugon.', //[cite: 16]
      dialogueRole1: 'Guro', //[cite: 16]
      dialogueText1: '"Ano ang masasabi ninyo tungkol sa epekto ng social media?"', //[cite: 16]
      dialogueRole2: 'Estudyante', //[cite: 16]
      dialogueText2:
          '"Para po sa akin, nakatutulong ito sa mabilis na komunikasyon, ngunit mayroon din itong mga negatibong epekto tulad ng misimpormasyon."', //[cite: 16]
    ),
    ParaanItem(
      number: '6',
      title: 'Kaangkupan sa Audience at Layunin', //[cite: 16]
      description:
          'Ang pagpili ng wika, estruktura, at estratehiya ay dapat nakabatay sa taong '
          'kinakausap at sa layunin ng mensahe. Hindi pareho ang paraan ng pakikipag-usap sa guro at sa kaibigan.', //[cite: 16]
      audienceContext: 'Audience: Principal | Layunin: Humingi ng pahintulot | Wika: Pormal at magalang', //[cite: 16]
      goodExample:
          '"Magandang araw po. Nais ko lamang pong humingi ng inyong pahintulot para sa aming panukalang proyekto."', //[cite: 16]
    ),
  ];

  static const String meaningHeading = 'PAGPAPAKAHULUGAN (MEANING-MAKING)'; //[cite: 16]
  static const String meaningBody1 =
      'Ang pagpapakahulugan o meaning-making ay ang aktibong proseso ng pag-unawa '
      'at pagbibigay ng kahulugan sa mga mensaheng natatanggap ng isang tao. Ang mga '
      'mensaheng ito ay maaaring pasalita, pasulat, di-berbal, o multimodal.'; //[cite: 16]
  static const String meaningBody2 =
      'Hindi lamang ito simpleng pagtanggap ng impormasyon. Sa halip, ginagamit ng isang '
      'tao ang kaniyang sariling kaalaman, karanasan, paniniwala, damdamin, at konteksto upang mabuo ang kahulugan ng isang mensahe.'; //[cite: 16]

  static const String paanoNangyayariTitle = 'Paano Nangyayari ang Pagpapakahulugan?'; //[cite: 16]
  static const String denotativeTitle = '1. Literal na Pagpapakahulugan (Denotative Meaning)'; //[cite: 16]
  static const String denotativeDesc =
      'Ito ay tumutukoy sa tuwiran o direktang kahulugan ng isang salita batay sa diksyunaryo o karaniwang gamit nito.'; //[cite: 16]
  static const String denotativeExample = 'Salita: "Ilaw" | Denotasyon: Isang bagay o kasangkapang nagbibigay-liwanag.'; //[cite: 16]

  static const String connotativeTitle = '2. Konotatibong Pagpapakahulugan (Connotative Meaning)'; //[cite: 16]
  static const String connotativeDesc =
      'Ito ay tumutukoy sa di-literal na kahulugan ng isang salita. Nabubuo ito batay sa damdamin, '
      'kultura, karanasan, at kontekstong kinabibilangan ng tagapakinig o tagabasa.'; //[cite: 16]
  static const String connotativeExample =
      'Salita: "Ilaw" | Konotasyon: Ang ina bilang "ilaw ng tahanan" ay maaaring sumimbolo sa paggabay, pagmamahal, at sakripisyo.'; //[cite: 17]

  static const String salikHeading = 'Mga Salik na Nakaaapekto sa Pagpapakahulugan'; //[cite: 17]
  static const List<SalikItem> salikList = [
    SalikItem(
      number: '1',
      title: 'Kultura', //[cite: 17]
      description:
          'Ang bawat kultura ay may sariling mga simbolo, paniniwala, kaugalian, at paraan ng pagbibigay-kahulugan.', //[cite: 17]
      sitwasyon:
          'Isang estudyanteng Pilipino na kasali sa student exchange program sa Japan ang bumati sa kaniyang Japanese host teacher ng, "Magandang umaga po!" at sabay na nagmano.', //[cite: 17]
      pagpapakahulugan:
          'Sa kulturang Pilipino, ang pagmamano ay karaniwang simbolo ng paggalang. Gayunman, sa kulturang Hapones, hindi ito bahagi ng kanilang karaniwang paraan ng pagbati. Dahil dito, maaaring magulat ang guro at hindi agad malaman kung paano tutugon.', //[cite: 17]
      tukoyNaSalik: 'Kultura', //[cite: 17]
      insight:
          'Maaaring magkaiba ang kahulugan ng isang kilos depende sa kulturang pinagmumulan at sa kulturang kinabibilangan ng kausap.', //[cite: 17]
    ),
    SalikItem(
      number: '2',
      title: 'Konteksto', //[cite: 17]
      description:
          'Ang kahulugan ng isang mensahe ay maaaring magbago depende sa lugar, oras, sitwasyon, at taong kausap.', //[cite: 17]
      sitwasyon:
          'Nakatanggap si Alyssa ng text message mula sa kaniyang kaklaseng si Mark: "Bahala ka sa buhay mo."', //[cite: 17]
      pagpapakahulugan:
          'Kung sinabi ito habang nagtatawanan sila, maaaring biro lamang ito. Ngunit kung sinabi ito habang nagtatalo, maaari itong magpahiwatig ng galit, pagtatakwil, o pananakit ng damdamin.', //[cite: 17]
      tukoyNaSalik: 'Konteksto ng usapan', //[cite: 17]
      insight:
          'Mahalaga ang emosyonal at sitwasyunal na konteksto upang maunawaan nang tama ang intensiyon ng isang mensahe.', //[cite: 17]
    ),
    SalikItem(
      number: '3',
      title: 'Karanasan', //[cite: 17]
      description:
          'Ang personal na karanasan ng tagatanggap ay maaaring makaapekto sa paraan ng kaniyang pag-unawa sa isang mensahe.', //[cite: 17]
      sitwasyon:
          'Habang nagkaklase, ginamit ng guro ang salitang "binagyo" upang ilarawan ang problemang naranasan ng isang karakter sa kuwento.', //[cite: 17]
      pagpapakahulugan:
          'Si Maria, na aktuwal na nawalan ng bahay dahil sa bagyo, ay maaaring maging emosyonal sa paggamit ng salita. Samantala, maaaring isipin lamang ni Jake na ang "binagyo" ay tumutukoy sa isang sitwasyong may malakas na ulan.', //[cite: 17, 18]
      tukoyNaSalik: 'Personal na karanasan', //[cite: 18]
      insight:
          'Ang pag-unawa sa wika ay maaaring maimpluwensiyahan ng sariling alaala, karanasan, at emosyon.', //[cite: 18]
    ),
    SalikItem(
      number: '4',
      title: 'Antas ng Kaalaman', //[cite: 18]
      description:
          'Mas malalim ang maaaring maging pag-unawa ng isang tao sa isang mensahe kung mayroon na siyang sapat na kaalaman tungkol sa paksa.', //[cite: 18]
      sitwasyon:
          'Sinabi ng guro: "Ang heterogenous na klase ay nangangailangan ng differentiated instruction."', //[cite: 18]
      pagpapakahulugan:
          'Si Anton, na may background sa edukasyon, ay maaaring madaling maunawaan ang pahayag. Samantala, si Kim, na bagong salta sa klase at walang sapat na kaalaman tungkol sa konsepto, ay maaaring mahirapang sundan ang talakayan.', //[cite: 18]
      tukoyNaSalik: 'Antas ng kaalaman ng tagatanggap', //[cite: 18]
      insight:
          'Mas nagiging epektibo ang komunikasyon kapag ang wikang ginagamit ay naaayon sa kaalaman at kakayahan ng kausap.', //[cite: 18]
    ),
    SalikItem(
      number: '5',
      title: 'Panlipunang Papel', //[cite: 18]
      description:
          'Maaari ring magbago ang kahulugan ng isang pahayag batay sa tungkulin o relasyon ng tagapagsalita at tagapakinig, tulad ng relasyon ng guro at estudyante.', //[cite: 18]
      sitwasyon: 'Sinabi ng isang estudyante: "Wala po akong pakialam."', //[cite: 18]
      pagpapakahulugan:
          'Kung sinabi ito sa isang kaklase, maaari lamang itong maging pagpapahayag ng inis o pagkainis. Ngunit kung sinabi ito sa harap ng guro, maaari itong ituring na kawalang-galang.', //[cite: 18]
      tukoyNaSalik: 'Panlipunang papel ng nagsasalita at kausap', //[cite: 18]
      insight:
          'May malaking impluwensiya ang relasyong sosyal, gaya ng ugnayan ng estudyante at guro, sa pagbibigay-kahulugan sa isang pahayag.', //[cite: 18]
    ),
  ];

  static const String kahalagahanHeading =
      'Kahalagahan ng Pagpapakahulugan sa Mabisang Komunikasyon'; //[cite: 18]
  static const List<KahalagahanItem> kahalagahanList = [
    KahalagahanItem(
      number: '1',
      title: 'Nagpapalalim ng Ugnayan', //[cite: 18]
      description:
          'Kapag nauunawaan ang tunay na kahulugan ng isang mensahe, nagiging mas makabuluhan ang komunikasyon at mas napapalalim ang relasyon ng mga taong nag-uusap.', //[cite: 18]
      sitwasyon: 'Sinabi ng isang anak sa kaniyang ina: "Pagod na ako."', //[cite: 18]
      detail:
          'Kung makikinig ang ina nang may empatiya, maaari niyang maunawaan na ang pagod ng anak ay maaaring hindi lamang pisikal na pagod sa mga gawain, kundi maaari ring may kaugnayan sa kaniyang emosyon o nararamdaman. Dahil dito, maaari silang magkaroon ng bukas na pag-uusap tungkol sa kaniyang saloobin.', //[cite: 19]
      insight:
          'Ang wastong pag-unawa sa damdaming nakapaloob sa isang pahayag ay nakatutulong sa pagpapatibay ng relasyon.', //[cite: 19]
    ),
    KahalagahanItem(
      number: '2',
      title: 'Naiaayon ang Kahulugan sa Konteksto', //[cite: 19]
      description:
          'Hindi lahat ng pahayag ay dapat unawain nang literal. Mahalagang isaalang-alang ang subtext, emosyon, sitwasyon, at iba pang salik na nakapaligid sa mensahe.', //[cite: 19]
      sitwasyon:
          'Isang pulitiko ang nagsabi: "Handa akong magsakripisyo para sa bayan."', //[cite: 19]
      detail:
          'Kung sinabi ito sa gitna ng isang iskandalo, maaaring tingnan ito ng ilan bilang isang pahayag na hindi tugma sa sitwasyon. Ngunit kung sinabi ito sa isang seryosong panayam, maaaring ituring ito bilang isang taos-pusong pagpapahayag.', //[cite: 19]
      insight:
          'Ang pagpapakahulugan sa isang pahayag ay maaaring nakasalalay sa panahon, lugar, sitwasyon, at reputasyon ng tagapagsalita.', //[cite: 19]
    ),
    KahalagahanItem(
      number: '3',
      title: 'Nakaiiwas sa Hindi Pagkakaunawaan', //[cite: 19]
      description:
          'Maraming hindi pagkakaunawaan at alitan ang maaaring magmula sa maling interpretasyon ng mensahe. Dahil dito, mahalagang tiyaking tama ang pag-unawa sa sinabi ng kausap.', //[cite: 19]
      sitwasyon: 'Sinabi ng isang guro: "Ayusin mo \'yan. Ayokong magkamali ka ulit."', //[cite: 19]
      detail:
          'Kung hindi ito naproseso nang maayos, maaaring isipin ng estudyante na siya ay pinupuna o pinapahiya. Ngunit kung malinaw ang paliwanag ng guro, maaari niyang maunawaan na ang pahayag ay isang payo at paraan ng paggabay.', //[cite: 19]
      insight:
          'Ang malinaw na pagpapakahulugan ay nakatutulong upang maiwasan ang alitan, maling akala, at hindi pagkakaunawaan.', //[cite: 19]
    ),
  ];

  static const String hudyatHeading = 'HUDYAT AT ESTRATEHIYA SA PAGPAPADALOY NG USAPAN'; //[cite: 19]
  static const String hudyatIntro =
      'Ang hudyat ay mga salita, parirala, o ekspresyong ginagamit upang pag-ugnayin ang iba\'t ibang bahagi ng isang usapan o teksto. Tinatawag din ang mga ito na cohesive devices o discourse markers.'; //[cite: 20]

  static const String hudyatLayuninTitle = 'Layunin ng Hudyat'; //[cite: 20]
  static const String hudyatLayuninIntro = 'Ang mga hudyat ay ginagamit upang:'; //[cite: 20]
  static const List<String> hudyatLayuninBullets = [
    'mapanatili ang maayos na pagkakasunod-sunod at daloy ng mga ideya;', //[cite: 20]
    'maipakita ang ugnayan ng mga pahayag tulad ng pagsang-ayon, pagtutol, pagbibigay ng halimbawa, at iba pa; at', //[cite: 20]
    'maiwasan ang kalituhan ng tagapakinig o mambabasa.', //[cite: 20]
  ];

  static const String hudyatKahalagahanTitle =
      'Kahalagahan ng Hudyat at Estratehiya sa Mabisang Komunikasyon'; //[cite: 20]
  static const List<KatangianItem> hudyatKahalagahanList = [
    KatangianItem(
      title: '1. Nagpapalinaw sa Lohika ng Usapan', //[cite: 20]
      description:
          'Nakakatulong ang mga hudyat upang maunawaan ng tagapakinig ang direksiyon at pagkakaugnay ng mga ideya sa isang diskurso.', //[cite: 20]
    ),
    KatangianItem(
      title: '2. Nagpapalalim ng Pakikipag-ugnayan', //[cite: 20]
      description:
          'Ang mga estratehiya tulad ng pagtugon, pagbibigay-daan, at pagsang-ayon ay nagpapakita ng pakikiisa, paggalang, at aktibong pakikilahok sa usapan.', //[cite: 20]
    ),
    KatangianItem(
      title: '3. Nagpapalawak ng Talakayan', //[cite: 20]
      description:
          'Nagiging mas aktibo at makabuluhan ang isang usapan kapag hindi lamang isang tao ang nagsasalita, kundi may palitan ng ideya at opinyon.', //[cite: 20]
    ),
    KatangianItem(
      title: '4. Nakaiiwas sa Hindi Pagkakaunawaan', //[cite: 20]
      description:
          'Ang maayos na pagkakasunod-sunod at daloy ng usapan ay nakatutulong upang maging malinaw ang punto at layunin ng bawat kalahok.', //[cite: 20]
    ),
  ];

  static const String uriHudyatTitle = 'Mga Uri ng Hudyat'; //[cite: 20]
  static const List<HudyatRow> hudyatRows = [
    HudyatRow(
      uri: 'Pagsisimula', //[cite: 20]
      halimbawa: 'Sa simula, Unang-una, Bilang panimula', //[cite: 20]
      pangungusap: '"Sa simula pa lamang, mahalaga na ang papel ng wika."', //[cite: 20]
    ),
    HudyatRow(
      uri: 'Pagdaragdag', //[cite: 20]
      halimbawa: 'Bukod dito, Gayundin, Dagdag pa rito', //[cite: 20]
      pangungusap: '"Bukod dito, mahalagang sanayin ang pakikinig."', //[cite: 20]
    ),
    HudyatRow(
      uri: 'Paghahalimbawa', //[cite: 20]
      halimbawa: 'Halimbawa, Tulad ng, Gaya ng', //[cite: 20]
      pangungusap: '"Gaya ng Facebook at Twitter, maraming gamit ang social media."', //[cite: 20]
    ),
    HudyatRow(
      uri: 'Pagtutulad/Pagkakaiba', //[cite: 20]
      halimbawa: 'Samantalang, Ngunit, Sa kabilang banda', //[cite: 20]
      pangungusap: '"Mahusay siya sa pagsasalita, ngunit nahihirapan siya sa pagsusulat."', //[cite: 20]
    ),
    HudyatRow(
      uri: 'Sanhi at Bunga', //[cite: 20]
      halimbawa: 'Dahil dito, Kaya naman, Bunga nito', //[cite: 20]
      pangungusap: '"Bunga ng tamang pag-aaral, siya ay pumasa."', //[cite: 20]
    ),
    HudyatRow(
      uri: 'Pagwawakas o Konklusyon', //[cite: 20]
      halimbawa: 'Sa wakas, Sa kabuuan, Bilang pagtatapos', //[cite: 20]
      pangungusap: '"Sa wakas, natutuhan naming pahalagahan ang komunikasyon."', //[cite: 20]
    ),
  ];

  static const String estratehiyaTitle = 'Ano ang Estratehiya sa Pagpapadaloy ng Usapan?'; //[cite: 21]
  static const String estratehiyaDef =
      'Ang estratehiya sa pagpapadaloy ng usapan ay tumutukoy sa iba\'t ibang paraan upang mapanatiling '
      'aktibo, malinaw, maayos, at makabuluhan ang pagpapalitan ng mga ideya sa isang komunikatibong sitwasyon.'; //[cite: 21]

  static const String estratehiyaSubheading = 'Mga Estratehiya sa Pagpapadaloy ng Usapan'; //[cite: 21]
  static const List<EstratehiyaItem> estratehiyaList = [
    EstratehiyaItem(
      number: '1',
      title: 'Pagtatanong (Questioning)', //[cite: 21]
      description:
          'Ito ay paggamit ng mga tanong upang mapalalim ang talakayan o malaman ang pananaw at opinyon ng kausap.', //[cite: 21]
      halimbawa: '"Ano ang masasabi mo tungkol dito?"', //[cite: 21]
    ),
    EstratehiyaItem(
      number: '2',
      title: 'Pagtugon (Responding)', //[cite: 21]
      description:
          'Ito ay pagbibigay ng tugon sa ideya o pahayag ng kausap bilang pagpapakita ng aktibong pakikinig at pakikilahok.', //[cite: 21]
      halimbawa: '"Tama ka riyan. Sa palagay ko..."', //[cite: 21]
    ),
    EstratehiyaItem(
      number: '3',
      title: 'Pagbibigay ng Halimbawa', //[cite: 21]
      description:
          'Ginagamit ito upang magbigay ng konkretong detalye na makatutulong sa paglilinaw o pagpapaliwanag ng isang ideya.', //[cite: 21]
      halimbawa: '"Halimbawa, noong pandemya, mas naging laganap ang online class."', //[cite: 21]
    ),
    EstratehiyaItem(
      number: '4',
      title: 'Pagsang-ayon/Pagtutol', //[cite: 21]
      description:
          'Ito ay pagpapahayag ng pagsang-ayon o hindi pagsang-ayon sa pananaw ng kausap. Dapat itong gawin nang magalang at lohikal.', //[cite: 21]
      halimbawa: '"Sang-ayon ako, ngunit may ibang pananaw din ako tungkol diyan."', //[cite: 21]
    ),
    EstratehiyaItem(
      number: '5',
      title: 'Pagpapalawak ng Ideya', //[cite: 21]
      description:
          'Ginagamit ito upang magdagdag ng impormasyon, detalye, o paliwanag upang higit na mapalalim ang isang pahayag.', //[cite: 21, 22]
      halimbawa: '"Isa pa, dapat ding isaalang-alang ang emosyonal na epekto nito."', //[cite: 22]
    ),
    EstratehiyaItem(
      number: '6',
      title: 'Pagbibigay-daan (Turn-taking)', //[cite: 22]
      description:
          'Ito ay maayos na pagsasalitan ng mga kalahok upang mabigyan ang bawat isa ng pagkakataong magsalita at magpahayag ng pananaw.', //[cite: 22]
      halimbawa: '"Ikaw naman, anong pananaw mo?"', //[cite: 22]
    ),
    EstratehiyaItem(
      number: '7',
      title: 'Pagwawakas ng Usapan', //[cite: 22]
      description:
          'Ito ay maayos na pagsasara ng isang talakayan matapos maipahayag at mapag-usapan ang mahahalagang ideya.', //[cite: 22]
      halimbawa: '"Sa madaling sabi, lahat tayo ay may papel sa epektibong komunikasyon."', //[cite: 22]
    ),
  ];

  static const String scriptTitle = 'Sitwasyonal na Halimbawa: Pagsasanib ng Hudyat at Estratehiya'; //[cite: 22]
  static const List<DialogueLine> scriptLines = [
    DialogueLine(
      speaker: 'Juan', //[cite: 22]
      text:
          'Sa simula, nais kong ipunto na laganap na ang cyberbullying sa mga kabataan. Halimbawa, maraming kaso sa social media na humahantong sa depresyon.', //[cite: 22]
    ),
    DialogueLine(
      speaker: 'Ana', //[cite: 22]
      text:
          'Sang-ayon ako, ngunit dagdag pa rito, may mga kaso ring pinagtatawanan ito ng mga guro at magulang.', //[cite: 22]
    ),
    DialogueLine(
      speaker: 'Mark', //[cite: 22]
      text:
          'Sa kabilang banda, dapat din nating itanong, paano nga ba natin mapipigilan ito?', //[cite: 22]
    ),
    DialogueLine(
      speaker: 'Juan', //[cite: 22]
      text:
          'Kaya naman, naniniwala akong mahalagang isama ito sa mga programang pang-edukasyon.', //[cite: 22]
    ),
    DialogueLine(
      speaker: 'Ana', //[cite: 22]
      text:
          'Sa kabuuan, kailangan ng aktibong partisipasyon ng lahat upang matugunan ang isyung ito.', //[cite: 22]
    ),
  ];

  static const String scriptAnalysis1 =
      'Sa halimbawang ito, makikita kung paano ginagamit ang mga hudyat tulad ng '
      '"sa simula," "halimbawa," "sang-ayon ako," "dagdag pa rito," "sa kabilang banda," '
      '"kaya naman," at "sa kabuuan" upang maging organisado at malinaw ang daloy ng talakayan.'; //[cite: 22]

  static const String scriptAnalysis2 =
      'Kasabay nito, ginamit ng mga kalahok ang iba\'t ibang estratehiya sa pagpapadaloy '
      'ng usapan, tulad ng pagbibigay ng halimbawa, pagsang-ayon, pagpapalawak ng ideya, '
      'pagtatanong, at pagbibigay ng konklusyon. Sa ganitong paraan, nagiging mas maayos, '
      'aktibo, at makabuluhan ang komunikasyon.'; //[cite: 22]
}