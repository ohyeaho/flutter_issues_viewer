import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/pages/widget/issue_card/title.dart';
import 'package:flutter_issues_viewer/pages/widget/issue_card/top.dart';

class IssueCardTopAndTitle extends StatelessWidget {
  const IssueCardTopAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: const [
          IssueCardTop(),
          IssueCardTitle(),
        ],
      ),
    );
  }
}
