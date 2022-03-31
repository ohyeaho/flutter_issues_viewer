import 'dart:convert';

import 'package:http/http.dart';

class GithubApi {
  final int? number;
  final int? commentCount;
  final String title;
  final String description;
  final DateTime? dateTime;

  GithubApi(
      {this.number,
      this.commentCount,
      this.title = '',
      this.description = '',
      this.dateTime});

  Future<GithubApi?> getGithubApi() async {
    String url = 'https://github.com/flutter/flutter/issues';
    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      GithubApi flutterIssues = GithubApi(
        number: data[0],
      );
      return flutterIssues;
    } catch (e) {
      return null;
    }
  }
}
