import 'dart:async';
import 'dart:convert';

import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class GithubApi {
  GithubApi({String? label}) : _label = label!;

  static const String originalUrl = 'https://api.github.com/repos/flutter/flutter/issues';
  final String _label;

  Future<List<GithubData>> fetch({String? state, bool? since, String? sort, String? direction, required int lastPage}) async {
    try {
      final result = await get(Uri.parse(
        '$originalUrl?state=$state${_label.isNotEmpty ? '&labels=$_label' : ''}&sort=$sort&direction=$direction${since == true ? '&since=${_format(since!)}' : ''}&per_page=20&page=${lastPage + 1}&',
      )).timeout(const Duration(seconds: 10), onTimeout: _timeout);
      if (result.statusCode == 200) {
        final issuesList = <GithubData>[];
        final decoded = await json.decode(result.body) as List<dynamic>;
        for (final item in decoded) {
          issuesList.add(GithubData.fromJson(item as Map<String, dynamic>));
        }
        return issuesList;
      } else {
        throw Exception('アクセスエラー エラーコード: ${result.statusCode}  エラー内容: ${result.reasonPhrase}');
      }
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  String? _format(bool since) {
    if (since == true) {
      final DateTime oneYearAgo = DateTime.now().add(const Duration(days: -365));
      final String newSince = '${DateFormat('yyyy-MM-dd').format(oneYearAgo)}T${DateFormat('HH:mm:ss').format(oneYearAgo)}Z';
      print(newSince);
      return newSince;
    }
    return null;
  }

  FutureOr<http.Response> _timeout() async {
    throw TimeoutException('タイムアウトが発生しました。');
  }
}
