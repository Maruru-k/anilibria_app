import 'package:anilib/models/name.dart';
import 'package:anilib/models/poster.dart';
import 'package:anilib/models/season.dart';
import 'package:anilib/models/status.dart';
import 'package:anilib/models/team.dart';
import 'package:anilib/models/type.dart';

class AniTitle {
  int id;
  String code;
  Name name;
  String? announce;
  Status status;
  Poster poster;
  Type type;
  List genres;
  Team team;
  Season season;
  String description;
  int inFavorites;

  AniTitle({
    required this.id,
    required this.code,
    required this.name,
    required this.announce,
    required this.status,
    required this.poster,
    required this.type,
    required this.genres,
    required this.team,
    required this.season,
    required this.description,
    required this.inFavorites,
  });

  factory AniTitle.fromJson(Map<String, dynamic> json) {
    return AniTitle(
      id: json["id"],
      code: json["code"],
      name: Name.fromJson(json["names"]),
      announce: json["announce"],
      status: Status.fromJson(json["status"]),
      poster: Poster.fromJson(json["posters"]),
      type: Type.fromJson(json["type"]),
      genres: json["genres"],
      team: Team.fromJson(json["team"]),
      season: Season.fromJson(json["season"]),
      description: json["description"],
      inFavorites: json["in_favorites"],
    );
  }
}
