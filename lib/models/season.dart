class Season {
  String? string;
  int code;
  int year;
  int weekDay;

  Season({
    required this.string,
    required this.code,
    required this.year,
    required this.weekDay,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      string: json["string"],
      code: json["code"],
      year: json["year"],
      weekDay: json["week_day"],
    );
  }
}
