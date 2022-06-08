class Team {
  List voice;
  List translator;
  List editing;
  List decor;
  List timing;


  Team({
    required this.voice,
    required this.translator,
    required this.editing,
    required this.decor,
    required this.timing,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      voice: json["voice"],
      translator: json["translator"],
      editing: json["editing"],
      decor: json["decor"],
      timing: json["timing"],
    );
  }
}