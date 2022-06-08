import 'dart:convert';
import 'dart:developer';

import 'package:anilib/canstants.dart';
import 'package:anilib/models/title.dart';
import 'package:http/http.dart' as http;

class RandomTitleRepository {
  final String _url = baseUrl + "/v2/getRandomTitle";

  RandomTitleRepository();

  Future<AniTitle> fetch() async {
    final response = await http.get(Uri.parse(_url));
    log("${response.request!.method} " +
        "${response.statusCode} " +
        response.request!.url.toString());
    final jsonResponse = jsonDecode(response.body);
    return AniTitle.fromJson(jsonResponse);
  }
}
