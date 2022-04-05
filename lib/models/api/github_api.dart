import 'dart:async';
import 'dart:convert';

import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//　'$_url?state=all&sort=created&direction=desc&page=${lastPage + 1}&per_page=20${_label.isNotEmpty ? '&labels=$_label' : ''}'
class GithubApi {
  // GithubApi({required String label}) : _label = label;
  // final String _label;
  // Future<List<GithubData>?> getGithubApi({String? state, /* String? label,*/ String? sort, String? direction, int? lastPage}) async {
  //   final DateTime oneYearsAgo = DateTime.now().add(const Duration(days: -365));
  //
  //   String urlOriginal = 'https://api.github.com/repos/flutter/flutter/issues';
  //   // String state = 'all';
  //   // String _label = label ?? '';
  //   // String sort = 'created';
  //   // String direction = 'desc';
  //   String since = '';
  //   // String since = '${DateFormat('yyyy-MM-dd').format(oneYearsAgo)}T${DateFormat('HH:mm:ss').format(oneYearsAgo)}Z';
  //   // int page = ;
  //   String url =
  //       '$urlOriginal?state=$state${_label.isNotEmpty ? '&labels=$_label' : ''}&sort=$sort&direction=$direction${since.isNotEmpty ? '&since=$since' : ''}&per_page=20';
  //   try {
  //     var result = await get(Uri.parse(url), headers: {'Accept': 'application/vnd.github.v3+json'});
  //     if (result.statusCode == 200) {
  //       final issuesList = <GithubData>[];
  //       final decoded = await jsonDecode(result.body) as List<dynamic>;
  //       for (final item in decoded) {
  //         issuesList.add(GithubData.fromJson(item));
  //       }
  //       return issuesList;
  //     } else {
  //       throw Exception('アクセスエラー エラーコード: ${result.statusCode} エラー内容: ${result.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     print('error: $e');
  //     rethrow;
  //   }
  // }

  GithubApi({required String label}) : _label = label;
  static const String _url = 'https://api.github.com/repos/flutter/flutter/issues';

  final String _label;

  Future<List<GithubData>> fetch({required int lastPage}) async {
    try {
      final response =
          await get(Uri.parse('$_url?state=all&sort=created&direction=desc&page=${lastPage + 1}&per_page=20${_label.isNotEmpty ? '&labels=$_label' : ''}'))
              .timeout(const Duration(seconds: 10), onTimeout: _timeout);
      if (response.statusCode == 200) {
        final list = <GithubData>[];
        final decoded = await json.decode(response.body) as List<dynamic>;
        for (final item in decoded) {
          list.add(GithubData.fromJson(item as Map<String, dynamic>));
        }
        return list;
      } else {
        throw Exception('アクセスに失敗しました。 response code:${response.statusCode}  reason:${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

  FutureOr<http.Response> _timeout() async {
    throw TimeoutException('タイムアウトが発生しました。');
  }
}
