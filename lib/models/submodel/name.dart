class Name {
  String ru;
  String en;
  String? alternative;

  Name({required this.ru, required this.en, this.alternative});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      ru: json["ru"],
      en: json["en"],
      alternative: json["alternative"],
    );
  }
}
