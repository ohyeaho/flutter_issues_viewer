import 'dart:convert';

import 'package:http/http.dart';

class GithubData {
  final int? number;
  final int? commentCount;
  final String title;
  final String? description;
  final DateTime createdAt;

  GithubData.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        commentCount = json['comments'],
        title = json['title'],
        description = json['body'],
        createdAt = DateTime.parse(json['created_at']);
}

class GithubApi {
  Future<List<GithubData>?> getGithubApi() async {
    String url = 'https://api.github.com/repos/flutter/flutter/issues';
    try {
      var result = await get(Uri.parse(url), headers: {'Accept': 'application/vnd.github.v3+json'});
      if (result.statusCode == 200) {
        final issuesList = <GithubData>[];
        final decoded = await jsonDecode(result.body) as List<dynamic>;
        for (final item in decoded) {
          issuesList.add(GithubData.fromJson(item));
        }
        return issuesList;
      } else {
        print('error');
        return null;
      }
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
