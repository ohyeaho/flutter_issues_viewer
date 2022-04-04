import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/api/github_api.dart';
import 'package:flutter_issues_viewer/pages/widget/issue_list.dart';
import 'package:flutter_issues_viewer/state/issues_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatelessWidget {
  TabWidget({required String label}) : _label = label;

  final String _label;

  @override
  Widget build(BuildContext context) {
    print('TabWidgetビルド');
    // print(flutterIssues![0]);
    return NoLoadWhenChangeTab(
      child: StateNotifierProvider<IssuesStateNotifier, IssuesState>(
          create: (context) => IssuesStateNotifier(GithubApi(label: _label)),
          builder: (context, _) {
            final state = context.select((IssuesState value) => value);
            return IssueList(
              issuesDataList: state.issuesDataList!,
              isLoading: state.isLoading,
              init: state.init,
              pullRefresh: () async => _pullRefresh(context),
            );
          }),
    );
  }

  Future<void> _pullRefresh(BuildContext context) async {
    await context.read<IssuesStateNotifier>().refreshAndFetch();
  }
}

// タブ切り替え時のリロードを防ぐ
class NoLoadWhenChangeTab extends StatefulWidget {
  NoLoadWhenChangeTab({Key? key, this.child}) : super(key: key);
  final Widget? child;
  final NoLoadWhenChangeTabState _state = NoLoadWhenChangeTabState();

  @override
  State<StatefulWidget> createState() {
    return _state;
  }
}

class NoLoadWhenChangeTabState extends State<NoLoadWhenChangeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => true;
}
