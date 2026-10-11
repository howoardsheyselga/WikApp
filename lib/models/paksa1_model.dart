class ElementItem {
  final String title;
  final String description;

  const ElementItem({required this.title, required this.description});
}

class KatangianItem {
  final String title;
  final String description;

  const KatangianItem({required this.title, required this.description});
}

class ParaanItem {
  final String number;
  final String title;
  final String description;
  final String? badExample;
  final String? goodExample;
  final List<String>? subExamples;
  final String? dialogueRole1;
  final String? dialogueText1;
  final String? dialogueRole2;
  final String? dialogueText2;
  final String? audienceContext;

  const ParaanItem({
    required this.number,
    required this.title,
    required this.description,
    this.badExample,
    this.goodExample,
    this.subExamples,
    this.dialogueRole1,
    this.dialogueText1,
    this.dialogueRole2,
    this.dialogueText2,
    this.audienceContext,
  });
}

class SalikItem {
  final String number;
  final String title;
  final String description;
  final String sitwasyon;
  final String pagpapakahulugan;
  final String tukoyNaSalik;
  final String insight;

  const SalikItem({
    required this.number,
    required this.title,
    required this.description,
    required this.sitwasyon,
    required this.pagpapakahulugan,
    required this.tukoyNaSalik,
    required this.insight,
  });
}

class KahalagahanItem {
  final String number;
  final String title;
  final String description;
  final String sitwasyon;
  final String detail;
  final String insight;

  const KahalagahanItem({
    required this.number,
    required this.title,
    required this.description,
    required this.sitwasyon,
    required this.detail,
    required this.insight,
  });
}

class HudyatRow {
  final String uri;
  final String halimbawa;
  final String pangungusap;

  const HudyatRow({
    required this.uri,
    required this.halimbawa,
    required this.pangungusap,
  });
}

class EstratehiyaItem {
  final String number;
  final String title;
  final String description;
  final String halimbawa;

  const EstratehiyaItem({
    required this.number,
    required this.title,
    required this.description,
    required this.halimbawa,
  });
}

class DialogueLine {
  final String speaker;
  final String text;

  const DialogueLine({required this.speaker, required this.text});
}