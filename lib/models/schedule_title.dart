import 'package:anilib/models/title.dart';

class ScheduleTitle {
  int day;
  List<AniTitle> title;

  ScheduleTitle({
    required this.day,
    required this.title,
  });

  factory ScheduleTitle.fromJson(Map<String, dynamic> json) {
    return ScheduleTitle(
      day: json["day"],
      title: List.generate(
        (json["list"] as List).length,
        (index) => AniTitle.fromJson(json["list"][index]),
      ),
    );
  }
}
