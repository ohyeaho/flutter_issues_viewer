import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:provider/provider.dart';

class IssueCardDescription extends StatelessWidget {
  const IssueCardDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final description = context.select((GithubData value) => value.description) ?? 'no description';

    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
