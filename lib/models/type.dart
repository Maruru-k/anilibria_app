class Type {
  String fullString;
  int code;
  String string;
  int? series;
  int? length;

  Type({
    required this.fullString,
    required this.code,
    required this.string,
    required this.series,
    required this.length,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      fullString: json["full_string"],
      code: json["code"],
      string: json["string"],
      series: json["series"],
      length: json["length"],
    );
  }
}
