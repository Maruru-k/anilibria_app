class Status {
  String string;
  int code;

  Status({required this.string, required this.code});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      string: json["string"],
      code: json["code"],
    );
  }
}
