class Poster {
  String small;
  String medium;
  String original;

  Poster({required this.small, required this.medium, required this.original});

  factory Poster.fromJson(Map<String, dynamic> json) {
    return Poster(
      small: json["small"]["url"],
      medium: json["medium"]["url"],
      original: json["original"]["url"],
    );
  }
}
