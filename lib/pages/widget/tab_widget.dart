import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/github_api.dart';
import 'package:flutter_issues_viewer/models/github_data.dart';
import 'package:flutter_issues_viewer/pages/widget/infinity_list_view.dart';

class TabWidget extends StatefulWidget {
  final String? label;

  TabWidget({Key? key, this.label}) : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  List<GithubData>? flutterIssues;

  Future<List<GithubData>?> getGithubApi() async {
    final result = await GithubApi().getGithubApi(state: 'all', label: widget.label, sort: 'created', direction: 'desc');
    return result;
  }

  final int loadLength = 30;

  int _lastIndex = 0;

  Future<void> _getContents() async {
    await Future.delayed(const Duration(seconds: 3));

    final dataList = await getGithubApi();
    final newList = <GithubData>[];
    for (int i = _lastIndex; i < _lastIndex + loadLength; i++) {
      newList.addAll(dataList!);
    }
    _lastIndex += loadLength;
    print(newList);
    flutterIssues = newList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GithubApi().getGithubApi(state: 'all', label: widget.label, sort: 'created', direction: 'desc'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            flutterIssues = snapshot.data;
            return InfinityListView(flutterIssues: flutterIssues!, getContents: _getContents);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
