import 'dart:convert';
import 'dart:developer';

import 'package:anilib/canstants.dart';
import 'package:anilib/models/schedule_title.dart';
import 'package:http/http.dart' as http;

class ScheduleTitleRepository {
  final String _url = baseUrl + "/v2/getSchedule";

  ScheduleTitleRepository();

  Future<List<ScheduleTitle>> fetch() async {
    final response = await http.get(Uri.parse(_url));

    log("${response.request!.method} " +
        "${response.statusCode} " +
        response.request!.url.toString());
    final List jsonResponse = jsonDecode(response.body);
    List<ScheduleTitle> scheduleTitles = [];
    for (var element in jsonResponse) {
      scheduleTitles.add(ScheduleTitle.fromJson(element));
    }
    return scheduleTitles;
  }
}
