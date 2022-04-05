import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:flutter_issues_viewer/pages/widget/issue_card/issue_card.dart';
import 'package:flutter_issues_viewer/pages/widget/loading.dart';
import 'package:flutter_issues_viewer/state/issues_state.dart';
import 'package:provider/provider.dart';

class IssueList extends StatelessWidget {
  IssueList({
    required List<GithubData> issuesDataList,
    required bool isLoading,
    required bool init,
    required Future<void> Function() pullRefresh,
  })  : _issuesDataList = issuesDataList,
        _isLoading = isLoading,
        _init = init,
        _pullRefresh = pullRefresh;

  final List<GithubData> _issuesDataList;
  final bool _isLoading;
  final bool _init;
  final Future<void> Function() _pullRefresh;

  @override
  Widget build(BuildContext context) {
    // 初期化されるまでローディング画面表示
    if (!_init) {
      return const Center(child: Loading());
    }

    // 空の場合、その旨を表示
    if (_issuesDataList.isEmpty) {
      return Center(
        child: TextButton(
          onPressed: () async => _pullRefresh(),
          child: const Text(
            'issueが見つかりませんでした。\n再読込みはタップ！',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        RefreshIndicator(
          onRefresh: () async => _pullRefresh(),
          child: ListView.builder(
              controller: context.watch<IssuesStateNotifier>().scrollController,
              itemCount: _issuesDataList.length,
              itemBuilder: (context, index) {
                return Provider.value(
                  value: _issuesDataList[index],
                  child: const IssueCard(),
                );
              }),
        ),
        if (_isLoading)
          const Positioned(
            bottom: 30,
            child: Loading(),
          )
      ],
    );
  }
}
