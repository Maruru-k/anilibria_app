// Dart imports:
import 'dart:convert';
import 'dart:developer';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:anilib/canstants.dart';

class AuthRepository {
  final String _url = baseUrl + "/public/login.php";

  AuthRepository();

  void fetch({required String mail, required String passwd}) async {
    final response = await http.post(Uri.parse(_url));
    print("asd");
    log("${response.request!.method} "
            "${response.statusCode} " +
        response.request!.url.toString());
    final jsonResponse = jsonDecode(response.body);
    final jsonResponseHead = response.headers;
    print(jsonResponse);
    print(jsonResponseHead);
  }
}
