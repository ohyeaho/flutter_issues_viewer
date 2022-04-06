import 'dart:convert';

import 'package:flutter_issues_viewer/models/github_data.dart';
import 'package:http/http.dart';

//　'$_url?state=all&sort=created&direction=desc&page=${lastPage + 1}&per_page=20${_label.isNotEmpty ? '&labels=$_label' : ''}'
class GithubApi {
  Future<List<GithubData>?> getGithubApi({String? state, String? label, String? sort, String? direction}) async {
    final DateTime oneYearsAgo = DateTime.now().add(const Duration(days: -365));

    String originalUrl = 'https://api.github.com/repos/flutter/flutter/issues';
    // String state = 'all';
    // String _label = label ?? '';
    // String sort = 'created';
    // String direction = 'desc';
    String since = '';
    // String since = '${DateFormat('yyyy-MM-dd').format(oneYearsAgo)}T${DateFormat('HH:mm:ss').format(oneYearsAgo)}Z';
    // int page = ;
    String url =
        '$originalUrl?state=$state${label!.isNotEmpty ? '&labels=$label' : ''}&sort=$sort&direction=$direction${since.isNotEmpty ? '&since=$since' : ''}&per_page=20';
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
        throw Exception('アクセスエラー エラーコード: ${result.statusCode} エラー内容: ${result.reasonPhrase}');
      }
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }
}
