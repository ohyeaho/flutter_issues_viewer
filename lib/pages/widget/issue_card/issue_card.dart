import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/pages/widget/issue_card/date.dart';
import 'package:flutter_issues_viewer/pages/widget/issue_card/description.dart';
import 'package:flutter_issues_viewer/pages/widget/issue_card/top_and_title.dart';

class IssueCard extends StatelessWidget {
  const IssueCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 250,
            child: Column(
              children: const [
                IssueCardTopAndTitle(),
                IssueCardDescription(),
                IssueCardDate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
