class KatangianItem {
  final int number;
  final String title;
  final String description;
  final String? badExample;
  final String? goodExample;
  final String? note;

  const KatangianItem({
    required this.number,
    required this.title,
    required this.description,
    this.badExample,
    this.goodExample,
    this.note,
  });
}

class DosDontsItem {
  final int number;
  final String title;
  final String description;
  final String example;

  const DosDontsItem({
    required this.number,
    required this.title,
    required this.description,
    required this.example,
  });
}

class WorkDocumentItem {
  final int number;
  final String title;
  final String description;
  final String example;
  final Map<String, dynamic>? templateData;

  const WorkDocumentItem({
    required this.number,
    required this.title,
    required this.description,
    required this.example,
    this.templateData,
  });
}

class Paksa8Data {
  static const String mainHeader =
      'PAKSA 8: KOMUNIKASYONG PAGSULAT SA KONTEKSTONG PANTRABAHO AT PROPESYONAL';
  static const String subtitle = 'Araling Panlipunan • 3rd Term';

  static const String introBody =
      'Sa mundo ng trabaho at propesyon, mahalaga ang pagkakaroon ng epektibong kasanayan sa komunikasyon. Ang komunikasyong pasulat ay nagsisilbing mahalagang daan upang maihatid nang maayos ang mga mensahe, ulat, at iba pang dokumento sa loob at labas ng isang organisasyon.\n\nSa araling ito, matututuhan ng mga mag-aaral ang wastong paraan ng pormal, obhetibo, at malinaw na pagsulat na may tiyak na layunin at magagamit nila sa kanilang napiling karera.';

  static const String tuntuninIntro =
      'Ang tekstong pantrabaho ay naiiba sa malikhaing pagsulat. Higit na binibigyang-pansin dito ang kawastuhan ng impormasyon, kalinawan ng mensahe, at propesyonal na paraan ng pagpapahayag. Ang mga katangiang ito ay mahalaga upang mapanatili ang kredibilidad ng isang empleyado at ng organisasyong kaniyang kinakatawan.';

  // 4 Katangian ng Propesyonal na Komunikasyong Pasulat
  static const List<KatangianItem> katangianList = [
    KatangianItem(
      number: 1,
      title: 'Obhetibo',
      description:
          'Ang pagsulat ay dapat nakabatay sa mga katotohanan at hindi lamang sa personal na damdamin o opinyon.',
      note:
          'Halimbawa: Sa halip na sabihing "Malaki ang kinita ng kumpanya," ilahad ang aktuwal na halaga ng kita sa isang sales report.',
    ),
    KatangianItem(
      number: 2,
      title: 'Malinaw',
      description:
          'Dapat madaling maunawaan ang mensahe at iwasan ang mahahabang paliwanag na hindi naman kinakailangan.',
      note:
          'Halimbawa: Gumamit ng simple at madaling maintindihang mga salita sa isang memo upang agad maunawaan ng empleyado ang ipinag-uutos.',
    ),
    KatangianItem(
      number: 3,
      title: 'Tiyak',
      description:
          'Dapat direkta sa pangunahing punto ang mensahe at alisin ang mga salitang hindi naman mahalaga sa pagpapahayag.',
      badExample: 'Kung maaari sana, maibigay mo ang ulat kapag tapos na ang oras.',
      goodExample: 'Pakipasa ang ulat bukas ng 5:00 PM.',
    ),
    KatangianItem(
      number: 4,
      title: 'Magalang',
      description:
          'Kailangang gumamit ng propesyonal at magalang na pananalita anuman ang posisyon o katayuan ng kausap sa lugar ng trabaho.',
      note:
          'Halimbawa: Maaaring gamitin ang "Dear Mr. Cruz" bilang panimula at "Sincerely yours" bilang pangwakas sa isang pormal na liham.',
    ),
  ];

  // Dos
  static const List<DosDontsItem> dosList = [
    DosDontsItem(
      number: 1,
      title: 'Gumamit ng Aktibong Tinig',
      description: 'Mas malinaw at direkta ang mensahe kapag aktibong tinig ang ginagamit.',
      example: '"Tinapos ng pangkat ang proyekto."',
    ),
    DosDontsItem(
      number: 2,
      title: 'Suriin ang Baybay at Gramatika',
      description:
          'Bago ipadala ang isang dokumento o email, tiyaking tama ang baybay, gramatika, pangalan, at iba pang mahahalagang detalye.',
      example: 'I-double-check ang pangalan ng kliyente bago ipadala ang email.',
    ),
    DosDontsItem(
      number: 3,
      title: 'Maging Tiyak sa Layunin',
      description:
          'Dapat malinaw agad kung ano ang layunin ng liham, memo, o iba pang dokumentong ginagawa.',
      example: '"Ang layunin ng liham na ito ay humingi ng pahintulot para sa seminar."',
    ),
  ];

  // Don'ts
  static const List<DosDontsItem> dontsList = [
    DosDontsItem(
      number: 1,
      title: 'Iwasan ang Jargon o Labis na Teknikal na Wika',
      description:
          'Gumamit ng wikang madaling maunawaan ng target na mambabasa, lalo na kung hindi pamilyar sa mga teknikal na termino ang kausap.',
      example:
          'Iwasang gumamit ng sobrang komplikadong technical code sa isang ulat na inilaan para sa mga kliyenteng hindi pamilyar sa teknolohiya.',
    ),
    DosDontsItem(
      number: 2,
      title: 'Huwag Gumamit ng Emoji o Slang',
      description:
          'Hindi angkop ang impormal na ekspresyon sa mga pormal na dokumento at komunikasyon sa trabaho.',
      example: 'Iwasang maglagay ng "LOL" o ":)" sa isang pormal na liham tungkol sa pagliban sa trabaho.',
    ),
    DosDontsItem(
      number: 3,
      title: 'Iwasang Maging Labis na Emosyonal',
      description:
          'Panatilihing propesyonal at mahinahon ang paraan ng pagpapahayag, lalo na kapag may reklamo o hindi pagkakaunawaan.',
      example:
          'Iwasang sumulat ng reklamong puno ng galit, paninisi, o masasakit na salita laban sa isang katrabaho.',
    ),
  ];

  static const String docsIntro =
      'Ang bawat dokumentong ginagamit sa trabaho ay may partikular na layunin. Ang ilan ay ginagamit upang ipakilala ang sarili at ang mga kakayahan, samantalang ang iba naman ay ginagamit upang makipag-ugnayan o magtala ng mahahalagang impormasyon at desisyon. Ang wastong paggawa ng mga dokumentong ito ay nakatutulong sa maayos na daloy ng komunikasyon sa isang organisasyon.';

  // 5 Document Types with Format Examples
  static const List<WorkDocumentItem> documentsList = [
    WorkDocumentItem(
      number: 1,
      title: 'Professional Profile',
      description:
          'Ang Professional Profile ay isang maikling talata na naglalahad ng mga kasanayan, karanasan, at mahahalagang nakamit ng isang tao. Karaniwan itong inilalagay sa itaas na bahagi ng resume o sa isang professional profile gaya ng LinkedIn.',
      example:
          'Isang masigasig at disiplinadong mag-aaral ng Grade 11 STEM strand na may mahusay na kasanayan sa pagsusuri ng datos at technical writing. Aktibong lider ng Science Club at may sapat na kaalaman sa paggamit ng Microsoft Office Suite. Naghahanap ng pagkakataon para sa Work Immersion upang magamit ang kaalaman sa laboratory research at higit pang mapaunlad ang kakayahan sa paglutas ng mga komplikadong sularin.',
    ),
    WorkDocumentItem(
      number: 2,
      title: 'Resume',
      description:
          'Ang Resume ay isang dokumentong naglalaman ng mahahalagang impormasyon tungkol sa isang aplikante, kabilang ang personal na impormasyon, edukasyon, karanasan sa trabaho, mga kasanayan, at mga organisasyong kinabibilangan.',
      example:
          'Isang dalawang-pahinang dokumento na naglalaman ng impormasyon tungkol sa mga dating pinagtatrabahuhan, natapos na edukasyon, mga kasanayan, at mga seminar na dinaluhan.',
      templateData: {
        'name': 'JUAN D. DE LA CRUZ',
        'address': 'Purok 1, Brgy. San Jose, Cainta, Rizal',
        'contact': '0912-345-6789 | juan.delacruz@email.com',
        'education': [
          'Senior High School - STEM Strand (Kasalukuyan)',
          'Mataas na Paaralan ng San Jose',
          'Academic Award: With Honors (Grade 10)',
        ],
        'skills': [
          'Mahusay sa pakikipagtalastasan sa Filipino at Ingles',
          'Basic Graphic Design gamit ang Canva at Photoshop',
          'Time Management at Leadership',
        ],
        'organizations': [
          'Pangulo, Filipino Club (2025-2026)',
          'Manunulat, Ang Pluma - Official School Publication',
        ],
      },
    ),
    WorkDocumentItem(
      number: 3,
      title: 'Application Letter (Liham Aplikasyon)',
      description:
          'Ang Application Letter ay isang pormal na liham na karaniwang isinasama sa resume upang ipahayag ang interes ng isang aplikante sa isang bakanteng posisyon. Nilalaman din nito ang mga dahilan kung bakit ang aplikante ay maaaring maging angkop sa posisyong inaaplayan.',
      example:
          'Sumusulat po ako upang ipahayag ang aking interes na mag-apply bilang Administrative Assistant sa inyong kumpanya.',
      templateData: {
        'date': 'Mayo 11, 2026',
        'recipient': 'G. RICARDO VALDEZ\nHuman Resources Manager\nABC Tech Solutions\nLungsod ng Pasig',
        'salutation': 'Mahal na G. Valdez:',
        'body':
            'Magandang araw po!\n\nAko po ay isang mag-aaral ng Grade 11 mula sa STEM Strand ng Mataas na Paaralan ng San Jose. Sumusulat po ako upang ipahayag ang aking interes na isagawa ang aking 80-hour Work Immersion sa inyong kumpanya.\n\nNaniniwala po ako na ang aking kaalaman sa computer programming at dedikasyon sa pagkatuto ay maaaring makatulong sa inyong Technical Department. Kalakip ng liham na ito ang aking resume para sa inyong pagsusuri.\n\nUmaasa po ako sa inyong positibong tugon. Maraming salamat po sa inyong oras at konsiderasyon.',
        'closing': 'Lubos na gumagalang,',
        'sender': 'JUAN D. DE LA CRUZ\nMag-aaral',
      },
    ),
    WorkDocumentItem(
      number: 4,
      title: 'Email',
      description:
          'Ang Email ay isang elektronikong paraan ng pagpapadala at pagtanggap ng mga mensahe sa loob at labas ng isang organisasyon. Dahil mabilis itong gamitin, karaniwan itong ginagamit sa pagpapadala ng mga anunsyo, ulat, dokumento, at iba pang mahahalagang impormasyon.',
      example:
          'Pagpapadala ng "Project Update" sa team leader gamit ang Outlook o Gmail.',
      templateData: {
        'to': 'renalie.cruz@school.edu.ph',
        'subject':
            'Pagpasa ng Proyekto: Pananaliksik sa Filipino - Pangkat 1 (STEM 11-A)',
        'body':
            'Mahal na Bb. Cruz,\n\nMagandang araw po!\n\nKalakip po ng email na ito ang pinal na kopya ng aming pananaliksik na pinamagatang "Epekto ng Social Media sa Pag-aaral ng mga Estudyante sa Grade 11." Ito po ay isinumite ng Pangkat 1 bilang bahagi ng aming panghuling gawain para sa markahan.\n\nMaraming salamat po. Handa po kaming tumanggap ng inyong mga puna at mungkahi.\n\nGumagalang,\nMARIA CLARA ATENZA\nLider ng Pangkat 1',
      },
    ),
    WorkDocumentItem(
      number: 5,
      title: 'Minutes of the Meeting (Katitikan ng Pulong)',
      description:
          'Ang Minutes of the Meeting o Katitikan ng Pulong ay isang opisyal na talaan ng mga mahahalagang napag-usapan, napagkasunduan, at mga hakbang na kailangang isagawa o action items mula sa isang pagpupulong. Karaniwang nakapaloob dito ang petsa, oras, lugar, mga dumalo, agenda, at mga napagkasunduan.',
      example: 'KATITIKAN NG PULONG NG CLASS OFFICERS GRADE 11-STEM A',
      templateData: {
        'title': 'KATITIKAN NG PULONG NG CLASS OFFICERS\nGRADE 11-STEM A',
        'date': 'Mayo 11, 2026',
        'time': '12:00 PM - 1:00 PM',
        'place': 'Grade 11-A Classroom',
        'attendees':
            'Juan De la Cruz (Pangulo), Maria Atenza (Kalihim), at limang iba pang opisyal.',
        'agendas': [
          'Pagpaplano para sa darating na booth ng Foundation Day.',
          'Pagkolekta ng pondo para sa T-shirt ng klase.',
        ],
        'agreements': [
          'Booth: Napagkasunduan ng mga dumalo na magtayo ng Photo Booth na may retro na tema. Si Juan ang naatasang mangasiwa sa mga kinakailangang kagamitan.',
          'Badyet: Ang bawat mag-aaral ay mag-aambag ng P150 para sa T-shirt. Ang huling araw ng pagbabayad ay Mayo 20, 2026.',
        ],
        'preparedBy': 'MARIA CLARA ATENZA\nKalihim',
        'approvedBy': 'JUAN D. DE LA CRUZ\nPangulo',
      },
    ),
  ];

  static const String conclusionSynthesis =
      'Ang komunikasyong pasulat sa kontekstong pantrabaho at propesyonal ay nakatuon sa pagiging obhetibo, malinaw, tiyak, at magalang. Mahalagang sundin ang mga alituntunin tulad ng paggamit ng aktibong tinig, pag-check ng gramatika, at pag-iwas sa slang, emojis, at labis na emosyon.\n\nSa pamamagitan ng wastong pagsulat ng Professional Profile, Resume, Application Letter, Email, at Katitikan ng Pulong, natitiyak ang propesyonalismo at maayos na ugnayan sa lugar ng trabaho.';
}