import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/api/github_api.dart';
import 'package:flutter_issues_viewer/pages/widget/sort_button.dart';
import 'package:flutter_issues_viewer/pages/widget/tab_bar_widget.dart';
import 'package:flutter_issues_viewer/pages/widget/tab_widget.dart';
import 'package:flutter_issues_viewer/state/issues_state.dart';
import 'package:flutter_issues_viewer/values/string.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<Tab> labels = <Tab>[
    Tab(text: S().labelAll),
    Tab(text: S().labelWebView),
    Tab(text: S().labelSharedPreferences),
    Tab(text: S().labelWaitingCustomer),
    Tab(text: S().labelSevere),
    Tab(text: S().labelShare),
  ];

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<IssuesStateNotifier, IssuesState>(
      create: (context) => IssuesStateNotifier(GithubApi()),
      child: DefaultTabController(
        length: labels.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            elevation: 0,
            title: const Text(
              'Flutter Issues Viewer',
              style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Stack(
                children: [
                  TabBarWidget(labels: labels),
                  const SortButton(),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TabBarView(
              children: [
                TabWidget(label: ''),
                TabWidget(label: S().labelWebView),
                TabWidget(label: S().labelSharedPreferences),
                TabWidget(label: S().labelWaitingCustomer),
                TabWidget(label: S().labelSevere),
                TabWidget(label: S().labelShare),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
